import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/widgets/app_loading_shimmer.dart';

class ProviderSkeletonItem extends StatelessWidget {
  const ProviderSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLoadingShimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerBox(
              height: AppSpacing.avatarMd,
              width: AppSpacing.avatarMd,
              borderRadius: AppSpacing.radiusFull,
            ),
            const Gap(AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(
                    height: 14,
                    width: MediaQuery.sizeOf(context).width * 0.45,
                  ),
                  const Gap(AppSpacing.xs),
                  ShimmerBox(
                    height: 12,
                    width: MediaQuery.sizeOf(context).width * 0.35,
                  ),
                  const Gap(AppSpacing.xs),
                  const ShimmerBox(height: 12, width: 96),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
