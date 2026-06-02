import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/extensions/string_ext.dart';
import 'package:medifinder_demo/core/widgets/app_error_state.dart';
import 'package:medifinder_demo/core/widgets/app_loading_shimmer.dart';
import 'package:medifinder_demo/core/widgets/app_rating_bar.dart';
import 'package:medifinder_demo/core/widgets/app_verified_badge.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/provider_detail_notifier.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/contact_info_tile.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/provider_avatar.dart';

class ProviderDetailScreen extends ConsumerWidget {
  const ProviderDetailScreen({
    super.key,
    required this.id,
    this.provider,
  });

  final String id;
  final ProviderEntity? provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (provider != null) {
      return _ProviderDetailContent(provider: provider!);
    }

    final detailAsync = ref.watch(providerDetailNotifierProvider(id));

    return Scaffold(
      body: detailAsync.when(
        loading: () => const _DetailSkeleton(),
        error:
            (error, _) => AppErrorState(
              message: 'Failed to load provider details.',
              onRetry: () => ref.invalidate(providerDetailNotifierProvider(id)),
            ),
        data: (data) {
          if (data == null) {
            return const AppErrorState(message: 'Provider not found.');
          }
          return _ProviderDetailContent(provider: data);
        },
      ),
    );
  }
}

class _ProviderDetailContent extends StatelessWidget {
  const _ProviderDetailContent({required this.provider});

  final ProviderEntity provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: ColoredBox(
                color: AppColors.primaryLight.withValues(alpha: 0.5),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xl),
                    child: ProviderAvatar(
                      provider: provider,
                      size: 100,
                      heroTag: 'provider_${provider.id}_avatar',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                    _HeaderSection(provider: provider),
                    const Divider(height: 0),
                    if (!provider.bio.isNullOrEmpty) ...[
                      _BioSection(bio: provider.bio!),
                      const Divider(height: 0),
                    ],
                    _ContactSection(provider: provider),
                    const Divider(height: 0),
                    if (provider.tags.isNotEmpty) ...[
                      _TagsSection(tags: provider.tags),
                    ],
                    const Gap(AppSpacing.xxxl),
                  ]
                  .animate(interval: 50.ms)
                  .fadeIn(duration: 300.ms)
                  .slideY(begin: 0.05, duration: 300.ms, curve: Curves.easeOut),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.provider});

  final ProviderEntity provider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  provider.name,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (provider.isVerified) ...[
                const Gap(AppSpacing.sm),
                const AppVerifiedBadge(),
              ],
            ],
          ),
          const Gap(AppSpacing.xs),
          Text(
            '${provider.specialty} · ${provider.city}, ${provider.country}',
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const Gap(AppSpacing.md),
          _RatingRow(provider: provider),
        ],
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({required this.provider});

  final ProviderEntity provider;

  @override
  Widget build(BuildContext context) {
    if (provider.rating == 0) {
      return Text(
        'No ratings yet',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.textTertiary,
        ),
      );
    }

    final reviewLabel = provider.reviewCount == 1 ? 'review' : 'reviews';

    return Row(
      children: [
        Text(
          provider.rating.toStringAsFixed(1),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Gap(AppSpacing.sm),
        AppRatingBar(rating: provider.rating, size: 20),
        const Gap(AppSpacing.sm),
        Text(
          '(${provider.reviewCount} $reviewLabel)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _BioSection extends StatelessWidget {
  const _BioSection({required this.bio});

  final String bio;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(AppSpacing.sm),
          Text(
            bio,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({required this.provider});

  final ProviderEntity provider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.base,
            AppSpacing.base,
            AppSpacing.base,
            AppSpacing.sm,
          ),
          child: Text(
            'Contact Information',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        if (!provider.phone.isNullOrEmpty)
          ContactInfoTile(
            icon: Icons.phone_rounded,
            title: 'Phone',
            value: provider.phone!,
            onTap: () => launchUrl(Uri.parse('tel:${provider.phone}')),
          ),
        if (!provider.email.isNullOrEmpty)
          ContactInfoTile(
            icon: Icons.email_rounded,
            title: 'Email',
            value: provider.email!,
            onTap: () => launchUrl(Uri.parse('mailto:${provider.email}')),
          ),
        if (!provider.website.isNullOrEmpty)
          ContactInfoTile(
            icon: Icons.language_rounded,
            title: 'Website',
            value: provider.website!,
            onTap: () {
              var url = provider.website!;
              if (!url.startsWith('http://') && !url.startsWith('https://')) {
                url = 'https://$url';
              }
              launchUrl(Uri.parse(url));
            },
          ),
      ],
    );
  }
}

class _TagsSection extends StatelessWidget {
  const _TagsSection({required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tags',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children:
                tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusFull,
                      ),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Text(
                      '#$tag',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}

class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return const AppLoadingShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredBox(
            color: Colors.white,
            child: SizedBox(height: 280),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.base),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 32, width: 200),
                Gap(AppSpacing.md),
                ShimmerBox(height: 20, width: 150),
                Gap(AppSpacing.xl),
                ShimmerBox(height: 16, width: double.infinity),
                Gap(AppSpacing.sm),
                ShimmerBox(height: 16, width: double.infinity),
                Gap(AppSpacing.sm),
                ShimmerBox(height: 16, width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
