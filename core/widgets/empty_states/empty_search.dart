import 'package:flutter/material.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  EMPTY SEARCH
//  Arama sonucu bulunamadığında gösterilir.
//
//  Kullanım:
//    EmptySearch(query: 'kırmızı elbise')
//    EmptySearch()  // query olmadan da kullanılabilir
// ─────────────────────────────────────────────────────────────

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key, this.query});
  final String? query;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkTertiary : AppColors.surface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 64,
                color: isDark ? AppColors.textSecondary : AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),

            Text(
              'Sonuç Bulunamadı',
              style: AppTextStyles.h2.copyWith(
                color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),

            Text(
              query != null
                  ? '"$query" için sonuç bulunamadı.\nFarklı anahtar kelime deneyin.'
                  : 'Aradığın ürün bulunamadı.\nFarklı anahtar kelime deneyin.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? const Color(0xFF9CA3AF) : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.xxl),

            // Öneri listesi
            _SuggestionRow(
              suggestions: const ['Elektronik', 'Giyim', 'Ayakkabı', 'Çanta'],
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestionRow extends StatelessWidget {
  const _SuggestionRow({
    required this.suggestions,
    required this.isDark,
  });

  final List<String> suggestions;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Popüler Aramalar',
          style: AppTextStyles.labelMedium.copyWith(
            color: isDark ? AppColors.textSecondary : AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          alignment: WrapAlignment.center,
          children: suggestions
              .map(
                (s) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkTertiary : AppColors.surface,
                    borderRadius: AppRadius.full,
                    border: Border.all(
                      color: isDark
                          ? const Color(0xFF374151)
                          : AppColors.border,
                    ),
                  ),
                  child: Text(
                    s,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: isDark
                          ? AppColors.textOnDark
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
