// lib/core/navigation/app_router.dart

import 'package:flutter/material.dart';

import 'package:e_commerce_app_template/core/animations/page_transitions.dart';
import 'package:e_commerce_app_template/core/models/models.dart';

import 'package:e_commerce_app_template/features/auth/screens/splash_screen.dart';
import 'package:e_commerce_app_template/features/auth/screens/onboarding_screen.dart';
import 'package:e_commerce_app_template/features/auth/screens/login_screen.dart';
import 'package:e_commerce_app_template/features/auth/screens/register_screen.dart';
import 'package:e_commerce_app_template/features/auth/screens/forgot_password_screen.dart';
import 'package:e_commerce_app_template/features/cart/screens/cart_screen.dart';
import 'package:e_commerce_app_template/features/checkout/screens/checkout_screen.dart';
import 'package:e_commerce_app_template/features/checkout/screens/order_success_screen.dart';
import 'package:e_commerce_app_template/features/favorites/screens/favorites_screen.dart';
import 'package:e_commerce_app_template/features/notifications/screens/notifications_screen.dart';
import 'package:e_commerce_app_template/features/orders/screens/my_orders_screen.dart';
import 'package:e_commerce_app_template/features/orders/screens/order_detail_screen.dart';
import 'package:e_commerce_app_template/features/product/screens/product_detail_screen.dart';
import 'package:e_commerce_app_template/features/product/screens/product_list_screen.dart';
import 'package:e_commerce_app_template/features/product/screens/search_screen.dart';
import 'package:e_commerce_app_template/features/profile/screens/addresses_screen.dart';
import 'package:e_commerce_app_template/features/profile/screens/profile_screen.dart';
import 'package:e_commerce_app_template/features/settings/screens/settings_screen.dart';
import 'package:e_commerce_app_template/core/navigation/main_shell.dart';

// ---------------------------------------------------------------------------
// Route sabitleri
// ---------------------------------------------------------------------------

class AppRoutes {
  AppRoutes._();

  static const String splash        = '/';
  static const String onboarding    = '/onboarding';
  static const String login         = '/login';
  static const String register      = '/register';
  static const String forgotPass    = '/forgot-password';
  static const String home          = '/home';
  static const String productList   = '/products';
  static const String productDetail = '/product-detail';
  static const String search        = '/search';
  static const String cart          = '/cart';
  static const String checkout      = '/checkout';
  static const String orderSuccess  = '/order-success';
  static const String orderDetail   = '/order-detail';
  static const String myOrders      = '/my-orders';
  static const String favorites     = '/favorites';
  static const String profile       = '/profile';
  static const String addresses     = '/addresses';
  static const String notifications = '/notifications';
  static const String settings      = '/settings';
}

// ---------------------------------------------------------------------------
// Router — main.dart'ta onGenerateRoute: AppRouter.onGenerateRoute şeklinde kullanılır
// ---------------------------------------------------------------------------

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      // --- Auth ---
      case AppRoutes.splash:
        return FadePageRoute(page: const SplashScreen());

      case AppRoutes.onboarding:
        return FadePageRoute(page: const OnboardingScreen());

      case AppRoutes.login:
        return FadePageRoute(page: const LoginScreen());

      case AppRoutes.register:
        return FadePageRoute(page: const RegisterScreen());

      case AppRoutes.forgotPass:
        return FadePageRoute(page: const ForgotPasswordScreen());

      // --- Ana kabuk (bottom nav) ---
      case AppRoutes.home:
        return FadePageRoute(page: const MainShell());

      // --- Ürünler ---
      // Kullanım: Navigator.pushNamed(context, AppRoutes.productList,
      //   arguments: {'title': 'Elektronik', 'categoryId': 'electronics'})
      case AppRoutes.productList:
        final map   = args as Map<String, dynamic>? ?? {};
        final title = map['title'] as String? ?? '';
        final catId = map['categoryId'] as String?;
        return FadePageRoute(
          page: ProductListScreen(title: title, categoryId: catId),
        );

      // Kullanım: Navigator.pushNamed(context, AppRoutes.productDetail,
      //   arguments: 'product-id-123')
      case AppRoutes.productDetail:
        final productId = args as String? ?? '';
        return FadePageRoute(
          page: ProductDetailScreen(productId: productId),
        );

      case AppRoutes.search:
        return FadePageRoute(page: const SearchScreen());

      // --- Sepet & Ödeme ---
      case AppRoutes.cart:
        return FadePageRoute(page: const CartScreen());

      case AppRoutes.checkout:
        return FadePageRoute(page: const CheckoutScreen());

      case AppRoutes.orderSuccess:
        return FadePageRoute(page: const OrderSuccessScreen());

      // --- Siparişler ---
      case AppRoutes.myOrders:
        return FadePageRoute(page: const MyOrdersScreen());

      // Kullanım: Navigator.pushNamed(context, AppRoutes.orderDetail,
      //   arguments: orderModel)
      case AppRoutes.orderDetail:
        final order = args as OrderModel;
        return FadePageRoute(page: OrderDetailScreen(order: order));

      // --- Favoriler ---
      case AppRoutes.favorites:
        return FadePageRoute(page: const FavoritesScreen());

      // --- Profil ---
      case AppRoutes.profile:
        return FadePageRoute(page: const ProfileScreen());

      case AppRoutes.addresses:
        return FadePageRoute(page: const AddressesScreen());

      case AppRoutes.notifications:
        return FadePageRoute(page: const NotificationsScreen());

      case AppRoutes.settings:
        return FadePageRoute(page: const SettingsScreen());

      // --- Tanımsız rota ---
      default:
        return FadePageRoute(page: const SplashScreen());
    }
  }
}