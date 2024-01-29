import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/features/groups/display/providers/groups_provider.dart';
import 'package:flutter_class_example/features/groups/display/widgets/groups_screen_body.dart';

import 'package:provider/provider.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Provider.of<GroupsProvider>(context).groups.isEmpty) {
      Provider.of<GroupsProvider>(context, listen: false).getGroups(context);
    }
    return Scaffold(
      backgroundColor: AppColors.flutterExampleBg,
      appBar: AppBar(
        title: const Text(
          "Fichas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.flutterExample,
        elevation: 15,
        shadowColor: Colors.black,
        leading: IconButton(
          onPressed: () => Provider.of<GroupsProvider>(context, listen: false)
              .closeGroopScreen(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
      ),
      body: GroupsScreenBody(
        groups: Provider.of<GroupsProvider>(context).groups,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.flutterExample.withOpacity(0.4),
        onPressed: () => Provider.of<GroupsProvider>(context, listen: false)
            .createGroupDialog(context),
        child: const Icon(
          Icons.add,
          color: AppColors.contrast,
        ),
      ),
    );
  }
}
