import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  BANNER SHIMMER
//  Home ekranındaki banner/slider yüklenirken gösterilir.
//
//  Kullanım:
//    BannerShimmer()
// ─────────────────────────────────────────────────────────────

class BannerShimmer extends StatefulWidget {
  const BannerShimmer({super.key});

  @override
  State<BannerShimmer> createState() => _BannerShimmerState();
}

class _BannerShimmerState extends State<BannerShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
    _shimmer = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
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

    return AnimatedBuilder(
      animation: _shimmer,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner alanı
            _ShimmerBox(
              shimmerValue: _shimmer.value,
              height: AppSizes.bannerHeight,
              width: double.infinity,
              isDark: isDark,
              borderRadius: AppRadius.large,
            ),
            const SizedBox(height: AppSpacing.sm),

            // Dot indikatörler
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: _ShimmerBox(
                    shimmerValue: _shimmer.value,
                    height: 6,
                    width: i == 0 ? 20 : 6,
                    isDark: isDark,
                    borderRadius: AppRadius.full,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  LIST TILE SHIMMER
//  Genel liste öğeleri için shimmer skeleton.
//
//  Kullanım:
//    ListTileShimmer()
//    ListTileShimmer(showAvatar: false)
// ─────────────────────────────────────────────────────────────

class ListTileShimmer extends StatefulWidget {
  const ListTileShimmer({
    super.key,
    this.showAvatar = true,
    this.showSubtitle = true,
    this.showTrailing = false,
  });

  final bool showAvatar;
  final bool showSubtitle;
  final bool showTrailing;

  @override
  State<ListTileShimmer> createState() => _ListTileShimmerState();
}

class _ListTileShimmerState extends State<ListTileShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
    _shimmer = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
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

    return AnimatedBuilder(
      animation: _shimmer,
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.pagePadding,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              if (widget.showAvatar) ...[
                _ShimmerBox(
                  shimmerValue: _shimmer.value,
                  height: AppSizes.avatarLg,
                  width: AppSizes.avatarLg,
                  isDark: isDark,
                  borderRadius: AppRadius.full,
                ),
                const SizedBox(width: AppSpacing.md),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ShimmerBox(
                      shimmerValue: _shimmer.value,
                      height: 14,
                      width: double.infinity,
                      isDark: isDark,
                    ),
                    if (widget.showSubtitle) ...[
                      const SizedBox(height: AppSpacing.xs),
                      _ShimmerBox(
                        shimmerValue: _shimmer.value,
                        height: 11,
                        width: 180,
                        isDark: isDark,
                      ),
                    ],
                  ],
                ),
              ),
              if (widget.showTrailing) ...[
                const SizedBox(width: AppSpacing.md),
                _ShimmerBox(
                  shimmerValue: _shimmer.value,
                  height: 32,
                  width: 60,
                  isDark: isDark,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  SHARED SHIMMER BOX
// ─────────────────────────────────────────────────────────────

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    required this.shimmerValue,
    required this.height,
    required this.width,
    required this.isDark,
    this.borderRadius,
  });

  final double shimmerValue;
  final double height;
  final double width;
  final bool isDark;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final baseColor =
        isDark ? AppColors.darkTertiary : AppColors.shimmerBase;
    final highlightColor =
        isDark ? const Color(0xFF1E3A5F) : AppColors.shimmerHighlight;

    return ClipRRect(
      borderRadius: borderRadius ?? AppRadius.small,
      child: SizedBox(
        height: height,
        width: width,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [baseColor, highlightColor, baseColor],
                  stops: [
                    (shimmerValue - 0.5).clamp(0.0, 1.0),
                    shimmerValue.clamp(0.0, 1.0),
                    (shimmerValue + 0.5).clamp(0.0, 1.0),
                  ],
                ),
              ),
              child: const SizedBox.expand(),
            );
          },
        ),
      ),
    );
  }
}
