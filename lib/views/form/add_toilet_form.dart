import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toiletfinder/providers/toilet_data_provider.dart';

class AddToiletPage extends StatelessWidget {
  const AddToiletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToiletDataProvider>(
      create: (context) => ToiletDataProvider(),
      child: const AddToiletContentView(),
      );
  }
}

class AddToiletContentView extends StatelessWidget {
  const AddToiletContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ToiletDataProvider> (
      builder: (context, toiletDataProvider, child) {
        return Column(
          children: [
            const Expanded( child: Center( child: Text("TOILET CATEGORY"), ),),
            Expanded(
              child: ListView(
                children: toiletDataProvider.categories.map((e) => RadioListTile<int>(
                  title: Text(e.title,),
                  groupValue: toiletDataProvider.selectedCategoryId,
                  value: e.id,
                  onChanged: (val) => toiletDataProvider.selectCategory(val),
                  )).toList(),
              ),
            )
          ]
        );
      }
    );
  }
}


