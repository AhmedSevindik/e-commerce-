import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  CATEGORY CHIP
//  Yatay scroll kategoriler için seçilebilir chip.
//
//  Kullanım:
//    CategoryChip(label: 'Elektronik', icon: Icons.devices_rounded)
//    CategoryChip(label: 'Giyim', isSelected: true, onTap: _onTap)
// ─────────────────────────────────────────────────────────────

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    this.icon,
    this.imageUrl,
    this.isSelected = false,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final String? imageUrl;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isSelected
        ? AppColors.primary
        : (isDark ? AppColors.darkTertiary : AppColors.surface);

    final labelColor = isSelected
        ? AppColors.textInverse
        : (isDark ? AppColors.textOnDark : AppColors.textSecondary);

    final iconColor = isSelected
        ? AppColors.textInverse
        : (isDark ? AppColors.textOnDark : AppColors.textTertiary);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        height: AppSizes.categoryChipHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: AppRadius.full,
          border: isSelected
              ? null
              : Border.all(
                  color: isDark
                      ? const Color(0xFF374151)
                      : AppColors.border,
                  width: 1,
                ),
          boxShadow: isSelected ? AppShadows.primaryGlow : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 15, color: iconColor),
              const SizedBox(width: AppSpacing.xs),
            ],
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: labelColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
