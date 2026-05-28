import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  ADDRESS CARD
//  Adres listesi ve checkout akışında kullanılır.
//
//  Kullanım:
//    AddressCard(
//      title: 'Ev',
//      fullName: 'Ahmet Yılmaz',
//      address: 'Atatürk Cad. No:12, Kadıköy / İstanbul',
//      phone: '0555 555 55 55',
//      isSelected: true,
//      isDefault: true,
//      onTap: _select,
//      onEdit: _edit,
//      onDelete: _delete,
//    )
// ─────────────────────────────────────────────────────────────

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.title,
    required this.fullName,
    required this.address,
    required this.phone,
    this.isSelected = false,
    this.isDefault = false,
    this.showActions = true,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final String title;
  final String fullName;
  final String address;
  final String phone;
  final bool isSelected;
  final bool isDefault;
  final bool showActions;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final borderColor = isSelected
        ? AppColors.primary
        : (isDark ? const Color(0xFF374151) : AppColors.border);

    final bgColor = isSelected
        ? (isDark ? AppColors.primaryDark.withValues(alpha: 0.15) : AppColors.primaryLight)
        : (isDark ? AppColors.darkSecondary : AppColors.surfaceWhite);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: AppRadius.large,
          border: Border.all(
            color: borderColor,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected ? AppShadows.sm : AppShadows.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Başlık Satırı ─────────────────
            Row(
              children: [
                // Adres ikonu
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : (isDark ? AppColors.darkTertiary : AppColors.surface),
                    borderRadius: AppRadius.small,
                  ),
                  child: Icon(
                    _titleIcon,
                    size: 16,
                    color: isSelected
                        ? AppColors.textInverse
                        : (isDark ? AppColors.textOnDark : AppColors.textSecondary),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.h4.copyWith(
                      color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
                    ),
                  ),
                ),
                // Default badge
                if (isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.successLight,
                      borderRadius: AppRadius.full,
                    ),
                    child: Text(
                      'Varsayılan',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.successDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                // Seçim göstergesi
                if (onTap != null) ...[
                  const SizedBox(width: AppSpacing.sm),
                  AnimatedContainer(
                    duration: AppDurations.fast,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.border,
                        width: 1.5,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check_rounded,
                            size: 12,
                            color: AppColors.textInverse,
                          )
                        : null,
                  ),
                ],
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            // ── Ad Soyad ──────────────────────
            _InfoRow(
              icon: Icons.person_outline_rounded,
              text: fullName,
              isDark: isDark,
            ),
            const SizedBox(height: AppSpacing.xs),

            // ── Telefon ───────────────────────
            _InfoRow(
              icon: Icons.phone_outlined,
              text: phone,
              isDark: isDark,
            ),
            const SizedBox(height: AppSpacing.xs),

            // ── Adres ─────────────────────────
            _InfoRow(
              icon: Icons.location_on_outlined,
              text: address,
              isDark: isDark,
              maxLines: 2,
            ),

            // ── Aksiyonlar ────────────────────
            if (showActions && (onEdit != null || onDelete != null)) ...[
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onEdit != null)
                    _ActionButton(
                      label: 'Düzenle',
                      icon: Icons.edit_outlined,
                      color: AppColors.primary,
                      onTap: onEdit!,
                    ),
                  if (onEdit != null && onDelete != null)
                    const SizedBox(width: AppSpacing.sm),
                  if (onDelete != null)
                    _ActionButton(
                      label: 'Sil',
                      icon: Icons.delete_outline_rounded,
                      color: AppColors.error,
                      onTap: onDelete!,
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData get _titleIcon {
    final t = title.toLowerCase();
    if (t.contains('ev') || t.contains('home')) return Icons.home_outlined;
    if (t.contains('iş') || t.contains('ofis') || t.contains('work')) return Icons.work_outline_rounded;
    return Icons.location_on_outlined;
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    required this.isDark,
    this.maxLines = 1,
  });

  final IconData icon;
  final String text;
  final bool isDark;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 14,
          color: isDark ? AppColors.textSecondary : AppColors.textTertiary,
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(
              color: isDark ? const Color(0xFF9CA3AF) : AppColors.textSecondary,
              height: 1.4,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 3),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
