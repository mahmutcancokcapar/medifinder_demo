import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/constants/app_strings.dart';
import 'package:medifinder_demo/core/router/app_routes.dart';
import 'package:medifinder_demo/core/utils/debouncer.dart';
import 'package:medifinder_demo/core/widgets/app_empty_state.dart';
import 'package:medifinder_demo/core/widgets/app_error_state.dart';
import 'package:medifinder_demo/core/widgets/app_search_field.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/filter_notifier.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/provider_list_notifier.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/active_filters_row.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/provider_list_item.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/provider_skeleton_item.dart';

class ProviderListScreen extends ConsumerStatefulWidget {
  const ProviderListScreen({super.key});

  @override
  ConsumerState<ProviderListScreen> createState() => _ProviderListScreenState();
}

class _ProviderListScreenState extends ConsumerState<ProviderListScreen> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  final _debouncer = Debouncer();
  bool _isSearchExpanded = false;

  void _toggleSearch() {
    setState(() {
      _isSearchExpanded = !_isSearchExpanded;
      if (!_isSearchExpanded) {
        _searchController.clear();
        _onClearSearch();
        FocusScope.of(context).unfocus();
      }
    });

    if (_isSearchExpanded) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _searchFocusNode.requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debouncer(() {
      ref.read(providerListNotifierProvider.notifier).onSearchChanged(query);
    });
  }

  void _onClearSearch() {
    ref.read(providerListNotifierProvider.notifier).onSearchChanged('');
  }

  void _onFilterTap() {
    FocusScope.of(context).unfocus();
    context.push(AppRoutes.filter);
  }

  void _onProviderTap(ProviderEntity provider) {
    FocusScope.of(context).unfocus();
    context.push(
      AppRoutes.providerDetailPath(provider.id),
      extra: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    final listAsync = ref.watch(providerListNotifierProvider);
    final filter = ref.watch(filterNotifierProvider);
    final filterCount = filter.activeCount;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AppHeader(
                filterCount: filterCount,
                onFilterTap: _onFilterTap,
                onSearchToggle: _toggleSearch,
                isSearchExpanded: _isSearchExpanded,
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox(width: double.infinity),
                secondChild: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.base,
                    0,
                    AppSpacing.base,
                    AppSpacing.sm,
                  ),
                  child: AppSearchField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    onChanged: _onSearchChanged,
                    onClear: _onClearSearch,
                  ),
                ),
                crossFadeState:
                    _isSearchExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 250),
              ),
              ActiveFiltersRow(
                filter: filter,
                onRemoveCountry: (c) {
                  ref.read(filterNotifierProvider.notifier).toggleCountry(c);
                  ref
                      .read(providerListNotifierProvider.notifier)
                      .invalidateFilters();
                },
                onRemoveCity: (c) {
                  ref.read(filterNotifierProvider.notifier).toggleCity(c);
                  ref
                      .read(providerListNotifierProvider.notifier)
                      .invalidateFilters();
                },
                onRemoveSpecialty: (s) {
                  ref.read(filterNotifierProvider.notifier).toggleSpecialty(s);
                  ref
                      .read(providerListNotifierProvider.notifier)
                      .invalidateFilters();
                },
                onClearAll: () {
                  ref.read(filterNotifierProvider.notifier).clearAll();
                  ref
                      .read(providerListNotifierProvider.notifier)
                      .invalidateFilters();
                },
              ),
              const Divider(),
              Expanded(
                child: listAsync.when(
                  loading: () => const _SkeletonList(),
                  error:
                      (error, _) => AppErrorState(
                        message: AppStrings.errorGeneric,
                        onRetry:
                            () => ref.invalidate(providerListNotifierProvider),
                      ),
                  data: (providers) {
                    if (providers.isEmpty) {
                      return AppEmptyState(
                        actionLabel:
                            filter.isEmpty ? null : AppStrings.clearFilters,
                        onAction:
                            filter.isEmpty
                                ? null
                                : () {
                                  ref
                                      .read(filterNotifierProvider.notifier)
                                      .clearAll();
                                  ref
                                      .read(
                                        providerListNotifierProvider.notifier,
                                      )
                                      .invalidateFilters();
                                },
                      );
                    }

                    return RefreshIndicator(
                      onRefresh:
                          () =>
                              ref
                                  .read(providerListNotifierProvider.notifier)
                                  .refresh(),
                      color: AppColors.primary,
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: providers.length,
                        separatorBuilder:
                            (_, __) => const Divider(
                              indent:
                                  AppSpacing.base +
                                  AppSpacing.avatarMd +
                                  AppSpacing.md,
                              height: 0,
                            ),
                        itemBuilder: (context, index) {
                          final provider = providers[index];
                          return ProviderListItem(
                                provider: provider,
                                onTap: () => _onProviderTap(provider),
                              )
                              .animate(delay: (index * 40).ms)
                              .fadeIn(duration: 280.ms)
                              .slideY(
                                begin: 0.06,
                                duration: 280.ms,
                                curve: Curves.easeOut,
                              );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppHeader extends StatelessWidget {
  const _AppHeader({
    required this.filterCount,
    required this.onFilterTap,
    required this.onSearchToggle,
    required this.isSearchExpanded,
  });

  final int filterCount;
  final VoidCallback onFilterTap;
  final VoidCallback onSearchToggle;
  final bool isSearchExpanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.base,
        AppSpacing.base,
        AppSpacing.sm,
        AppSpacing.sm,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  'assets/images/medifinder_logo.png',
                  height: 32,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.appName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        AppStrings.appTagline,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onSearchToggle,
            icon: Icon(
              isSearchExpanded
                  ? Icons.search_off_rounded
                  : Icons.search_rounded,
              color:
                  isSearchExpanded
                      ? AppColors.primary
                      : AppColors.textSecondary,
            ),
          ),
          _FilterButton(count: filterCount, onTap: onFilterTap),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({required this.count, required this.onTap});

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = count > 0;

    return IconButton(
      onPressed: onTap,
      icon: Badge(
        isLabelVisible: isActive,
        label: Text('$count'),
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.tune_rounded,
          color: isActive ? AppColors.primary : AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _SkeletonList extends StatelessWidget {
  const _SkeletonList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        6,
        (index) => Column(
          children: [
            const ProviderSkeletonItem(),
            if (index < 5) const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
