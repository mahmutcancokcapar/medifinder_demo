import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/core/constants/app_strings.dart';
import 'package:medifinder_demo/core/extensions/context_ext.dart';

class AppErrorState extends StatelessWidget {
  const AppErrorState({
    super.key,
    this.message = AppStrings.errorGeneric,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxxl),
        child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: AppColors.textTertiary,
                ),
                const Gap(AppSpacing.base),
                Text(
                  message,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (onRetry != null) ...[
                  const Gap(AppSpacing.xl),
                  ElevatedButton(
                    onPressed: onRetry,
                    child: const Text(AppStrings.errorRetry),
                  ),
                ],
              ],
            )
            .animate()
            .fadeIn(duration: 300.ms)
            .slideY(
              begin: 0.05,
              curve: Curves.easeOutCubic,
            ),
      ),
    );
  }
}
