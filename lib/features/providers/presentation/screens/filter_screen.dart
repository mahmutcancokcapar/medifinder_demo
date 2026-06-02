import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/widgets/app_error_state.dart';
import 'package:medifinder_demo/core/widgets/app_loading_shimmer.dart';
import 'package:medifinder_demo/features/providers/domain/entities/filter_entity.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/filter_notifier.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/provider_list_notifier.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/provider_providers.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/filter_chip_group.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  late FilterEntity _draft;

  @override
  void initState() {
    super.initState();
    _draft = ref.read(filterNotifierProvider);
  }

  void _toggleCountry(String country) {
    final current = _draft.selectedCountries;
    setState(() {
      _draft = _draft.copyWith(
        selectedCountries:
            current.contains(country)
                ? current.where((c) => c != country).toList()
                : [...current, country],
      );
    });
  }

  void _toggleCity(String city) {
    final current = _draft.selectedCities;
    setState(() {
      _draft = _draft.copyWith(
        selectedCities:
            current.contains(city)
                ? current.where((c) => c != city).toList()
                : [...current, city],
      );
    });
  }

  void _toggleSpecialty(String specialty) {
    final current = _draft.selectedSpecialties;
    setState(() {
      _draft = _draft.copyWith(
        selectedSpecialties:
            current.contains(specialty)
                ? current.where((s) => s != specialty).toList()
                : [...current, specialty],
      );
    });
  }

  void _clearAll() {
    setState(() {
      _draft = FilterEntity.empty();
    });
  }

  void _applyFilters() {
    ref.read(filterNotifierProvider.notifier).applyFilter(_draft);
    ref.read(providerListNotifierProvider.notifier).invalidateFilters();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final optionsAsync = ref.watch(filterOptionsProvider);
    final theme = Theme.of(context);
    final countStr = _draft.activeCount > 0 ? ' (${_draft.activeCount})' : '';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: const Text('Filters'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: optionsAsync.when(
        loading: () => const _FilterSkeleton(),
        error:
            (error, _) => AppErrorState(
              message: 'Failed to load filter options.',
              onRetry: () => ref.invalidate(filterOptionsProvider),
            ),
        data: (options) {
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.base),
            children: [
              _FilterSection(
                title: 'Specialty',
                options: options.specialties,
                selectedOptions: _draft.selectedSpecialties,
                onOptionTap: _toggleSpecialty,
              ),
              const Gap(AppSpacing.lg),
              _FilterSection(
                title: 'Country',
                options: options.countries,
                selectedOptions: _draft.selectedCountries,
                onOptionTap: _toggleCountry,
              ),
              const Gap(AppSpacing.lg),
              _FilterSection(
                title: 'City',
                options: options.cities,
                selectedOptions: _draft.selectedCities,
                onOptionTap: _toggleCity,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.base),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _draft.isEmpty ? null : _clearAll,
                  child: const Text('Clear All'),
                ),
              ),
              const Gap(AppSpacing.md),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: _applyFilters,
                  child: Text('Show Results$countStr'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  const _FilterSection({
    required this.title,
    required this.options,
    required this.selectedOptions,
    required this.onOptionTap,
  });

  final String title;
  final List<String> options;
  final List<String> selectedOptions;
  final ValueChanged<String> onOptionTap;

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const Gap(AppSpacing.md),
        FilterChipGroup(
          options: options,
          selectedOptions: selectedOptions,
          onOptionTap: onOptionTap,
        ),
      ],
    );
  }
}

class _FilterSkeleton extends StatelessWidget {
  const _FilterSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppLoadingShimmer(
      child: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.base),
        itemCount: 3,
        separatorBuilder: (_, __) => const Gap(AppSpacing.xl),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimmerBox(height: 24, width: 120),
              const Gap(AppSpacing.md),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: List.generate(
                  5,
                  (_) => const ShimmerBox(
                    height: 40,
                    width: 80,
                    borderRadius: AppSpacing.radiusFull,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
