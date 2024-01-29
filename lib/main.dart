import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/core/router/app_router.dart';
import 'package:flutter_class_example/features/groups/data/datasources/groups_data_source.dart';
import 'package:flutter_class_example/features/groups/data/repositories/groups_repository_impl.dart';
import 'package:flutter_class_example/features/groups/display/providers/groups_provider.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/create_group_use_case.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/delete_group_use_case.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/get_reasons_use_case.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/update_group_use_case.dart';
import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';
import 'package:flutter_class_example/features/reasons/display/providers/reasons_provider.dart';
import 'package:flutter_class_example/features/reasons/data/datasources/reasons_data_source.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/get_reasons_use_case.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/delete_reason_use_case.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/create_reason_use_case.dart';
import 'package:flutter_class_example/features/reasons/data/repositories/reasons_repository_impl.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => HomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ReasonsProvider(
        getReasonsUseCase: GetReasonsUseCase(
            reasonsRepository: ReasonsRepositoryImpl(
                reasonDataSource: ReasonDataSourceImpl())),
        createReasonUseCase: CreateReasonsUseCase(
            reasonsRepository: ReasonsRepositoryImpl(
                reasonDataSource: ReasonDataSourceImpl())),
        deleteReasonUseCase: DeleteReasonUseCase(
            reasonsRepository: ReasonsRepositoryImpl(
                reasonDataSource: ReasonDataSourceImpl())),
      ),
    ),
    ChangeNotifierProvider(
      create: (_) => GroupsProvider(
        getGroupsUseCase: GetGroupsUseCase(
            groupsRepository:
                GroupRepositoryImpl(groupsDataSource: GroupsDataSourceImpl())),
        createGroupUseCase: CreateGroupUseCase(
            groupsRepository:
                GroupRepositoryImpl(groupsDataSource: GroupsDataSourceImpl())),
        updateGroupUseCase: UpdateGroupUseCase(
            groupsRepository:
                GroupRepositoryImpl(groupsDataSource: GroupsDataSourceImpl())),
        deleteGroupUseCase: DeleteGroupUseCase(
            groupsRepository:
                GroupRepositoryImpl(groupsDataSource: GroupsDataSourceImpl())),
      ),
    )
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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.flutterExample),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
