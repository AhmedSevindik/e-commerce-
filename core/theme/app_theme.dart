import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce_app_template/core/constants/app_colors.dart';
import 'package:e_commerce_app_template/core/constants/app_text_styles.dart';
import 'package:e_commerce_app_template/core/constants/app_radius.dart';
import 'package:e_commerce_app_template/core/constants/app_sizes.dart';
import 'package:e_commerce_app_template/core/constants/app_spacing.dart';

// ─────────────────────────────────────────────
//  APP THEME
//  Light & Dark mod destekli tam tema sistemi
// ─────────────────────────────────────────────

class AppTheme {
  AppTheme._();

  // ══════════════════════════════════════════
  //  LIGHT THEME
  // ══════════════════════════════════════════
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: _lightColorScheme,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Poppins',

        // ── AppBar ───────────────────────────
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0.5,
          backgroundColor: AppColors.surfaceWhite,
          foregroundColor: AppColors.textPrimary,
          centerTitle: true,
          titleTextStyle: AppTextStyles.h3,
          iconTheme: const IconThemeData(
            color: AppColors.textPrimary,
            size: AppSizes.buttonHeightXs,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          shape: const Border(
            bottom: BorderSide(color: AppColors.border, width: 0.5),
          ),
        ),

        // ── Bottom Navigation Bar ────────────
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.surfaceWhite,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textTertiary,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),

        // ── Elevated Button ──────────────────
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textInverse,
            disabledBackgroundColor: AppColors.border,
            disabledForegroundColor: AppColors.textTertiary,
            elevation: 0,
            minimumSize: const Size.fromHeight(AppSizes.buttonHeightLg),
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.large),
            textStyle: AppTextStyles.buttonLarge,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          ),
        ),

        // ── Outlined Button ──────────────────
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 1.5),
            minimumSize: const Size.fromHeight(AppSizes.buttonHeightLg),
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.large),
            textStyle: AppTextStyles.buttonLarge,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          ),
        ),

        // ── Text Button ──────────────────────
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.buttonMedium,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
          ),
        ),

        // ── Input Decoration ─────────────────
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textTertiary,
          ),
          labelStyle: AppTextStyles.labelLarge,
          floatingLabelStyle: AppTextStyles.labelMedium.copyWith(
            color: AppColors.primary,
          ),
          errorStyle: AppTextStyles.caption.copyWith(
            color: AppColors.error,
          ),
          border: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.border, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.border, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.error, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
        ),

        // ── Card ─────────────────────────────
        cardTheme: CardThemeData(
          color: AppColors.surfaceWhite,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.large,
            side: const BorderSide(color: AppColors.border, width: 0.5),
          ),
        ),

        // ── Chip ─────────────────────────────
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.surface,
          selectedColor: AppColors.primaryLight,
          labelStyle: AppTextStyles.labelMedium,
          side: const BorderSide(color: AppColors.border, width: 0.5),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.full),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
        ),

        // ── Divider ──────────────────────────
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,
          thickness: AppSizes.dividerThickness,
          space: 0,
        ),

        // ── Bottom Sheet ─────────────────────
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.surfaceWhite,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.topXLarge),
          elevation: 0,
          modalElevation: 0,
          showDragHandle: true,
          dragHandleColor: AppColors.border,
          dragHandleSize: Size(40, 4),
        ),

        // ── Dialog ───────────────────────────
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.surfaceWhite,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.xLarge),
          titleTextStyle: AppTextStyles.h3,
          contentTextStyle: AppTextStyles.bodyMedium,
        ),

        // ── Snackbar ─────────────────────────
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.dark,
          contentTextStyle: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textInverse,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.medium),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          insetPadding: const EdgeInsets.all(AppSpacing.lg),
        ),

        // ── Tab Bar ──────────────────────────
        tabBarTheme: TabBarThemeData(
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          labelStyle: AppTextStyles.labelLarge,
          unselectedLabelStyle: AppTextStyles.labelLarge,
          indicatorColor: AppColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: AppColors.border,
          dividerHeight: 0.5,
        ),

        // ── Checkbox ─────────────────────────
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return AppColors.primary;
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(AppColors.textInverse),
          side: const BorderSide(color: AppColors.border, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),

        // ── Radio ────────────────────────────
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return AppColors.primary;
            return AppColors.border;
          }),
        ),

        // ── Switch ───────────────────────────
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.textInverse;
            }
            return AppColors.textTertiary;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return AppColors.primary;
            return AppColors.border;
          }),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        ),

        // ── Slider ───────────────────────────
        sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.primary,
          inactiveTrackColor: AppColors.border,
          thumbColor: AppColors.primary,
          overlayColor: AppColors.primaryLight,
          trackHeight: 3,
        ),

        // ── Progress Indicator ───────────────
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
          linearTrackColor: AppColors.border,
          circularTrackColor: AppColors.border,
        ),

        // ── Icon ─────────────────────────────
        iconTheme: const IconThemeData(
          color: AppColors.textSecondary,
          size: 24,
        ),

        // ── List Tile ────────────────────────
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          minLeadingWidth: 0,
          iconColor: AppColors.textSecondary,
          titleTextStyle: AppTextStyles.bodyLarge,
          subtitleTextStyle: AppTextStyles.bodySmall,
        ),

        // ── Text ─────────────────────────────
        textTheme: _textTheme(AppColors.textPrimary),
      );

  // ══════════════════════════════════════════
  //  DARK THEME
  // ══════════════════════════════════════════
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: _darkColorScheme,
        scaffoldBackgroundColor: AppColors.dark,
        fontFamily: 'Poppins',

        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0.5,
          backgroundColor: AppColors.darkSecondary,
          foregroundColor: AppColors.textOnDark,
          centerTitle: true,
          titleTextStyle: AppTextStyles.h3.copyWith(color: AppColors.textOnDark),
          iconTheme: const IconThemeData(color: AppColors.textOnDark, size: 24),
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.textPrimary.withOpacity(0.1),
              width: 0.5,
            ),
          ),
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkSecondary,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Color(0xFF6B7280),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textInverse,
            disabledBackgroundColor: const Color(0xFF374151),
            disabledForegroundColor: const Color(0xFF6B7280),
            elevation: 0,
            minimumSize: const Size.fromHeight(AppSizes.buttonHeightLg),
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.large),
            textStyle: AppTextStyles.buttonLarge,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 1.5),
            minimumSize: const Size.fromHeight(AppSizes.buttonHeightLg),
            shape: const RoundedRectangleBorder(borderRadius: AppRadius.large),
            textStyle: AppTextStyles.buttonLarge,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: AppTextStyles.buttonMedium,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkTertiary,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: const Color(0xFF6B7280),
          ),
          labelStyle: AppTextStyles.labelLarge.copyWith(
            color: AppColors.textOnDark,
          ),
          border: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: BorderSide(
              color: AppColors.textPrimary.withOpacity(0.15),
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: BorderSide(
              color: AppColors.textPrimary.withOpacity(0.15),
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.error, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppRadius.large,
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
        ),

        cardTheme: CardThemeData(
          color: AppColors.darkSecondary,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.large,
            side: BorderSide(
              color: AppColors.textPrimary.withOpacity(0.1),
              width: 0.5,
            ),
          ),
        ),

        chipTheme: ChipThemeData(
          backgroundColor: AppColors.darkTertiary,
          selectedColor: AppColors.primaryDark,
          labelStyle: AppTextStyles.labelMedium.copyWith(
            color: AppColors.textOnDark,
          ),
          side: BorderSide(
            color: AppColors.textPrimary.withOpacity(0.15),
            width: 0.5,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.full),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
        ),

        dividerTheme: DividerThemeData(
          color: AppColors.textPrimary.withOpacity(0.1),
          thickness: AppSizes.dividerThickness,
          space: 0,
        ),

        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.darkSecondary,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.topXLarge),
          elevation: 0,
          showDragHandle: true,
          dragHandleColor: Color(0xFF374151),
          dragHandleSize: Size(40, 4),
        ),

        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.darkSecondary,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.xLarge),
          titleTextStyle: AppTextStyles.h3.copyWith(color: AppColors.textOnDark),
          contentTextStyle: AppTextStyles.bodyMedium.copyWith(
            color: const Color(0xFF9CA3AF),
          ),
        ),

        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.surfaceWhite,
          contentTextStyle: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textPrimary,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.medium),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          insetPadding: const EdgeInsets.all(AppSpacing.lg),
        ),

        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.textInverse;
            }
            return const Color(0xFF6B7280);
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return AppColors.primary;
            return const Color(0xFF374151);
          }),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        ),

        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
          linearTrackColor: Color(0xFF374151),
          circularTrackColor: Color(0xFF374151),
        ),

        iconTheme: const IconThemeData(
          color: Color(0xFF9CA3AF),
          size: 24,
        ),

        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          iconColor: const Color(0xFF9CA3AF),
          titleTextStyle: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textOnDark,
          ),
          subtitleTextStyle: AppTextStyles.bodySmall.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),

        textTheme: _textTheme(AppColors.textOnDark),
      );

  // ══════════════════════════════════════════
  //  COLOR SCHEMES
  // ══════════════════════════════════════════
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.textInverse,
    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.primaryDark,
    secondary: AppColors.accent,
    onSecondary: AppColors.textInverse,
    secondaryContainer: AppColors.accentLight,
    onSecondaryContainer: AppColors.accentDark,
    tertiary: AppColors.premium,
    onTertiary: AppColors.textInverse,
    tertiaryContainer: AppColors.premiumLight,
    onTertiaryContainer: AppColors.premiumDark,
    error: AppColors.error,
    onError: AppColors.textInverse,
    errorContainer: AppColors.errorLight,
    onErrorContainer: AppColors.errorDark,
    surface: AppColors.surfaceWhite,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: AppColors.surface,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    outlineVariant: AppColors.divider,
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: AppColors.dark,
    onInverseSurface: AppColors.textOnDark,
    inversePrimary: AppColors.primaryLight,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.textInverse,
    primaryContainer: AppColors.primaryDark,
    onPrimaryContainer: AppColors.primaryLight,
    secondary: AppColors.accent,
    onSecondary: AppColors.textInverse,
    secondaryContainer: AppColors.accentDark,
    onSecondaryContainer: AppColors.accentLight,
    tertiary: AppColors.premium,
    onTertiary: AppColors.textInverse,
    tertiaryContainer: AppColors.premiumDark,
    onTertiaryContainer: AppColors.premiumLight,
    error: AppColors.error,
    onError: AppColors.textInverse,
    errorContainer: AppColors.errorDark,
    onErrorContainer: AppColors.errorLight,
    surface: AppColors.darkSecondary,
    onSurface: AppColors.textOnDark,
    surfaceContainerHighest: AppColors.darkTertiary,
    onSurfaceVariant: Color(0xFF9CA3AF),
    outline: Color(0xFF374151),
    outlineVariant: Color(0xFF1F2937),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: AppColors.surfaceWhite,
    onInverseSurface: AppColors.textPrimary,
    inversePrimary: AppColors.primaryDark,
  );

  // ══════════════════════════════════════════
  //  TEXT THEME HELPER
  // ══════════════════════════════════════════
  static TextTheme _textTheme(Color baseColor) => TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(color: baseColor),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: baseColor),
        headlineLarge: AppTextStyles.h1.copyWith(color: baseColor),
        headlineMedium: AppTextStyles.h2.copyWith(color: baseColor),
        headlineSmall: AppTextStyles.h3.copyWith(color: baseColor),
        titleLarge: AppTextStyles.h4.copyWith(color: baseColor),
        titleMedium: AppTextStyles.labelLarge.copyWith(color: baseColor),
        titleSmall: AppTextStyles.labelMedium.copyWith(color: baseColor),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: baseColor),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: baseColor),
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.buttonMedium.copyWith(color: baseColor),
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.caption,
      );
}
