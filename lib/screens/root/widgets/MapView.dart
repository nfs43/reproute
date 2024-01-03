import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rep_route/theme.dart';

class MapView extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapView> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
       decoration: BoxDecoration(
              color: white,

    borderRadius: BorderRadius.circular(15.0),
   
  ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: GoogleMap(
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
          initialCameraPosition: CameraPosition(
            target:
                LatLng(37.7749, -122.4194), // Default location (San Francisco)
            zoom: 12.0,
          ),
        ),
      ),
    );
  }
}
