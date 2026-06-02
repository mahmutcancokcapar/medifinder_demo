import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/constants/app_strings.dart';
import 'package:medifinder_demo/core/extensions/context_ext.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    this.title = AppStrings.noResults,
    this.subtitle = AppStrings.noResultsSubtitle,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxxl),
        child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.search_off_rounded,
                  size: 48,
                  color: AppColors.textTertiary,
                ),
                const Gap(AppSpacing.base),
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(AppSpacing.xs),
                Text(
                  subtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (actionLabel != null && onAction != null) ...[
                  const Gap(AppSpacing.xl),
                  OutlinedButton(
                    onPressed: onAction,
                    child: Text(actionLabel!),
                  ),
                ],
              ],
            )
            .animate()
            .fadeIn(duration: 300.ms)
            .scale(
              begin: const Offset(0.95, 0.95),
              curve: Curves.easeOutCubic,
            ),
      ),
    );
  }
}
