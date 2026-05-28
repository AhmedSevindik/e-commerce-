import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  APP ICON BUTTON
//  Toolbar, navbar ve kart içi ikon butonları.
//  Badge desteği var → sepet ikonu, bildirim ikonu için ideal.
//
//  Kullanım:
//    AppIconButton(icon: Icons.search, onTap: _search)
//    AppIconButton.filled(icon: Icons.favorite, onTap: _fav)
//    AppIconButton.outlined(icon: Icons.share, onTap: _share)
//    AppIconButton(
//      icon: Icons.shopping_cart_outlined,
//      badgeCount: 3,
//      onTap: _openCart,
//    )
// ─────────────────────────────────────────────────────────────

enum _IconButtonVariant { plain, filled, outlined, filledPrimary }

class AppIconButton extends StatefulWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 40,
    this.iconSize = 20,
    this.badgeCount,
    this.tooltip,
    this.color,
  }) : _variant = _IconButtonVariant.plain;

  const AppIconButton.filled({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 40,
    this.iconSize = 20,
    this.badgeCount,
    this.tooltip,
    this.color,
  }) : _variant = _IconButtonVariant.filled;

  const AppIconButton.outlined({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 40,
    this.iconSize = 20,
    this.badgeCount,
    this.tooltip,
    this.color,
  }) : _variant = _IconButtonVariant.outlined;

  const AppIconButton.primary({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 40,
    this.iconSize = 20,
    this.badgeCount,
    this.tooltip,
    this.color,
  }) : _variant = _IconButtonVariant.filledPrimary;

  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final int? badgeCount;
  final String? tooltip;

  /// Rengi override etmek için (plain ve filled varyantlarda)
  final Color? color;
  final _IconButtonVariant _variant;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: AppDurations.instant,
      reverseDuration: AppDurations.fast,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.88).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final resolved = _resolve(isDark);

    Widget button = ScaleTransition(
      scale: _scale,
      child: GestureDetector(
        onTapDown: (_) => _ctrl.forward(),
        onTapUp: (_) {
          _ctrl.reverse();
          widget.onTap?.call();
        },
        onTapCancel: () => _ctrl.reverse(),
        child: AnimatedContainer(
          duration: AppDurations.fast,
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: resolved.backgroundColor,
            shape: BoxShape.circle,
            border: resolved.border,
            boxShadow: resolved.shadows,
          ),
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: resolved.iconColor,
          ),
        ),
      ),
    );

    // Badge
    if (widget.badgeCount != null && widget.badgeCount! > 0) {
      button = Stack(
        clipBehavior: Clip.none,
        children: [
          button,
          Positioned(
            top: -2,
            right: -2,
            child: _Badge(count: widget.badgeCount!),
          ),
        ],
      );
    }

    if (widget.tooltip != null) {
      return Tooltip(message: widget.tooltip!, child: button);
    }
    return button;
  }

  _IconStyle _resolve(bool isDark) {
    return switch (widget._variant) {
      _IconButtonVariant.plain => _IconStyle(
        backgroundColor: Colors.transparent,
        iconColor: widget.color ??
            (isDark ? AppColors.textOnDark : AppColors.textSecondary),
      ),
      _IconButtonVariant.filled => _IconStyle(
        backgroundColor: isDark ? AppColors.darkTertiary : AppColors.surface,
        iconColor: widget.color ??
            (isDark ? AppColors.textOnDark : AppColors.textPrimary),
        shadows: isDark ? null : AppShadows.xs,
      ),
      _IconButtonVariant.outlined => _IconStyle(
        backgroundColor: Colors.transparent,
        iconColor: widget.color ??
            (isDark ? AppColors.textOnDark : AppColors.textSecondary),
        border: Border.all(
          color: isDark
              ? AppColors.textPrimary.withOpacity(0.15)
              : AppColors.border,
          width: 1,
        ),
      ),
      _IconButtonVariant.filledPrimary => _IconStyle(
        backgroundColor: AppColors.primary,
        iconColor: AppColors.textInverse,
        shadows: AppShadows.primaryGlow,
      ),
    };
  }
}

class _IconStyle {
  const _IconStyle({
    required this.backgroundColor,
    required this.iconColor,
    this.border,
    this.shadows,
  });
  final Color backgroundColor;
  final Color iconColor;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
}

// ── Badge ─────────────────────────────────────────────────────
class _Badge extends StatelessWidget {
  const _Badge({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    final label = count > 99 ? '99+' : '$count';
    return Container(
      constraints: const BoxConstraints(minWidth: AppSizes.badgeSize),
      height: AppSizes.badgeSize,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: AppColors.textInverse,
          fontFamily: 'Poppins',
          height: 1,
        ),
      ),
    );
  }
}