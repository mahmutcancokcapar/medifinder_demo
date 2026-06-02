import 'package:flutter/material.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';

class AppRatingBar extends StatelessWidget {
  const AppRatingBar({
    super.key,
    required this.rating,
    this.size = AppSpacing.iconSm,
    this.spacing = 2,
  });

  final double rating;
  final double size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final filled = index < rating.floor();
        final partial = !filled && index < rating;

        return Padding(
          padding: EdgeInsets.only(right: index < 4 ? spacing : 0),
          child: Icon(
            partial ? Icons.star_half_rounded : Icons.star_rounded,
            size: size,
            color:
                filled || partial
                    ? AppColors.ratingGold
                    : AppColors.shimmerBase,
          ),
        );
      }),
    );
  }
}
