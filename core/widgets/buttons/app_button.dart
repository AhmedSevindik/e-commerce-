import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  APP BUTTON
//  Projedeki tüm buton varyantları tek widget'tan.
//
//  Kullanım:
//    AppButton(label: 'Sepete Ekle', onTap: _add)
//    AppButton.secondary(label: 'Favorilere Ekle', onTap: _fav)
//    AppButton.outlined(label: 'İptal', onTap: _cancel)
//    AppButton.text(label: 'Tümünü Gör', onTap: _seeAll)
//    AppButton(label: 'Yükleniyor', isLoading: true)
//    AppButton(label: 'Stok Yok', isDisabled: true)
//    AppButton.icon(label: 'Paylaş', icon: Icons.share, onTap: _share)
// ─────────────────────────────────────────────────────────────

enum _ButtonVariant { primary, secondary, outlined, ghost, text }

enum AppButtonSize { large, medium, small }

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.trailingIcon,
    this.size = AppButtonSize.large,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.borderRadius,
  }) : _variant = _ButtonVariant.primary;

  const AppButton.secondary({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.trailingIcon,
    this.size = AppButtonSize.large,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.borderRadius,
  }) : _variant = _ButtonVariant.secondary;

  const AppButton.outlined({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.trailingIcon,
    this.size = AppButtonSize.large,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.borderRadius,
  }) : _variant = _ButtonVariant.outlined;

  const AppButton.ghost({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.trailingIcon,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = false,
    this.borderRadius,
  }) : _variant = _ButtonVariant.ghost;

  const AppButton.text({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.trailingIcon,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = false,
    this.borderRadius,
  }) : _variant = _ButtonVariant.text;

  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final IconData? trailingIcon;
  final AppButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final bool isFullWidth;
  final BorderRadius? borderRadius;
  final _ButtonVariant _variant;

  // Named constructor: ikon + label (primary)
  factory AppButton.icon({
    Key? key,
    required String label,
    required IconData icon,
    VoidCallback? onTap,
    AppButtonSize size = AppButtonSize.large,
    bool isLoading = false,
    bool isDisabled = false,
    bool isFullWidth = true,
  }) =>
      AppButton(
        key: key,
        label: label,
        onTap: onTap,
        icon: icon,
        size: size,
        isLoading: isLoading,
        isDisabled: isDisabled,
        isFullWidth: isFullWidth,
      );

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: AppDurations.instant,
      reverseDuration: AppDurations.fast,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  bool get _isInteractive => !widget.isDisabled && !widget.isLoading;

  void _onTapDown(_) {
    if (_isInteractive) _pressController.forward();
  }

  void _onTapUp(_) {
    if (_isInteractive) {
      _pressController.reverse();
      widget.onTap?.call();
    }
  }

  void _onTapCancel() {
    _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final style = _resolveStyle(isDark);

    final child = ScaleTransition(
      scale: _scaleAnim,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          height: _height,
          width: widget.isFullWidth ? double.infinity : null,
          padding: _padding,
          decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius: widget.borderRadius ?? AppRadius.large,
            border: style.border,
            boxShadow: (!widget.isDisabled && !widget.isLoading)
                ? style.shadows
                : null,
          ),
          child: _buildContent(style),
        ),
      ),
    );

    return child;
  }

  Widget _buildContent(_ButtonStyle style) {
    if (widget.isLoading) {
      return Center(
        child: SizedBox(
          width: _loaderSize,
          height: _loaderSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(style.foregroundColor),
          ),
        ),
      );
    }

    final hasLeading = widget.icon != null;
    final hasTrailing = widget.trailingIcon != null;

    return Row(
      mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasLeading) ...[
          Icon(widget.icon, size: _iconSize, color: style.foregroundColor),
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(
          widget.label,
          style: _textStyle.copyWith(color: style.foregroundColor),
        ),
        if (hasTrailing) ...[
          const SizedBox(width: AppSpacing.sm),
          Icon(widget.trailingIcon, size: _iconSize, color: style.foregroundColor),
        ],
      ],
    );
  }

  // ── Boyut hesapları ───────────────────────
  double get _height => switch (widget.size) {
    AppButtonSize.large => AppSizes.buttonHeightLg,
    AppButtonSize.medium => AppSizes.buttonHeightMd,
    AppButtonSize.small => AppSizes.buttonHeightSm,
  };

  double get _iconSize => switch (widget.size) {
    AppButtonSize.large => 20,
    AppButtonSize.medium => 18,
    AppButtonSize.small => 16,
  };

  double get _loaderSize => switch (widget.size) {
    AppButtonSize.large => 22,
    AppButtonSize.medium => 18,
    AppButtonSize.small => 15,
  };

  EdgeInsets get _padding => switch (widget.size) {
    AppButtonSize.large =>
    const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
    AppButtonSize.medium =>
    const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
    AppButtonSize.small =>
    const EdgeInsets.symmetric(horizontal: AppSpacing.md),
  };

  TextStyle get _textStyle => switch (widget.size) {
    AppButtonSize.large => AppTextStyles.buttonLarge,
    AppButtonSize.medium => AppTextStyles.buttonMedium,
    AppButtonSize.small => AppTextStyles.buttonSmall,
  };

  // ── Renk / stil çözümleyici ───────────────
  _ButtonStyle _resolveStyle(bool isDark) {
    if (widget.isDisabled) {
      return _ButtonStyle(
        backgroundColor: isDark ? const Color(0xFF374151) : AppColors.border,
        foregroundColor: AppColors.textTertiary,
      );
    }

    return switch (widget._variant) {
      _ButtonVariant.primary => _ButtonStyle(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textInverse,
        shadows: AppShadows.primaryGlow,
      ),
      _ButtonVariant.secondary => _ButtonStyle(
        backgroundColor:
        isDark ? AppColors.darkTertiary : AppColors.primaryLight,
        foregroundColor: AppColors.primary,
      ),
      _ButtonVariant.outlined => _ButtonStyle(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      _ButtonVariant.ghost => _ButtonStyle(
        backgroundColor: isDark
            ? AppColors.textPrimary.withOpacity(0.06)
            : AppColors.surface,
        foregroundColor:
        isDark ? AppColors.textOnDark : AppColors.textPrimary,
      ),
      _ButtonVariant.text => _ButtonStyle(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
    };
  }
}

class _ButtonStyle {
  const _ButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    this.border,
    this.shadows,
  });
  final Color backgroundColor;
  final Color foregroundColor;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
}