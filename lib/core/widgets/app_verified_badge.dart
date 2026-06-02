import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/constants/app_strings.dart';
import 'package:medifinder_demo/core/extensions/context_ext.dart';

class AppVerifiedBadge extends StatelessWidget {
  const AppVerifiedBadge({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return const Icon(
        Icons.verified_rounded,
        size: AppSpacing.iconSm,
        color: AppColors.verifiedBlue,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.verified_rounded,
          size: AppSpacing.iconSm,
          color: AppColors.verifiedBlue,
        ),
        const Gap(AppSpacing.xs),
        Text(
          AppStrings.verified,
          style: context.textTheme.labelSmall?.copyWith(
            color: AppColors.verifiedBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
