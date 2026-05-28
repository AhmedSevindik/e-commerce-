import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../buttons/app_button.dart';

// ─────────────────────────────────────────────────────────────
//  EMPTY FAVORITES
//  Favori listesi boş olduğunda gösterilir.
// ─────────────────────────────────────────────────────────────

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key, this.onBrowse});
  final VoidCallback? onBrowse;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkTertiary : AppColors.errorLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border_rounded,
                size: 64,
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),

            Text(
              'Favorin Yok',
              style: AppTextStyles.h2.copyWith(
                color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),

            Text(
              'Beğendiğin ürünleri favorilere ekle,\nhızlıca ulaş.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? const Color(0xFF9CA3AF) : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxxl),

            if (onBrowse != null)
              AppButton(
                label: 'Ürünleri Keşfet',
                icon: Icons.explore_outlined,
                onTap: onBrowse,
              ),
          ],
        ),
      ),
    );
  }
}
