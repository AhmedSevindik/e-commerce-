import 'package:flutter/material.dart';

import 'package:e_commerce_app_template/core/animations/page_transitions.dart';

import 'package:e_commerce_app_template/core/constants/constants.dart';
import 'package:e_commerce_app_template/core/l10n/app_localizations.dart';
import 'package:e_commerce_app_template/core/data/dummy_data.dart';
import 'package:e_commerce_app_template/core/models/models.dart';

import 'package:e_commerce_app_template/core/widgets/section_header.dart';

import 'package:e_commerce_app_template/features/home/widgets/home_banner_slider.dart';
import 'package:e_commerce_app_template/features/home/widgets/home_categories_row.dart';
import 'package:e_commerce_app_template/features/home/widgets/home_flash_sale.dart';

import 'package:e_commerce_app_template/features/product/screens/product_detail_screen.dart';
import 'package:e_commerce_app_template/features/product/screens/product_list_screen.dart';

import 'package:e_commerce_app_template/features/product/widgets/product_card.dart';
import 'package:e_commerce_app_template/features/product/widgets/product_card_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 1200),
          () {
        if (mounted) {
          setState(() {
            _loading = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    final List<ProductModel> featured =
        DummyData.featuredProducts;

    return Scaffold(
      backgroundColor:
      isDark
          ? AppColors.dark
          : AppColors.background,

      body: SafeArea(
        child: CustomScrollView(
          physics:
          const BouncingScrollPhysics(),

          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  14,
                  20,
                  28,
                ),

                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                      children: [
                        Text(
                          l10n.greeting,

                          style:
                          AppTextStyles
                              .bodyMedium
                              .copyWith(
                            color: isDark
                                ? AppColors.textOnDarkSub
                                : AppColors.textSecondary,
                          ),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                          l10n.discoverTrends,

                          style:
                          AppTextStyles.h3
                              .copyWith(
                            fontWeight:
                            FontWeight.bold,
                            color: isDark
                                ? AppColors.textOnDark
                                : AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Container(
                      width: 52,
                      height: 52,

                      decoration: BoxDecoration(
                        color:
                        isDark
                            ? AppColors
                            .darkSecondary
                            : Colors.white,

                        borderRadius:
                        BorderRadius.circular(
                          18,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(
                              0.05,
                            ),

                            blurRadius: 18,
                            offset:
                            const Offset(
                              0,
                              8,
                            ),
                          ),
                        ],
                      ),

                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.notifications,
                          );
                        },

                        icon: const Icon(
                          Icons
                              .notifications_none_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // BANNERS

            SliverToBoxAdapter(
              child:
              _loading
                  ? SizedBox(
                height: 210,

                child: ListView.separated(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  scrollDirection:
                  Axis.horizontal,

                  itemCount: 2,

                  separatorBuilder:
                      (_, __) {
                    return const SizedBox(
                      width: 16,
                    );
                  },

                  itemBuilder:
                      (_, __) {
                    return Container(
                      width:
                      MediaQuery.of(
                        context,
                      ).size.width *
                          0.82,

                      decoration:
                      BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(
                          34,
                        ),
                      ),

                      child:
                      const ProductCardShimmer(),
                    );
                  },
                ),
              )
                  : HomeBannerSlider(
                banners:
                DummyData.banners,
              ),
            ),

            // CATEGORIES

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.only(
                  top: 36,
                ),

                child: HomeCategories(
                  categories:
                  DummyData.categories,

                  onCategoryTap:
                      (category) {
                    Navigator.push(
                      context,

                      FadePageRoute(
                        page:
                        ProductListScreen(
                          categoryId:
                          category.id,

                          title:
                          l10n.categoryName(category.id),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // FLASH SALE

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.only(
                  top: 40,
                ),

                child: HomeFlashSale(
                  products:
                  DummyData.flashSaleProducts,
                ),
              ),
            ),

            // FEATURED HEADER

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.only(
                  top: 42,
                  bottom: 20,
                ),

                child: SectionHeader(
                  title: l10n.featured,

                  subtitle:
                  l10n.featuredSub,

                  actionText: l10n.seeAll,

                  onActionTap: () {
                    Navigator.push(
                      context,

                      FadePageRoute(
                        page: ProductListScreen(
                          title: l10n.featured,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // FEATURED GRID

            SliverPadding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              sliver:
              _loading
                  ? SliverGrid(
                delegate:
                SliverChildBuilderDelegate(
                      (_, __) {
                    return const ProductCardShimmer();
                  },

                  childCount: 4,
                ),

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio:
                  0.64,
                ),
              )
                  : SliverGrid(
                delegate:
                SliverChildBuilderDelegate(
                      (
                      context,
                      index,
                      ) {
                    final ProductModel p =
                    featured[index];

                    return ProductCard(
                      product:
                      p,

                      onTap: () {
                        Navigator.push(
                          context,

                          FadePageRoute(
                            page:
                            ProductDetailScreen(
                              productId:
                              p.id,
                            ),
                          ),
                        );
                      },
                    );
                  },

                  childCount:
                  featured.length,
                ),

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio:
                  0.64,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(
                height: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}