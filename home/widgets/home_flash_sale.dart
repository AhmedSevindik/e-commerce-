import 'package:flutter/material.dart';

import 'package:e_commerce_app_template/core/animations/page_transitions.dart';

import 'package:e_commerce_app_template/core/constants/constants.dart';
import 'package:e_commerce_app_template/core/l10n/app_localizations.dart';
import 'package:e_commerce_app_template/core/models/models.dart';

import 'package:e_commerce_app_template/core/widgets/section_header.dart';

import 'package:e_commerce_app_template/features/product/screens/product_detail_screen.dart';

import 'package:e_commerce_app_template/features/product/widgets/product_card.dart';

class HomeFlashSale extends StatelessWidget {
  const HomeFlashSale({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ─────────────────────────────
        // HEADER
        // ─────────────────────────────

        SectionHeader(
          title: AppLocalizations.of(context).flashSale,

          subtitle: AppLocalizations.of(context).limitedStock,

          actionText: AppLocalizations.of(context).seeAll,

          onActionTap: () => Navigator.of(context, rootNavigator: true).pushNamed( AppRoutes.productList), // ✅ FIX #7
        ),

        const SizedBox(height: 20),

        // ─────────────────────────────
        // PRODUCTS
        // ─────────────────────────────

        SizedBox(
          height: 305,

          child: ListView.separated(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            physics:
            const BouncingScrollPhysics(),

            scrollDirection:
            Axis.horizontal,

            itemCount: products.length,

            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 18,
              );
            },

            itemBuilder: (
                context,
                index,
                ) {
              final ProductModel p =
              products[index];

              return SizedBox(
                width: 185,

                child: ProductCard(
                  product:
                  p,

                  onTap: () {
                    Navigator.push(
                      context,

                      FadePageRoute(
                        page:
                        ProductDetailScreen(
                          productId: p.id,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}