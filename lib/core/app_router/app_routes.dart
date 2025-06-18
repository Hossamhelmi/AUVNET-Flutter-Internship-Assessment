import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/firebase/firebase_helper.dart';
import 'package:nawel/features/app_layout.dart';
import 'package:nawel/features/authentication/domain/auth_repo.dart';
import 'package:nawel/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:nawel/features/authentication/presentation/screens/login_screen.dart';
import 'package:nawel/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:nawel/features/onboarding/presentation/screens/onboarding_screen.dart';

abstract class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String applayout = '/applayout';
  static const String contact = '/contact';
  static const String notFound = '/not-found';

  static GoRouter createRouter(bool isFirstTime,bool isLoggedIn) {
    return GoRouter(
      initialLocation: isLoggedIn ? AppRoutes.applayout : (isFirstTime ? AppRoutes.onboarding : AppRoutes.login),
      routes: [
        GoRoute(
          path: AppRoutes.applayout,
          builder: (context, state) => const AppLayout(),
        ),
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) => AuthBloc(
                      authRepository: AuthRepository(
                        firebaseAuthService: FirebaseHelper(),
                      ),
                    ),
                child: const LoginScreen(),
              ),
        ),
        GoRoute(
          path: AppRoutes.register,
          builder:
              (context, state) => BlocProvider(
                create:
                    (context) => AuthBloc(
                      authRepository: AuthRepository(
                        firebaseAuthService: FirebaseHelper(),
                      ),
                    ),
                child: const SignUpScreen(),
              ),
        ),
      ],
    );
  }
}
