import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../l10n/app_localizations.dart';

// ─────────────────────────────────────────────────────────────
//  APP SEARCH BAR
//  Home ekranında pasif (tıklanınca yönlendirme),
//  Search ekranında aktif (gerçek input) olarak kullanılır.
//
//  Kullanım:
//    // Pasif — sadece tap ile search ekranına git
//    AppSearchBar(onTap: () => context.push(AppRoutes.search))
//
//    // Aktif — arama ekranında gerçek input
//    AppSearchBar.active(
//      controller: _ctrl,
//      onChanged: _onSearch,
//      onSubmitted: _onSubmit,
//      autofocus: true,
//    )
//
//    // Filtre butonu ile birlikte
//    AppSearchBar.active(
//      controller: _ctrl,
//      showFilter: true,
//      onFilterTap: _openFilterSheet,
//    )
// ─────────────────────────────────────────────────────────────

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    this.onTap,
    this.hint,
    this.showFilter = false,
    this.onFilterTap,
    this.activeFilterCount = 0,
  })  : _active = false,
        controller = null,
        focusNode = null,
        onChanged = null,
        onSubmitted = null,
        onClear = null,
        autofocus = false;

  const AppSearchBar.active({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.hint,
    this.autofocus = false,
    this.showFilter = false,
    this.onFilterTap,
    this.activeFilterCount = 0,
  })  : _active = true,
        onTap = null;

  final bool _active;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final String? hint;
  final bool autofocus;
  final bool showFilter;
  final VoidCallback? onFilterTap;
  final int activeFilterCount;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late TextEditingController _ctrl;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _ctrl = widget.controller ?? TextEditingController();
    _ctrl.addListener(() {
      final hasText = _ctrl.text.isNotEmpty;
      if (hasText != _hasText) setState(() => _hasText = hasText);
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) _ctrl.dispose();
    super.dispose();
  }

  void _clear() {
    _ctrl.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    final isDark    = Theme.of(context).brightness == Brightness.dark;
    final _hintText = widget.hint ?? AppLocalizations.of(context).searchHint;

    return Row(
      children: [
        Expanded(child: _buildBar(isDark, _hintText)),
        if (widget.showFilter) ...[
          const SizedBox(width: AppSpacing.sm),
          _FilterButton(
            onTap: widget.onFilterTap,
            activeCount: widget.activeFilterCount,
            isDark: isDark,
          ),
        ],
      ],
    );
  }

  Widget _buildBar(bool isDark, String hintText) {
    final bg = isDark ? AppColors.darkTertiary : AppColors.surface;
    final borderColor = isDark
        ? AppColors.textPrimary.withOpacity(0.1)
        : AppColors.border;

    // ── Pasif mod (sadece tap) ─────────────
    if (!widget._active) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: AppSizes.inputHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: AppRadius.large,
            border: Border.all(color: borderColor, width: 0.5),
          ),
          child: Row(
            children: [
              Icon(Icons.search_rounded, size: 20, color: AppColors.textTertiary),
              const SizedBox(width: AppSpacing.sm),
              Text(hintText, style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              )),
            ],
          ),
        ),
      );
    }

    // ── Aktif mod (gerçek input) ──────────
    return Container(
      height: AppSizes.inputHeight,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.large,
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: TextField(
        controller: _ctrl,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        textInputAction: TextInputAction.search,
        style: AppTextStyles.bodyMedium.copyWith(
          color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textTertiary,
          ),
          // Tema override — container'ın kendi arka planını koruyalım
          filled: false,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 20,
            color: AppColors.textTertiary,
          ),
          suffixIcon: AnimatedSwitcher(
            duration: AppDurations.fast,
            child: _hasText
                ? GestureDetector(
              key: const ValueKey('clear'),
              onTap: _clear,
              child: const Icon(
                Icons.cancel_rounded,
                size: 18,
                color: AppColors.textTertiary,
              ),
            )
                : const SizedBox.shrink(key: ValueKey('empty')),
          ),
        ),
      ),
    );
  }
}

