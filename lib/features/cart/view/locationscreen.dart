import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectMapLocation extends StatefulWidget {
  const SelectMapLocation({super.key});

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<SelectMapLocation> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  LatLng _selectedPosition = const LatLng(33.311141, 44.332933);

  void _onMapTap(LatLng tappedLocation) {
    setState(() {
      _selectedPosition = tappedLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Location")),
      body: GoogleMap(
        onTap: _onMapTap,
        initialCameraPosition: CameraPosition(
          target: _selectedPosition,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('selected'),
            position: _selectedPosition,
            infoWindow: const InfoWindow(title: 'Selected Location'),
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(_selectedPosition); // Send selected location back
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
