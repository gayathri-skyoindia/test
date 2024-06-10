import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OverlayImagePage extends StatelessWidget {
  static const String route = '/overlay_image';

  const OverlayImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overlay Image')),
      body: FlutterMap(
        options: MapOptions(
            initialCenter: const LatLng(29.960898987381757, 76.76971845222096),
            cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(29.9621898, 76.7691583),
                  const LatLng(29.9600125, 76.7718794),
                )),
            initialZoom: 17,
            minZoom: 17,
            maxZoom: 20),
        children: [
          // openStreetMapTileLayer,
          OverlayImageLayer(
            overlayImages: [
              OverlayImage(
                bounds: LatLngBounds(
                  const LatLng(29.9621898, 76.7691583),
                  const LatLng(29.9600125, 76.7718795),
                ),
                opacity: 1,
                imageProvider: const AssetImage('assets/map/map.png'),
              ),
            ],
          ),
          const MarkerLayer(
            markers: [
              Marker(
                  point: LatLng(29.960898987381757, 76.76971845222096),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(Icons.location_on)])),
            ],
          ),
        ],
      ),
    );
  }
}


// class _Circle extends StatelessWidget {
//   final String label;
//   final Color color;
//
//   const _Circle({required this.label, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       child: Center(
//         child: Text(
//           label,
//           style:
//               const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
