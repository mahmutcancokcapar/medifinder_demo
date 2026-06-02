import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/widgets/app_rating_bar.dart';
import 'package:medifinder_demo/core/widgets/app_verified_badge.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/presentation/widgets/provider_avatar.dart';

class ProviderListItem extends StatelessWidget {
  const ProviderListItem({
    super.key,
    required this.provider,
    required this.onTap,
  });

  final ProviderEntity provider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProviderAvatar(
              provider: provider,
              size: AppSpacing.avatarMd,
              heroTag: 'provider_${provider.id}_avatar',
            ),
            const Gap(AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          provider.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (provider.isVerified) ...[
                        const Gap(AppSpacing.xs),
                        const AppVerifiedBadge(compact: true),
                      ],
                    ],
                  ),
                  const Gap(AppSpacing.xs / 2),
                  Text(
                    '${provider.specialty} · ${provider.city}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSpacing.xs),
                  _RatingRow(provider: provider),
                ],
              ),
            ),
            const Gap(AppSpacing.sm),
            const Icon(
              Icons.chevron_right_rounded,
              size: AppSpacing.iconMd,
              color: AppColors.textTertiary,
            ),
          ],
        ),
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
        'Not rated',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.textTertiary,
        ),
      );
    }

    final reviewLabel = provider.reviewCount == 1 ? 'review' : 'reviews';

    return Row(
      children: [
        AppRatingBar(rating: provider.rating),
        const Gap(AppSpacing.xs),
        Text(
          '${provider.rating.toStringAsFixed(1)} '
          '(${provider.reviewCount} $reviewLabel)',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
