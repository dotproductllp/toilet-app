import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  static const double _zoom = 11;

  // Location markers
  Set _markers = {};

  late GoogleMapController _mapController;
  final Location _location = Location();

  LatLng _currentLocation = const LatLng(0, 0);

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _location.getLocation().then((location) {
      if (location.latitude != null && location.longitude != null) {
        _currentLocation = LatLng(location.latitude!, location.longitude!);
        _mapController.animateCamera(CameraUpdate.newLatLngZoom(_currentLocation, _zoom));
        _dropMarkerAtCurrentLocation();
      }
    });
  }

  @override
  void initState() {
    _location.requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      GoogleMap(
        onMapCreated: _onMapCreated,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: _zoom,
        ),
      ),
    ]);
  }

  void _dropMarkerAtCurrentLocation() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_currentLocation.toString()),
        position: _currentLocation,
        icon: BitmapDescriptor.defaultMarker
        ));
    });
  }
}
