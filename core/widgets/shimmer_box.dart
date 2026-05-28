import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:e_commerce_app_template/core/constants/constants.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.radius = 16,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Shimmer.fromColors(
      baseColor:
      isDark
          ? AppColors.darkSecondary
          : Colors.grey.shade300,

      highlightColor:
      isDark
          ? AppColors.dark
          : Colors.grey.shade100,

      child: Container(
        width: width,
        height: height,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(
            radius,
          ),
        ),
      ),
    );
  }
}