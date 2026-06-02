import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future<void>.delayed(const Duration(milliseconds: 2500));

    if (mounted) {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
                  'assets/images/medifinder_logo.png',
                  width: 220,
                  fit: BoxFit.contain,
                )
                .animate()
                .fadeIn(duration: 800.ms, curve: Curves.easeOut)
                .slideY(
                  begin: 0.15,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                ),
            const SizedBox(height: 16),
            Text(
                  'Connecting you with top healthcare',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                )
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.2, curve: Curves.easeOut),
            const Spacer(),
            Column(
              children: [
                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 3,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Loading...',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.textTertiary,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ).animate(delay: 800.ms).fadeIn(duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
