import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/screen_size.dart';
import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';
import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';
import 'package:provider/provider.dart';

class MotivosScreenBody extends StatelessWidget {
  final List<MotivosModel> motivos;
  const MotivosScreenBody({
    super.key,
    required this.motivos,
  });

  @override
  Widget build(BuildContext context) {
    return motivos.isEmpty
        ? Center(
            heightFactor: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    Icons.search_off,
                    size: ScreenSize.height * 0.1,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Buscando \ndatos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey, fontSize: ScreenSize.width * 0.05),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.width * 0.2, vertical: 20),
                  child: const LinearProgressIndicator(),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: motivos.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
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
                    child: ListTile(
                     
                      onLongPress: () => Provider.of<HomeProvider>(context, listen: false).deleteMotivoDialog(context, motivos[index].id),
                      leading: Icon(
                        Icons.description,
                        size: ScreenSize.height * 0.05,
                      ),
                      title: Text(
                        '#${motivos[index].id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        motivos[index].name,
                        style: TextStyle(fontSize: ScreenSize.width * 0.038),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
