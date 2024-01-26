import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/router/app_router.dart';
import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';
import 'package:flutter_class_example/features/home/data/datasources/home_data_source.dart';
import 'package:flutter_class_example/features/home/domain/use_cases/get_motivos_use_case.dart';
import 'package:flutter_class_example/features/home/data/repositories/motivo_repository_impl.dart';
import 'package:flutter_class_example/features/home/domain/use_cases/create_motivo_use_case.dart';
import 'package:flutter_class_example/features/home/domain/use_cases/delete_motivo_use_case.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => HomeProvider(
        getMotivoUseCase: GetMotivosUseCase(
            homeRepository:
                MotivoRepositoryImpl(homeDataSource: HomeDataSourceImpl())),
        createMotivoUseCase: CreateMotivoUseCase(
            homeRepository:
                MotivoRepositoryImpl(homeDataSource: HomeDataSourceImpl())),
        deleteMotivoUseCase: DeleteMotivoUseCase(
            homeRepository:
                MotivoRepositoryImpl(homeDataSource: HomeDataSourceImpl())),
      ),
    ),
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
            seedColor:  Colors.red),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
