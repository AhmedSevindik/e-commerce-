import 'package:flutter/material.dart';
import "../../constants/constants.dart";
import "../../l10n/app_localizations.dart";

// ─────────────────────────────────────────────────────────────
//  SOCIAL BUTTON
//  Auth ekranlarındaki Google / Apple / sosyal giriş butonları.
//
//  Kullanım:
//    SocialButton.google(onTap: _signInGoogle)
//    SocialButton.apple(onTap: _signInApple)
//    SocialButton(provider: SocialProvider.google, onTap: ...)
// ─────────────────────────────────────────────────────────────

enum SocialProvider { google, apple }

class SocialButton extends StatefulWidget {
  const SocialButton({
    super.key,
    required this.provider,
    this.onTap,
    this.isLoading = false,
  });

  const SocialButton.google({
    super.key,
    this.onTap,
    this.isLoading = false,
  }) : provider = SocialProvider.google;

  const SocialButton.apple({
    super.key,
    this.onTap,
    this.isLoading = false,
  }) : provider = SocialProvider.apple;

  final SocialProvider provider;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.instant,
      reverseDuration: AppDurations.fast,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final config = _resolveConfig(isDark);

    return ScaleTransition(
      scale: _scale,
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) {
          _controller.reverse();
          if (!widget.isLoading) widget.onTap?.call();
        },
        onTapCancel: () => _controller.reverse(),
        child: AnimatedContainer(
          duration: AppDurations.fast,
          height: AppSizes.buttonHeightLg,
          decoration: BoxDecoration(
            color: config.backgroundColor,
            borderRadius: AppRadius.large,
            border: Border.all(
              color: isDark
                  ? AppColors.textPrimary.withValues(alpha: 0.12)
                  : AppColors.border,
              width: 1,
            ),
            boxShadow: isDark ? null : AppShadows.xs,
          ),
          child: widget.isLoading
              ? Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                AlwaysStoppedAnimation<Color>(config.foregroundColor),
              ),
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              _SocialLogo(provider: widget.provider, isDark: isDark),
              const SizedBox(width: AppSpacing.md),
              // Etiket
              Text(config.label, style: config.labelStyle),
            ],
          ),
        ),
      ),
    );
  }

  _SocialConfig _resolveConfig(bool isDark) {
    return switch (widget.provider) {
      SocialProvider.google => _SocialConfig(
        label: 'Google ile devam et',
        backgroundColor:
        isDark ? AppColors.darkSecondary : AppColors.surfaceWhite,
        foregroundColor:
        isDark ? AppColors.textOnDark : AppColors.textPrimary,
        labelStyle: AppTextStyles.buttonMedium.copyWith(
          color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
        ),
      ),
      SocialProvider.apple => _SocialConfig(
        label: 'Apple ile devam et',
        backgroundColor: isDark ? AppColors.surfaceWhite : AppColors.dark,
        foregroundColor: isDark ? AppColors.textPrimary : AppColors.textOnDark,
        labelStyle: AppTextStyles.buttonMedium.copyWith(
          color: isDark ? AppColors.textPrimary : AppColors.textOnDark,
        ),
      ),
    };
  }
}

class _SocialConfig {
  const _SocialConfig({
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.labelStyle,
  });
    final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final TextStyle labelStyle;
}

// ── Logo widget'ı ──────────────────────────────────────────────
// svg_flutter olmadan inline path ile çizilir.
// Gerçek projede: SvgPicture.asset(AppAssets.googleIcon)

class _SocialLogo extends StatelessWidget {
  const _SocialLogo({required this.provider, required this.isDark});
  final SocialProvider provider;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return switch (provider) {
      SocialProvider.google => _GoogleLogo(),
      SocialProvider.apple => Icon(
        Icons.apple_rounded,
        size: 22,
        color: isDark ? AppColors.textPrimary : AppColors.textInverse,
      ),
    };
  }
}

/// Google'ın dört renkli "G" harfi — SVG paketi gerekmeden
class _GoogleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GoogleGPainter()),
    );
  }
}

class _GoogleGPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    // Kırmızı (sağ üst)
    _drawArc(canvas, cx, cy, r, -30, 120, const Color(0xFFEA4335));
    // Sarı (sol üst + sol alt)
    _drawArc(canvas, cx, cy, r, -150, 120, const Color(0xFFFBBC05));
    // Yeşil (sol alt)
    _drawArc(canvas, cx, cy, r, -30 + 120, 60, const Color(0xFF34A853));
    // Mavi (sağ alt)
    _drawArc(canvas, cx, cy, r, -30 - 60, 60, const Color(0xFF4285F4));

    // Ortadaki beyaz boşluk
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(cx, cy), r * 0.6, whitePaint);

    // "G" yatay çubuğu
    final bluePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..strokeWidth = size.height * 0.18
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(cx, cy),
      Offset(cx + r * 0.8, cy),
      bluePaint,
    );
  }

  void _drawArc(Canvas canvas, double cx, double cy, double r, double startDeg,
      double sweepDeg, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: r);
    final path = Path()
      ..moveTo(cx, cy)
      ..arcTo(
        rect,
        startDeg * (3.14159265 / 180),
        sweepDeg * (3.14159265 / 180),
        false,
      )
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────
//  SOCIAL DIVIDER  ("veya şununla devam et")
//  Auth ekranlarında sosyal butonlarla klasik login arasına girer.
//
//  Kullanım:
//    const SocialDivider()
//    const SocialDivider(label: 'ya da')
// ─────────────────────────────────────────────────────────────

class SocialDivider extends StatelessWidget {
  const SocialDivider({
    super.key,
    this.label,
  });

  final String? label;

  @override
  Widget build(BuildContext context) {
    final isDark    = Theme.of(context).brightness == Brightness.dark;
    final lineColor = isDark
        ? AppColors.textPrimary.withValues(alpha: 0.12)
        : AppColors.border;
    final text      = label ?? AppLocalizations.of(context).continueWith;

    return Row(
      children: [
        Expanded(child: Divider(color: lineColor, thickness: 0.5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Text(text, style: AppTextStyles.caption),
        ),
        Expanded(child: Divider(color: lineColor, thickness: 0.5)),
      ],
    );
  }
}