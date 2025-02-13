import 'dart:math';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationManager {
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request user to enable them.
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
  // var res=   await  Geolocator.openLocationSettings();

     //   var status = await  Permission.location.request();


        return Future.error('Location services are disabled.');
      }
    }

    // Check for location permissions.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request location permissions from the user.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return an error.
        return Future.error('Location permissions are denied');
      }
    }

    // Check for permanently denied permissions.
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current location.
    //Position position = await LocationManager.getCurrentLocation();
    //print('Latitude: ${position.latitude}');
    //print('Longitude: ${position.longitude}');
    var location = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude, location.longitude);
    if(placemarks.isNotEmpty){
      log(
          placemarks[0].country.toString() as num);
      log(
          placemarks[0].street.toString() as num);
      log(
          placemarks[0].locality.toString() as num);
      log(
          placemarks[0].postalCode.toString() as num);
      log(
          placemarks[0].administrativeArea.toString() as num);
      log(
          placemarks[0].subAdministrativeArea.toString() as num);
      log(
          placemarks[0].subLocality.toString() as num);

    }
    print(location.toString());
    return location;
  }
}