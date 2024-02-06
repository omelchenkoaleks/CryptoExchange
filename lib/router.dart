import 'package:crypto_exchange/feature/action/action_page.dart';
import 'package:crypto_exchange/feature/home/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: ActionPage.path,
      builder: (context, state) => const ActionPage(),
    ),
  ],
);