// ── Filtre Butonu ─────────────────────────────────────────────
class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.isDark,
    this.onTap,
    this.activeCount = 0,
  });

  final bool isDark;
  final VoidCallback? onTap;
  final int activeCount;

  @override
  Widget build(BuildContext context) {
    final hasActive = activeCount > 0;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: AppSizes.inputHeight,
            height: AppSizes.inputHeight,
            decoration: BoxDecoration(
              color: hasActive
                  ? AppColors.primaryLight
                  : (isDark ? AppColors.darkTertiary : AppColors.surface),
              borderRadius: AppRadius.large,
              border: Border.all(
                color: hasActive
                    ? AppColors.primary
                    : (isDark
                    ? AppColors.textPrimary.withOpacity(0.1)
                    : AppColors.border),
                width: hasActive ? 1.5 : 0.5,
              ),
            ),
            child: Icon(
              Icons.tune_rounded,
              size: 20,
              color: hasActive ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
          if (hasActive)
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$activeCount',
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textInverse,
                    fontFamily: 'Poppins',
                    height: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  SEARCH HISTORY  — arama geçmişi listesi
//
//  Kullanım:
//    SearchHistoryList(
//      items: _history,
//      onTap: (q) => _search(q),
//      onDelete: (q) => _removeHistory(q),
//      onClearAll: _clearAllHistory,
//    )
// ─────────────────────────────────────────────────────────────

class SearchHistoryList extends StatelessWidget {
  const SearchHistoryList({
    super.key,
    required this.items,
    this.onTap,
    this.onDelete,
    this.onClearAll,
  });

  final List<String> items;
  final ValueChanged<String>? onTap;
  final ValueChanged<String>? onDelete;
  final VoidCallback? onClearAll;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Başlık + Temizle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Son Aramalar', style: AppTextStyles.h4),
              if (onClearAll != null)
                GestureDetector(
                  onTap: onClearAll,
                  child: Text(
                    'Temizle',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),

        // Liste
        ...items.map((query) => _HistoryItem(
          query: query,
          onTap: () => onTap?.call(query),
          onDelete: () => onDelete?.call(query),
          isDark: isDark,
        )),
      ],
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({
    required this.query,
    required this.isDark,
    this.onTap,
    this.onDelete,
  });

  final String query;
  final bool isDark;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pagePadding,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            Icon(
              Icons.history_rounded,
              size: 18,
              color: AppColors.textTertiary,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                query,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
                ),
              ),
            ),
            GestureDetector(
              onTap: onDelete,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xs),
                child: Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  SEARCH SUGGESTION CHIP ROW  — popüler aramalar
//
//  Kullanım:
//    SearchSuggestionRow(
//      suggestions: ['Elbise', 'Sneaker', 'Çanta'],
//      onTap: _search,
//    )
// ─────────────────────────────────────────────────────────────

class SearchSuggestionRow extends StatelessWidget {
  const SearchSuggestionRow({
    super.key,
    required this.suggestions,
    this.onTap,
    this.title = 'Popüler Aramalar',
  });

  final List<String> suggestions;
  final ValueChanged<String>? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
          child: Text(title, style: AppTextStyles.h4),
        ),
        const SizedBox(height: AppSpacing.sm),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
          child: Row(
            children: suggestions
                .map((s) => Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: _SuggestionChip(
                label: s,
                onTap: () => onTap?.call(s),
              ),
            ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  const _SuggestionChip({required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkTertiary : AppColors.surface,
          borderRadius: AppRadius.full,
          border: Border.all(
            color: isDark
                ? AppColors.textPrimary.withOpacity(0.1)
                : AppColors.border,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.trending_up_rounded, size: 13, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(label, style: AppTextStyles.labelMedium.copyWith(
              color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
            )),
          ],
        ),
      ),
    );
  }
}