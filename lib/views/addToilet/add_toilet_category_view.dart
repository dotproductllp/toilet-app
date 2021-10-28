import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toiletfinder/providers/toilet_data_provider.dart';

class AddToiletCategoryView extends StatelessWidget {
  const AddToiletCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToiletDataProvider toiletDataProvider =
        Provider.of<ToiletDataProvider>(context);
    return ListView(
      padding: EdgeInsets.zero,
      children: toiletDataProvider
          .getCategories()
          .map((e) => RadioListTile<int>(
                title: Text(
                  e.title,
                ),
                groupValue: toiletDataProvider.selectedCategoryId,
                value: e.id,
                onChanged: (val) => toiletDataProvider.selectCategory(val),
              ))
          .toList(),
    );
  }
}
