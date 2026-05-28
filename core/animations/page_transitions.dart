import 'package:flutter/material.dart';

class FadePageRoute<T>
    extends PageRouteBuilder<T> {
  FadePageRoute({
    required Widget page,
  }) : super(
    transitionDuration:
    const Duration(
      milliseconds: 320,
    ),

    reverseTransitionDuration:
    const Duration(
      milliseconds: 260,
    ),

    pageBuilder:
        (
        context,
        animation,
        secondaryAnimation,
        ) {
      return page;
    },

    transitionsBuilder:
        (
        context,
        animation,
        secondaryAnimation,
        child,
        ) {
      final curved =
      CurvedAnimation(
        parent: animation,

        curve: Curves.easeOutCubic,
      );

      return FadeTransition(
        opacity: curved,

        child: SlideTransition(
          position:
          Tween<Offset>(
            begin:
            const Offset(
              0,
              0.04,
            ),

            end: Offset.zero,
          ).animate(curved),

          child: child,
        ),
      );
    },
  );
}