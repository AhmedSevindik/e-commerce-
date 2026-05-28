import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  DISCOUNT BADGE
//  İndirim yüzdesini gösteren kırmızı etiket.
//
//  Kullanım:
//    DiscountBadge(percent: 30)
//    DiscountBadge(percent: 50, size: DiscountBadgeSize.large)
// ─────────────────────────────────────────────────────────────

enum DiscountBadgeSize { small, medium, large }

class DiscountBadge extends StatelessWidget {
  const DiscountBadge({
    super.key,
    required this.percent,
    this.size = DiscountBadgeSize.medium,
    this.color,
  });

  final int percent;
  final DiscountBadgeSize size;
  final Color? color;

  double get _fontSize {
    switch (size) {
      case DiscountBadgeSize.small:  return 10;
      case DiscountBadgeSize.medium: return 12;
      case DiscountBadgeSize.large:  return 14;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case DiscountBadgeSize.small:
        return const EdgeInsets.symmetric(horizontal: 5, vertical: 2);
      case DiscountBadgeSize.medium:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs);
      case DiscountBadgeSize.large:
        return const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (percent <= 0) return const SizedBox.shrink();

    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: color ?? AppColors.error,
        borderRadius: AppRadius.small,
      ),
      child: Text(
        '-%$percent',
        style: TextStyle(
          fontSize: _fontSize,
          fontWeight: FontWeight.w700,
          color: AppColors.textInverse,
          height: 1,
        ),
      ),
    );
  }
}
