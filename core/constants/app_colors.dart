import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Ana Renkler ────────────────────────────
  static const Color primary        = Color(0xFFE8480C);
  static const Color primaryLight   = Color(0xFFFEE9E0);
  static const Color primaryDark    = Color(0xFFA83300);

  static const Color accent         = Color(0xFFF5A623);
  static const Color accentLight    = Color(0xFFFEF5E0);
  static const Color accentDark     = Color(0xFF7A4F00);

  // ── Arka Plan ──────────────────────────────
  static const Color background     = Color(0xFFFFFAF5);
  static const Color surface        = Color(0xFFF3F4F6);
  static const Color surfaceWhite   = Color(0xFFFFFFFF);

  // ── Koyu Tema ──────────────────────────────
  static const Color dark           = Color(0xFF0F0F1A);  // ana arka plan: çok koyu mor-siyah
  static const Color darkSecondary  = Color(0xFF1C1C2E);  // kart yüzeyi: biraz daha açık
  static const Color darkTertiary   = Color(0xFF2A2A42);  // vurgu / input arka planı

  // ── Semantik ───────────────────────────────
  static const Color success        = Color(0xFF16A34A);
  static const Color successLight   = Color(0xFFDCFCE7);
  static const Color successDark    = Color(0xFF166534);

  static const Color error          = Color(0xFFDC2626);
  static const Color errorLight     = Color(0xFFFEE2E2);
  static const Color errorDark      = Color(0xFF991B1B);

  static const Color warning        = Color(0xFFD97706);
  static const Color warningLight   = Color(0xFFFEF3C7);
  static const Color warningDark    = Color(0xFF92400E);

  static const Color premium        = Color(0xFF6366F1);
  static const Color premiumLight   = Color(0xFFEEF2FF);
  static const Color premiumDark    = Color(0xFF3730A3);

  // ── Metin ──────────────────────────────────
  static const Color textPrimary    = Color(0xFF111827);
  static const Color textSecondary  = Color(0xFF6B7280);
  static const Color textTertiary   = Color(0xFF9CA3AF);
  static const Color textInverse    = Color(0xFFFFFFFF);
  static const Color textOnDark     = Color(0xFFF1F5F9);   // primary text on dark
  static const Color textOnDarkSub  = Color(0xFF94A3B8);   // secondary text on dark
  static const Color textOnDarkMuted= Color(0xFF64748B);   // muted/tertiary on dark

  // ── Kenarlık ───────────────────────────────
  static const Color border         = Color(0xFFE5E7EB);
  static const Color borderLight    = Color(0xFFF9FAFB);
  static const Color divider        = Color(0xFFF3F4F6);
  static const Color borderDark     = Color(0xFF2E2E46);   // dark modda ince ayraçlar
  static const Color dividerDark    = Color(0xFF252538);   // dark modda divider

  // ── Shimmer ────────────────────────────────
  static const Color shimmerBase      = Color(0xFFE5E7EB);
  static const Color shimmerHighlight = Color(0xFFF9FAFB);

  // ── Rating & Overlay ───────────────────────
  static const Color starFilled     = Color(0xFFF5A623);
  static const Color starEmpty      = Color(0xFFE5E7EB);
  static const Color overlay        = Color(0x80000000);
  static const Color overlayLight   = Color(0x1A000000);
}