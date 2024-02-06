import 'package:crypto_exchange/feature/login/login_page.dart';
import 'package:crypto_exchange/feature/verification/verification_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: VerificationPage.path,
  routes: [
    GoRoute(
      path: VerificationPage.path,
      builder: (context, state) => const VerificationPage(),
    ),
    GoRoute(
      path: LoginPage.path,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
