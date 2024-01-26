import 'package:flutter_class_example/features/home/display/screens/home_screen.dart';
import 'package:flutter_class_example/features/home/display/screens/motivos_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/motivos',
      builder: (context, state) => const MotivosScreen(),
    ),
  ],
);
