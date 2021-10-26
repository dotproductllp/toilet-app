import 'package:location/location.dart';
import 'package:toiletfinder/models/user_location.dart';

class LocationService {
  var location = Location();

  Future<UserLocation?> getLocation() async {
    UserLocation? currentLocation;
    try {
      bool permissionStatusGranted = await checkLocationPermission();
      if (permissionStatusGranted == true) {
        var userLocation = await location.getLocation();
        currentLocation = UserLocation(
            latitude: userLocation.latitude!,
            longitude: userLocation.longitude!);
      }
    } on Exception {
      currentLocation = null;
    }
    return currentLocation;
  }

  Future<bool> checkLocationPermission() async {
    PermissionStatus permissionStatus = await location.requestPermission();
    return (permissionStatus == PermissionStatus.granted);
  }
}
