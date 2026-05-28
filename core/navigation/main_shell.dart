// lib/core/navigation/main_shell.dart
//
// DÜZELTİLDİ: Dosya AppRouter'ın kopyasını içeriyordu, MainShell widget'ı
// hiç yazılmamıştı. Bu yüzden sepet, arama ve profil sayfalarına
// alt menüden erişmek mümkün değildi.
//
// Bu dosya; Home, Arama, Sepet, Profil sekmelerini IndexedStack ile
// yöneten ve sepet rozeti gösteren gerçek bottom nav shell'dir.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce_app_template/core/constants/constants.dart';
import 'package:e_commerce_app_template/core/l10n/app_localizations.dart';
import 'package:e_commerce_app_template/features/cart/providers/cart_provider.dart';
import 'package:e_commerce_app_template/features/auth/providers/auth_provider.dart';

import 'package:e_commerce_app_template/features/home/screens/home_screen.dart';
import 'package:e_commerce_app_template/features/product/screens/search_screen.dart';
import 'package:e_commerce_app_template/features/cart/screens/cart_screen.dart';
import 'package:e_commerce_app_template/features/profile/screens/profile_screen.dart';

// ─────────────────────────────────────────────────────────────
// MAIN SHELL
// ─────────────────────────────────────────────────────────────

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key, this.initialIndex = 0});

  /// Başlangıçta açılacak sekme (0=Home, 1=Arama, 2=Sepet, 3=Profil)
  final int initialIndex;

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  late int _currentIndex;


  // Her sekme kendi navigator'ını koruyor — geri tuşu doğru çalışır
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  // Android geri tuşu: önce sekmenin kendi stack'ini boşalt,
  // hâlâ bir şey varsa uygulamadan çıkma
  Future<bool> _onWillPop() async {
    final NavigatorState? nav =
        _navigatorKeys[_currentIndex].currentState;

    if (nav != null && nav.canPop()) {
      nav.pop();
      return false;
    }

    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return false;
    }

    return true;
  }

  void _onTabTap(int index) {
    HapticFeedback.selectionClick();

    if (index == _currentIndex) {
      // Aynı sekmeye tekrar basınca en üste scroll
      _navigatorKeys[index].currentState?.popUntil(
            (route) => route.isFirst,
      );
      return;
    }

    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.status == AuthStatus.unauthenticated) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.login,
          (route) => false,
        );
      }
    });

    return WillPopScope(
      onWillPop: _onWillPop,

      child: Scaffold(
        // Her sekmenin kendi Navigator'ı var; body tekrar build edilmez
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _TabNavigator(
              navigatorKey: _navigatorKeys[0],
              child: const HomeScreen(),
            ),
            _TabNavigator(
              navigatorKey: _navigatorKeys[1],
              child: const SearchScreen(),
            ),
            _TabNavigator(
              navigatorKey: _navigatorKeys[2],
              child: const CartScreen(),
            ),
            _TabNavigator(
              navigatorKey: _navigatorKeys[3],
              child: const ProfileScreen(),
            ),
          ],
        ),

        // ─────────────────────────────────
        // BOTTOM NAV BAR
        // ─────────────────────────────────

        bottomNavigationBar: _BottomBar(
          isDark: isDark,
          currentIndex: _currentIndex,
          cartCount: ref.watch(cartCountProvider),
          onTap: _onTabTap,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// TAB NAVIGATOR  —  her sekme kendi yığınını tutar
// ─────────────────────────────────────────────────────────────

class _TabNavigator extends StatelessWidget {
  const _TabNavigator({
    required this.navigatorKey,
    required this.child,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (_) => child,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// BOTTOM BAR  —  özel çizim, rozet desteği
// ─────────────────────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.isDark,
    required this.currentIndex,
    required this.cartCount,
    required this.onTap,
  });

  final bool isDark;
  final int currentIndex;
  final int cartCount;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSecondary : Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            8,
            8,
            8,
            8 + MediaQuery.of(context).padding.bottom.clamp(0.0, 16.0),
          ),
          child: Row(
            children: [
              _NavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: l10n.home,
                isActive: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                icon: Icons.search_outlined,
                activeIcon: Icons.search_rounded,
                label: l10n.search,
                isActive: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavItem(
                icon: Icons.shopping_bag_outlined,
                activeIcon: Icons.shopping_bag_rounded,
                label: l10n.cart,
                isActive: currentIndex == 2,
                badge: cartCount > 0 ? cartCount : null,
                onTap: () => onTap(2),
              ),
              _NavItem(
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: l10n.profile,
                isActive: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// NAV ITEM
// ─────────────────────────────────────────────────────────────

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.badge,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final int? badge;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // İkon + rozet
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedContainer(
                    duration: AppDurations.normal,
                    curve: Curves.easeOutCubic,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.primaryLight
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Icon(
                      isActive ? activeIcon : icon,
                      size: 24,
                      color: isActive
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),

                  // Rozet
                  if (badge != null)
                    Positioned(
                      top: -2,
                      right: -4,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            badge! > 99 ? '99+' : '$badge',
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 3),

              // Etiket
              AnimatedDefaultTextStyle(
                duration: AppDurations.fast,
                style: AppTextStyles.caption.copyWith(
                  color: isActive
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  fontWeight: isActive
                      ? FontWeight.w600
                      : FontWeight.normal,
                  fontSize: 11,
                ),
                child: Text(label, maxLines: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}