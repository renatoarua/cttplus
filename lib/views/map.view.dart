import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // late GoogleMapController _mapController;

  final LatLng _position = const LatLng(-25.52079, -49.20618);
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();

    _markers.add(Marker(
      markerId: const MarkerId('myLocation'),
      position: _position,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: Set<Marker>.of(_markers),
      onMapCreated: (controller) {
        setState(() {
          // _mapController = controller;
        });
      },
      initialCameraPosition: CameraPosition(
        target: _position,
        zoom: 11.0,
      ),
    );
  }
}
