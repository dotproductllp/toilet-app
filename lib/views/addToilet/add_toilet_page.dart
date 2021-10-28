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
            const SizedBox(height: 5,),
            Container(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10), color: Colors.yellow), 
                  child: const Text("TOILET CATEGORY"),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
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


