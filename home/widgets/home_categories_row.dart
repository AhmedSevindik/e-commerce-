import 'package:flutter/material.dart';

import 'package:e_commerce_app_template/core/constants/constants.dart';
import 'package:e_commerce_app_template/core/l10n/app_localizations.dart';
import 'package:e_commerce_app_template/core/models/models.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.categories,
    required this.onCategoryTap,
  });

  final List<CategoryModel> categories;

  final Function(CategoryModel category)
  onCategoryTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    // fallback emoji list
    final emojis = [
      '🛍️',
      '📱',
      '👗',
      '🏠',
      '💄',
      '🎧',
      '⌚',
      '🎮',
    ];

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
          ),

          child: Text(
            AppLocalizations.of(context).categories,

            style:
            AppTextStyles.h3.copyWith(
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(
          height: AppSpacing.xl,
        ),

        SizedBox(
          height: 165,

          child: ListView.separated(
            padding:
            const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
            ),

            physics:
            const BouncingScrollPhysics(),

            scrollDirection:
            Axis.horizontal,

            itemCount: categories.length,

            separatorBuilder: (_, __) {
              return const SizedBox(
                width: AppSpacing.lg,
              );
            },

            itemBuilder: (
                context,
                index,
                ) {
              final category =
              categories[index];

              final emoji =
              emojis[
              index %
                  emojis.length];

              return GestureDetector(
                onTap: () {
                  onCategoryTap(
                    category,
                  );
                },

                child: AnimatedContainer(
                  duration:
                  AppDurations.normal,

                  width: 92,

                  decoration: BoxDecoration(
                    color:
                    isDark
                        ? AppColors
                        .darkSecondary
                        : Colors.white,

                    borderRadius:
                    BorderRadius.circular(
                      28,
                    ),

                    boxShadow:
                    AppShadows.sm,
                  ),

                  child: Padding(
                    padding:
                    const EdgeInsets.all(
                      AppSpacing.md,
                    ),

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .center,

                      mainAxisSize:
                      MainAxisSize.min,

                      children: [
                        // ICON

                        Container(
                          width: 56,
                          height: 56,

                          decoration:
                          BoxDecoration(
                            color: AppColors
                                .primary
                                .withOpacity(
                              0.12,
                            ),

                            shape:
                            BoxShape.circle,
                          ),

                          child: Center(
                            child: Text(
                              emoji,

                              style:
                              const TextStyle(
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height:
                          AppSpacing.md,
                        ),

                        // NAME

                        Text(
                          AppLocalizations.of(context).categoryName(category.id),

                          maxLines: 1,

                          overflow:
                          TextOverflow
                              .ellipsis,

                          textAlign:
                          TextAlign.center,

                          style:
                          AppTextStyles
                              .caption
                              .copyWith(
                            fontWeight:
                            FontWeight
                                .w600,
                          ),
                        ),

                        const SizedBox(
                          height:
                          AppSpacing.xs,
                        ),

                        // COUNT

                        Flexible(
                          child: Text(
                            AppLocalizations.of(context).itemCount(category.productCount),

                            maxLines: 1,

                            overflow:
                            TextOverflow
                                .ellipsis,

                            textAlign:
                            TextAlign.center,

                            style:
                            AppTextStyles
                                .caption
                                .copyWith(
                              color: AppColors
                                  .textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}