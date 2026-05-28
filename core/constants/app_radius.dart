import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const double xs   = 4.0;
  static const double sm   = 8.0;
  static const double md   = 12.0;
  static const double lg   = 16.0;
  static const double xl   = 20.0;
  static const double xxl  = 24.0;
  static const double pill = 999.0;

  static const BorderRadius small  = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(md));
  static const BorderRadius large  = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xLarge = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius full   = BorderRadius.all(Radius.circular(pill));

  static const BorderRadius topLarge = BorderRadius.only(
    topLeft:  Radius.circular(lg),
    topRight: Radius.circular(lg),
  );

  static const BorderRadius topXLarge = BorderRadius.only(
    topLeft:  Radius.circular(xxl),
    topRight: Radius.circular(xxl),
  );
}
