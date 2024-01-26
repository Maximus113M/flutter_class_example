import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/router/app_router.dart';

import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 60, 4, 156)),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
