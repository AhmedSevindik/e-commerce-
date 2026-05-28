import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../buttons/app_button.dart';

// ─────────────────────────────────────────────────────────────
//  EMPTY ORDERS
//  Sipariş geçmişi boş olduğunda gösterilir.
// ─────────────────────────────────────────────────────────────

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({super.key, this.onBrowse});
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
                color: isDark ? AppColors.darkTertiary : AppColors.accentLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.receipt_long_outlined,
                size: 64,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),

            Text(
              'Henüz Siparişin Yok',
              style: AppTextStyles.h2.copyWith(
                color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),

            Text(
              'İlk siparişini ver ve\nalışveriş keyfini çıkar!',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? const Color(0xFF9CA3AF) : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxxl),

            if (onBrowse != null)
              AppButton(
                label: 'Alışverişe Başla',
                icon: Icons.shopping_bag_outlined,
                onTap: onBrowse,
              ),
          ],
        ),
      ),
    );
  }
}
