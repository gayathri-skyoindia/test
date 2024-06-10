import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BundledOfflineMapPage extends StatelessWidget {
  static const String route = '/bundled_offline_map';

  const BundledOfflineMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bundled Offline Map')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: const LatLng(29.960898987381757, 76.76971845222096),
          minZoom: 12,
          maxZoom: 14,
          cameraConstraint: CameraConstraint.containCenter(
            bounds: LatLngBounds(
              const LatLng(56.7378, 11.6644),
              const LatLng(56.6877, 11.5089),
            ),
          ),
        ),
        children: [
          TileLayer(
            tileProvider: AssetTileProvider(),
            maxZoom: 14,
            urlTemplate: 'assets/map/{z}/{x}/{y}.png',
          ),
        ],
      ),
    );
  }
}
