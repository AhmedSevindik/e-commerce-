import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../l10n/app_localizations.dart';
import '../buttons/app_button.dart';

// ─────────────────────────────────────────────────────────────
//  EMPTY CART
//  Sepet boş olduğunda gösterilir.
//
//  Kullanım:
//    EmptyCart(onBrowse: () => Navigator.pushNamed(context, AppRoutes.home))
// ─────────────────────────────────────────────────────────────

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key, this.onBrowse});
  final VoidCallback? onBrowse;

  @override
  Widget build(BuildContext context) {
    final l10n  = AppLocalizations.of(context);
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
                color: isDark ? AppColors.darkTertiary : AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 64,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),

            Text(
              l10n.emptyCart,
              style: AppTextStyles.h2.copyWith(
                color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),

            Text(
              l10n.emptyCartSub,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? const Color(0xFF9CA3AF) : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxxl),

            if (onBrowse != null)
              AppButton(
                label: l10n.continueShopping,
                icon: Icons.shopping_bag_outlined,
                onTap: onBrowse,
              ),
          ],
        ),
      ),
    );
  }
}