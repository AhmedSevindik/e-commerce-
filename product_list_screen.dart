import 'package:flutter/material.dart';

import 'package:e_commerce_app_template/core/animations/page_transitions.dart';

import 'package:e_commerce_app_template/core/constants/constants.dart';
import 'package:e_commerce_app_template/core/data/dummy_data.dart';
import 'package:e_commerce_app_template/core/models/models.dart';

import 'package:e_commerce_app_template/core/widgets/section_header.dart';

import 'package:e_commerce_app_template/features/product/screens/product_detail_screen.dart';

import 'package:e_commerce_app_template/features/product/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    super.key,
    this.categoryId,
    required this.title,
  });

  final String? categoryId;
  final String title;

  @override
  State<ProductListScreen> createState() =>
      _ProductListScreenState();
}

class _ProductListScreenState
    extends State<ProductListScreen> {
  final TextEditingController _searchCtrl =
  TextEditingController();

  final List<String> filters = [
    'Yeni',
    'Popüler',
    'İndirimli',
    'Premium',
  ];

  String selectedFilter = 'Popüler';

  late List<ProductModel> products;
  late List<ProductModel> filtered;

  @override
  void initState() {
    super.initState();

    products =
    widget.categoryId == null
        ? DummyData.products
        : DummyData.products
        .where(
          (e) =>
      e.category ==
          widget.categoryId,
    )
        .toList();

    filtered = products;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    final width =
        MediaQuery.of(context).size.width;

    final crossAxisCount =
    width > 900
        ? 4
        : width > 600
        ? 3
        : 2;

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
            // ─────────────────────────
            // TOP BAR
            // ─────────────────────────

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  AppSpacing.lg,
                  AppSpacing.xl,
                  AppSpacing.xl,
                ),

                child: Row(
                  children: [
                    _CircleButton(
                      icon:
                      Icons
                          .arrow_back_ios_new_rounded,

                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                    ),

                    const SizedBox(
                      width: AppSpacing.lg,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [
                          Text(
                            widget.title,

                            style:
                            AppTextStyles
                                .h3
                                .copyWith(
                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),

                          const SizedBox(
                            height:
                            AppSpacing
                                .xs,
                          ),

                          Text(
                            '${filtered.length} ürün bulundu',

                            style:
                            AppTextStyles
                                .caption
                                .copyWith(
                              color: AppColors
                                  .textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ─────────────────────────
            // SEARCH
            // ─────────────────────────

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal:
                  AppSpacing.xl,
                ),

                child: TextField(
                  controller:
                  _searchCtrl,

                  onChanged: _search,

                  decoration:
                  InputDecoration(
                    hintText:
                    'Ürün ara...',

                    prefixIcon:
                    const Icon(
                      Icons.search,
                    ),

                    filled: true,

                    fillColor:
                    isDark
                        ? AppColors
                        .darkSecondary
                        : Colors.white,

                    border:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(
                        22,
                      ),

                      borderSide:
                      BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // ─────────────────────────
            // FILTERS
            // ─────────────────────────

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.only(
                  top: AppSpacing.xl,
                ),

                child: SizedBox(
                  height: 46,

                  child:
                  ListView.separated(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal:
                      AppSpacing.xl,
                    ),

                    scrollDirection:
                    Axis.horizontal,

                    itemCount:
                    filters.length,

                    separatorBuilder:
                        (_, __) {
                      return const SizedBox(
                        width:
                        AppSpacing
                            .sm,
                      );
                    },

                    itemBuilder:
                        (_, index) {
                      final filter =
                      filters[index];

                      final selected =
                          selectedFilter ==
                              filter;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter =
                                filter;
                          });
                        },

                        child:
                        AnimatedContainer(
                          duration:
                          AppDurations
                              .normal,

                          padding:
                          const EdgeInsets.symmetric(
                            horizontal:
                            AppSpacing
                                .lg,

                            vertical:
                            AppSpacing
                                .sm,
                          ),

                          decoration:
                          BoxDecoration(
                            color:
                            selected
                                ? AppColors
                                .primary
                                : isDark
                                ? AppColors
                                .darkSecondary
                                : Colors
                                .white,

                            borderRadius:
                            BorderRadius.circular(
                              999,
                            ),

                            boxShadow:
                            selected
                                ? AppShadows
                                .sm
                                : [],
                          ),

                          child: Center(
                            child: Text(
                              filter,

                              style:
                              AppTextStyles
                                  .bodyMedium
                                  .copyWith(
                                color:
                                selected
                                    ? Colors
                                    .white
                                    : null,

                                fontWeight:
                                FontWeight
                                    .w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // ─────────────────────────
            // HEADER
            // ─────────────────────────

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.only(
                  top: 36,
                  bottom: 20,
                ),

                child: SectionHeader(
                  title:
                  'Tüm Ürünler',

                  subtitle:
                  'Premium seçilmiş koleksiyon',
                ),
              ),
            ),

            // ─────────────────────────
            // CONTENT
            // ─────────────────────────

            filtered.isEmpty
                ? SliverFillRemaining(
              hasScrollBody: false,

              child: Center(
                child: Padding(
                  padding:
                  const EdgeInsets.all(
                    AppSpacing
                        .xxxl,
                  ),

                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,

                    children: [
                      Container(
                        width: 110,
                        height: 110,

                        decoration:
                        BoxDecoration(
                          color: AppColors
                              .primary
                              .withOpacity(
                            0.08,
                          ),

                          shape:
                          BoxShape
                              .circle,
                        ),

                        child:
                        Icon(
                          Icons
                              .search_off_rounded,

                          size: 54,

                          color: AppColors
                              .primary,
                        ),
                      ),

                      const SizedBox(
                        height:
                        AppSpacing
                            .xl,
                      ),

                      Text(
                        'Ürün bulunamadı',

                        style:
                        AppTextStyles
                            .h3
                            .copyWith(
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),

                      const SizedBox(
                        height:
                        AppSpacing
                            .sm,
                      ),

                      Text(
                        'Farklı bir arama deneyin.',

                        textAlign:
                        TextAlign
                            .center,

                        style:
                        AppTextStyles
                            .bodyMedium
                            .copyWith(
                          color: AppColors
                              .textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                : SliverPadding(
              padding:
              const EdgeInsets.symmetric(
                horizontal:
                AppSpacing.xl,
              ),

              sliver: SliverGrid(
                delegate:
                SliverChildBuilderDelegate(
                      (
                      context,
                      index,
                      ) {
                    final p =
                    filtered[index];

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
                  filtered.length,
                ),

                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                  crossAxisCount,

                  mainAxisSpacing:
                  AppSpacing.lg,

                  crossAxisSpacing:
                  AppSpacing.lg,

                  childAspectRatio:
                  0.64,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _search(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filtered = products;

        return;
      }

      final q =
      query.toLowerCase();

      filtered =
          products.where((p) {
            return p.name
                .toLowerCase()
                .contains(q) ||
                p.brand
                    .toLowerCase()
                    .contains(q) ||
                p.category
                    .toLowerCase()
                    .contains(q);
          }).toList();
    });
  }
}

// ─────────────────────────────────────
// CIRCLE BUTTON
// ─────────────────────────────────────

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,

      borderRadius:
      BorderRadius.circular(18),

      child: InkWell(
        onTap: onTap,

        borderRadius:
        BorderRadius.circular(18),

        child: const SizedBox(
          width: 48,
          height: 48,

          child: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
    );
  }
}