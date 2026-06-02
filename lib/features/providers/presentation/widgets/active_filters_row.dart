import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/constants/app_spacing.dart';
import 'package:medifinder_demo/features/providers/domain/entities/filter_entity.dart';

class ActiveFiltersRow extends StatelessWidget {
  const ActiveFiltersRow({
    super.key,
    required this.filter,
    required this.onRemoveCountry,
    required this.onRemoveCity,
    required this.onRemoveSpecialty,
    required this.onClearAll,
  });

  final FilterEntity filter;
  final ValueChanged<String> onRemoveCountry;
  final ValueChanged<String> onRemoveCity;
  final ValueChanged<String> onRemoveSpecialty;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    if (filter.isEmpty) return const SizedBox.shrink();

    final chips = <_FilterChipData>[
      for (final c in filter.selectedCountries)
        _FilterChipData(label: c, onRemove: () => onRemoveCountry(c)),
      for (final c in filter.selectedCities)
        _FilterChipData(label: c, onRemove: () => onRemoveCity(c)),
      for (final s in filter.selectedSpecialties)
        _FilterChipData(label: s, onRemove: () => onRemoveSpecialty(s)),
    ];

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
              itemCount: chips.length,
              separatorBuilder: (context, index) => const Gap(AppSpacing.xs),
              itemBuilder: (context, index) {
                final chip = chips[index];
                return _ActiveChip(
                  label: chip.label,
                  onRemove: chip.onRemove,
                ).animate().fadeIn(duration: 180.ms).slideX(begin: 0.15);
              },
            ),
          ),
          const Gap(AppSpacing.xs),
        ],
      ),
    );
  }
}

class _FilterChipData {
  const _FilterChipData({required this.label, required this.onRemove});
  final String label;
  final VoidCallback onRemove;
}

class _ActiveChip extends StatelessWidget {
  const _ActiveChip({required this.label, required this.onRemove});

  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRemove,
      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs / 2,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
            const Gap(AppSpacing.xs),
            const Icon(
              Icons.close_rounded,
              size: 12,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
