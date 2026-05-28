// lib/features/home/widgets/home_banner_slider.dart
// carousel_slider paketi kaldırıldı — PageView kullanılıyor

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_template/core/constants/constants.dart';
import 'package:e_commerce_app_template/core/l10n/app_localizations.dart';
import 'package:e_commerce_app_template/core/models/models.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({super.key, required this.banners});
  final List<BannerModel> banners;

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final PageController _controller =
      PageController(viewportFraction: 0.88);
  int _current = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final next = (_current + 1) % widget.banners.length;
      _controller.animateToPage(
        next,
        duration: AppDurations.normal,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return _BannerCard(banner: banner, context: context);
            },
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        // Dot indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.banners.length, (index) {
            final active = _current == index;
            return AnimatedContainer(
              duration: AppDurations.normal,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: active ? AppColors.primary : AppColors.border,
                borderRadius: BorderRadius.circular(999),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  const _BannerCard({required this.banner, required this.context});
  final BannerModel banner;
  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    final l10n = AppLocalizations.of(context);
    return Container(
      margin: const EdgeInsets.only(right: 12, bottom: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.78),
          ],
        ),
        borderRadius: BorderRadius.circular(34),
        boxShadow: AppShadows.lg,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.16),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                l10n.bannerBadge(banner.id),
                style: AppTextStyles.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Title
            Text(
              l10n.bannerTitle(banner.id),
              style: AppTextStyles.h2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.15,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            // Subtitle
            Text(
              l10n.bannerSubtitle(banner.id),
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white.withOpacity(0.92),
                height: 1.45,
              ),
            ),
            const Spacer(),
            // Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.seeAll,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}