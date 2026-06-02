import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:medifinder_demo/core/router/app_routes.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/presentation/screens/filter_screen.dart';
import 'package:medifinder_demo/features/providers/presentation/screens/provider_detail_screen.dart';
import 'package:medifinder_demo/features/providers/presentation/screens/provider_list_screen.dart';
import 'package:medifinder_demo/features/splash/presentation/screens/splash_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ProviderListScreen(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
      ),
      GoRoute(
        path: AppRoutes.filter,
        pageBuilder:
            (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: FilterScreen(),
            ),
      ),
      GoRoute(
        path: AppRoutes.providerDetail,
        builder: (context, state) {
          final provider = state.extra as ProviderEntity?;
          final id = state.pathParameters['id']!;
          return ProviderDetailScreen(id: id, provider: provider);
        },
      ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(
            child: Text(state.error?.message ?? 'Page not found'),
          ),
        ),
  );
}
