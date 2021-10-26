
import 'package:flutter/material.dart';
import 'package:location/location.dart';
class LocationProvider extends ChangeNotifier {
  Location location = Location();

  void getLocation() async {
    location.getLocation();

  }
}
