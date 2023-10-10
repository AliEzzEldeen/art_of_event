import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionDialog extends StatelessWidget {
  final Function onPermissionGranted;

  LocationPermissionDialog({required this.onPermissionGranted});

  @override
  Widget build(BuildContext context) {
    // Check the platform
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // iOS platform, show Cupertino-style dialog
      return CupertinoAlertDialog(
        title: Text('Location Permission Required'),
        content: Text('This app requires access to your location. Please grant location permission to continue.'),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog
              PermissionStatus status = await Permission.location.request();
              if (status.isGranted) {
                // Location permission granted, execute callback
                onPermissionGranted();
              }
            },
            child: Text('Grant Permission'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
        ],
      );
    } else {
      // Android platform or other, show Material-style dialog
      return AlertDialog(
        title: Text('Location Permission Required'),
        content: Text('This app requires access to your location. Please grant location permission to continue.'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog
              PermissionStatus status = await Permission.location.request();
              if (status.isGranted) {
                // Location permission granted, execute callback
                onPermissionGranted();
              }
            },
            child: Text('Grant Permission'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
        ],
      );
    }
  }
}