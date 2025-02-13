import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/services/location_manager.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController _controller;
  var initialCameraPosition =
  CameraPosition(zoom: 15,
      target: LatLng(30.1, 35.2)
  );




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    floatingActionButton:
    FloatingActionButton(
       onPressed: () async {


    var location =
    await   LocationManager.getCurrentLocation();
    _listenOnLocationChanged();
    var initialCameraPosition =
    CameraPosition(zoom: 15,
        target: LatLng(30.1, 35.2)
    );
    _controller.animateCamera(CameraUpdate.newLatLngZoom(initialCameraPosition.target,14),
    );
    setState(() {

    });

     },
     child: Icon(Icons.location_searching_rounded,
     ),
     ),
      body:  GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        key: UniqueKey(),
          markers:
              {
                Marker(
                  markerId: MarkerId("1"),
                  position: initialCameraPosition.target,
                )
              },
          onMapCreated: (controller){
          _controller = controller;
          setState(() {

          });
          },

          initialCameraPosition:initialCameraPosition),
    );
  }
  _listenOnLocationChanged(){
  var stream = Geolocator.getPositionStream(
   // locationSettings: const
   // LocationSettings(),
  );
  stream.listen(( Position newLocation){
    var newLatLang = LatLng(newLocation.latitude, newLocation.longitude);
    _controller.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(newLocation.latitude, newLocation.longitude),14)
    );
    var currentLocationMarker = Marker(
        markerId:MarkerId("1"),
      position: newLatLang
    );
    setState(() {

    });
  },
  );

  }
}