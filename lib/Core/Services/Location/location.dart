import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  final Function(Position) onLocationUpdate;

  LocationService({required this.onLocationUpdate});

  Future<void> checkPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle denied permission
    } else if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      _onPermissionGranted();
    }
  }

  void _onPermissionGranted() async {
    Position? currentPosition;
    List<Placemark>? placeMarks;

    try {
      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      placeMarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
    );


      } catch (e) {
      print("Error getting location: $e");
      return;
    }

    onLocationUpdate(currentPosition); // Call the callback with updated location data
  }
}
