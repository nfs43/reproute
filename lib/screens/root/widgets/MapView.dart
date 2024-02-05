import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rep_route/providers/dashboardProvider.dart';

class MapView extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapView> {
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    // Fetch addresses when the widget is created
    // Provider.of<DashboardProvider>(context, listen: false).fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        List<Map<String, String?>> addresses = provider.addresses ?? [];

        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
                // Plot markers when the map is created
                _plotMarkers(addresses);
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(39.952583, -75.165222), // Default location (San Francisco)
                zoom: 12.0,
              ),
              markers: Set.from(_plotMarkers(addresses)),
            ),
          ),
        );
      },
    );
  }

  Set<Marker> _plotMarkers(List<Map<String, String?>> addresses) {
    Set<Marker> markers = {};

    for (var address in addresses) {
      // Assuming the address format is "latitude,longitude"
      double latitude = double.tryParse(address["latitude"] ?? '0') ?? 0.0;
      double longitude = double.tryParse(address["longitude"] ?? '0') ?? 0.0;

      Marker marker = Marker(
        markerId: MarkerId(address["id"].toString()),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: "${address["firstname"]} ${address["lastname"]}",
          snippet: address["speciaciality"],
        ),
      );

      markers.add(marker);
    }

    return markers;
  }
}
