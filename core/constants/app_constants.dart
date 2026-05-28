class AppConstants {
  AppConstants._();

  // ── Sayfalama ──────────────────────────────
  static const int defaultPageSize = 20;
  static const int initialPage     = 1;

  // ── Sepet ──────────────────────────────────
  static const int maxCartItemQuantity = 10;

  // ── Arama ──────────────────────────────────
  static const int minSearchLength   = 2;
  static const int maxRecentSearches = 10;

  // ── Flash Sale ─────────────────────────────
  static const int flashSaleDuration = 7200; // 2 saat (saniye)

  // ── Rating ─────────────────────────────────
  static const double maxRating = 5.0;

  // ── Kargo ──────────────────────────────────
  static const double freeShippingMin = 500.0;
  static const double shippingFee     = 29.90;

  // ── Para Birimi ────────────────────────────
  static const String currency     = '₺';
  static const String currencyCode = 'TRY';

  // ── Görsel ─────────────────────────────────
  static const double imageQuality = 0.85;
}
