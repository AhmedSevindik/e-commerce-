import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../l10n/app_localizations.dart';

// ─────────────────────────────────────────────────────────────
//  STOCK BADGE
//  Stok durumunu gösteren etiket: yeterli / son birkaç / tükendi
//
//  Kullanım:
//    StockBadge.sufficient()
//    StockBadge.low(count: 3)
//    StockBadge.outOfStock()
// ─────────────────────────────────────────────────────────────

enum _StockVariant { sufficient, low, outOfStock }

class StockBadge extends StatelessWidget {
  const StockBadge.sufficient({super.key})
      : _variant = _StockVariant.sufficient,
        _count = null;

  const StockBadge.low({super.key, int? count})
      : _variant = _StockVariant.low,
        _count = count;

  const StockBadge.outOfStock({super.key})
      : _variant = _StockVariant.outOfStock,
        _count = null;

  final _StockVariant _variant;
  final int? _count;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final Color bg;
    final Color textColor;
    final String label;
    final IconData icon;

    switch (_variant) {
      case _StockVariant.sufficient:
        bg        = AppColors.successLight;
        textColor = AppColors.successDark;
        label     = l10n.inStock;
        icon      = Icons.check_circle_outline_rounded;
        break;
      case _StockVariant.low:
        bg        = AppColors.warningLight;
        textColor = AppColors.warningDark;
        label     = _count != null ? 'Son $_count ürün!' : l10n.limitedStock;
        icon      = Icons.warning_amber_rounded;
        break;
      case _StockVariant.outOfStock:
        bg        = AppColors.errorLight;
        textColor = AppColors.errorDark;
        label     = l10n.outOfStock;
        icon      = Icons.remove_circle_outline_rounded;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.small,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}