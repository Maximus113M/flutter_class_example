import 'package:flutter_class_example/features/animated/display/screens/animated_screen.dart';
import 'package:flutter_class_example/features/groups/display/screens/groups_screen.dart';
import 'package:flutter_class_example/features/home/display/screens/home_screen.dart';
import 'package:flutter_class_example/features/reasons/display/screens/reasons_screen.dart';
import 'package:flutter_class_example/features/students/display/students_screen.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/reasons',
      builder: (context, state) => const ReasonsScreen(),
    ),
    GoRoute(
      path: '/groups',
      builder: (context, state) => const GroupsScreen(),
    ),
    GoRoute(
      path: '/students',
      builder: (context, state) => const StudentsScreen(),
    ),
    GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
    ),
  ],
);
