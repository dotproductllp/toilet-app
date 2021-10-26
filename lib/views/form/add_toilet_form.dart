import 'package:flutter/material.dart';

class AddToiletForm extends StatefulWidget {
  const AddToiletForm({Key? key}) : super(key: key);

  @override
  _AddToiletFormState createState() => _AddToiletFormState();
}

enum ToiletDetailType {
  toiletCategory,
  gender,
  facility,
  disabledFriendly,
  isFree,
  infrastructure,
  visiblityRating,
  accessibilityRating,
  clealinessRating,
  safetyRating
}


class Toilet {
  Toilet(
    this.toiletCategoryId,
    this.genderId,
    this.facilityIds,
    this.disabledFriendly,
    this.isFree,
    this.infrastructureIds,
    this.visibilityRating,
    this.accessibilityRating,
    this.cleanlinessRating,
    this.safetyRating
  );

  int toiletCategoryId;
  int genderId;
  Set<int> facilityIds;
  bool disabledFriendly;
  bool isFree;
  Set<int> infrastructureIds;
  int visibilityRating;
  int accessibilityRating;
  int cleanlinessRating;
  int safetyRating;
}

class CategoryItem {

  CategoryItem(this.title, this.toiletDetailType, this.id, this.name,);

  String title;
  ToiletDetailType toiletDetailType;
  int id;
  String name; 
}

class _AddToiletFormState extends State<AddToiletForm> {


  
  @override
  Widget build(BuildContext context) {

    final TextStyle _headingStyle =  TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.w900,
      fontFamily: 'Open Sans',
      fontSize: 20);
      
    return Column(
      children: [
        const SizedBox(height: 10,),
        Text(
          "Add Toilet",
          style: _headingStyle,
         ),
      ],
    );
  }
}

class ToiletCategorySelection extends StatelessWidget {
  
  ValueChanged didSelect;

  ToiletCategorySelection({Key? key, required this.didSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("TOILET CATEGORY"),
      ],
    );
  }
}