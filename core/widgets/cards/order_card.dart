import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  ORDER CARD
//
//  Using:
//    OrderCard(
//      orderNumber: '#12345',
//      date: '21 Mayıs 2026',
//      itemCount: 3,
//      total: 549.90,
//      status: OrderCardStatus.shipped,
//      imageUrls: ['https://...'],
//      onTap: _goDetail,
//    )
// ─────────────────────────────────────────────────────────────

enum OrderCardStatus { pending, confirmed, shipped, delivered, cancelled }

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.itemCount,
    required this.total,
    required this.status,
    this.imageUrls = const [],
    this.onTap,
    this.onTrack,
  });

  final String orderNumber;
  final String date;
  final int itemCount;
  final double total;
  final OrderCardStatus status;
  final List<String> imageUrls;
  final VoidCallback? onTap;
  final VoidCallback? onTrack;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSecondary : AppColors.surfaceWhite,
          borderRadius: AppRadius.large,
          border: Border.all(
            color: isDark ? const Color(0xFF374151) : AppColors.border,
            width: 0.5,
          ),
          boxShadow: isDark ? null : AppShadows.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Order no  ─
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderNumber,
                      style: AppTextStyles.h4.copyWith(
                        color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      date,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
                _StatusChip(status: status),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            // ── Product images ───────────────
            if (imageUrls.isNotEmpty) ...[
              _ProductThumbnails(imageUrls: imageUrls, isDark: isDark),
              const SizedBox(height: AppSpacing.md),
            ],

            // ── Ayırıcı ───────────────────────
            Divider(
              height: 1,
              thickness: AppSizes.dividerThickness,
              color: isDark ? const Color(0xFF374151) : AppColors.divider,
            ),
            const SizedBox(height: AppSpacing.md),

            // ── Alt Satır: Tutar + Aksiyon ────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$itemCount ürün',
                      style: AppTextStyles.caption,
                    ),
                    Text(
                      '${AppConstants.currency}${total.toStringAsFixed(2)}',
                      style: AppTextStyles.priceRegular.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (status == OrderCardStatus.shipped && onTrack != null)
                      _CardButton(
                        label: 'Takip Et',
                        icon: Icons.local_shipping_outlined,
                        color: AppColors.primary,
                        onTap: onTrack!,
                      ),
                    if (onTap != null) ...[
                      if (status == OrderCardStatus.shipped && onTrack != null)
                        const SizedBox(width: AppSpacing.sm),
                      _CardButton(
                        label: 'Detay',
                        icon: Icons.chevron_right_rounded,
                        color: isDark ? AppColors.textSecondary : AppColors.textSecondary,
                        onTap: onTap!,
                        iconTrailing: true,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── State Chip ─────────────────────────────────
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});
  final OrderCardStatus status;

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    final String label;
    final IconData icon;

    switch (status) {
      case OrderCardStatus.pending:
        bg = AppColors.warningLight; fg = AppColors.warningDark;
        label = 'Beklemede'; icon = Icons.hourglass_top_rounded;
        break;
      case OrderCardStatus.confirmed:
        bg = AppColors.premiumLight; fg = AppColors.premiumDark;
        label = 'Onaylandı'; icon = Icons.check_circle_outline_rounded;
        break;
      case OrderCardStatus.shipped:
        bg = const Color(0xFFE0F2FE); fg = const Color(0xFF0369A1);
        label = 'Kargoda'; icon = Icons.local_shipping_outlined;
        break;
      case OrderCardStatus.delivered:
        bg = AppColors.successLight; fg = AppColors.successDark;
        label = 'Teslim Edildi'; icon = Icons.verified_rounded;
        break;
      case OrderCardStatus.cancelled:
        bg = AppColors.errorLight; fg = AppColors.errorDark;
        label = 'İptal Edildi'; icon = Icons.cancel_outlined;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.full,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: fg),
          const SizedBox(width: 3),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: fg,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Product small images ───────────────────────
class _ProductThumbnails extends StatelessWidget {
  const _ProductThumbnails({
    required this.imageUrls,
    required this.isDark,
  });

  final List<String> imageUrls;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final shown = imageUrls.take(3).toList();
    final extra = imageUrls.length - 3;

    return Row(
      children: [
        ...shown.map(
          (url) => Padding(
            padding: const EdgeInsets.only(right: AppSpacing.xs),
            child: ClipRRect(
              borderRadius: AppRadius.small,
              child: Image.network(
                url,
                width: AppSizes.thumbnailMd,
                height: AppSizes.thumbnailMd,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: AppSizes.thumbnailMd,
                  height: AppSizes.thumbnailMd,
                  color: isDark ? AppColors.darkTertiary : AppColors.surface,
                  child: Icon(
                    Icons.image_outlined,
                    size: 20,
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (extra > 0)
          Container(
            width: AppSizes.thumbnailMd,
            height: AppSizes.thumbnailMd,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkTertiary : AppColors.surface,
              borderRadius: AppRadius.small,
            ),
            child: Center(
              child: Text(
                '+$extra',
                style: AppTextStyles.labelSmall.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ── inside card button ─────────────────────────────
class _CardButton extends StatelessWidget {
  const _CardButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.iconTrailing = false,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool iconTrailing;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      if (!iconTrailing) ...[
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 3),
      ],
      Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
      if (iconTrailing) ...[
        const SizedBox(width: 2),
        Icon(icon, size: 16, color: color),
      ],
    ];

    return GestureDetector(
      onTap: onTap,
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
