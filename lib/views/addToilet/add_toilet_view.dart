import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toiletfinder/providers/toilet_data_provider.dart';
import 'package:toiletfinder/views/addToilet/add_toilet_category_view.dart';
import 'package:toiletfinder/views/common/rounded_button.dart';

class AddToiletView extends StatelessWidget {
  const AddToiletView({Key? key}) : super(key: key);

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
                  child: Text(toiletDataProvider.getPageTitle()),
                ),
              ),
            ),
            const Expanded(child: AddToiletCategoryView()),
            Container(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  RoundedButton(icon: const Icon(Icons.chevron_left), action: () {}),
                  const Spacer(),
                  RoundedButton(icon: const Icon(Icons.chevron_right), action: () {}),
                ],
              )
            )
          ]
        );
      }
    );
  }
}


