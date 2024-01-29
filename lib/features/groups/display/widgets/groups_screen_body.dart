import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/core/utils/app_assets.dart';
import 'package:flutter_class_example/core/shared/loading/loading_screen.dart';
import 'package:flutter_class_example/features/groups/data/models/group_model.dart';
import 'package:flutter_class_example/features/groups/display/providers/groups_provider.dart';
import 'package:provider/provider.dart';

class GroupsScreenBody extends StatelessWidget {
  final List<GroupModel> groups;
  const GroupsScreenBody({
    super.key,
    required this.groups,
  });

  @override
  Widget build(BuildContext context) {
    return groups.isEmpty
        ? const LoadingScreen()
        : Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: ScreenSize.width * 0.04),
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: () =>
                      Provider.of<GroupsProvider>(context, listen: false)
                          .deleteGroupDialog(context, groups[index].id),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenSize.absoluteHeight * 0.01,
                      horizontal: ScreenSize.width * 0.05,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadiusDirectional.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3, 5),
                            blurRadius: 10,
                          )
                        ]),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(AppAssets.leadImage),
                            Text(groups[index].leader),
                          ],
                        ),
                        SizedBox(
                          width: ScreenSize.width * 0.05,
                        ),
                        SizedBox(
                          width: ScreenSize.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${groups[index].number}',
                                style: FontStyles.subtitle0(AppColors.text),
                              ),
                              Text(
                                groups[index].program.toUpperCase(),
                                style: FontStyles.body4(AppColors.text),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => Provider.of<GroupsProvider>(context,
                                  listen: false)
                              .updateGroupDialog(context, groups[index]),
                          icon: Icon(
                            Icons.edit_document,
                            size: ScreenSize.height * 0.04,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
