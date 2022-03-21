// ignore_for_file: file_names

import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import "package:latlong2/latlong.dart" as lt;

class MapComponent extends StatefulWidget {
  const MapComponent({Key? key}) : super(key: key);

  @override
  State<MapComponent> createState() => _MapComponentState();
}
/// see : https://pub.dev/packages/flutter_map
class _MapComponentState extends State<MapComponent> {
  @override
  Widget build(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      center: lt.LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
      TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c'],
        attributionBuilder: (_) {
          return const Text("© OpenStreetMap contributors");
        },
      ),
      MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: lt.LatLng(51.5, -0.09),
            builder: (ctx) =>
            Container(
              child: const Icon(Icons.location_pin, color: Colors.indigoAccent),
            ),
          ),
        ],
      ),
    ],
  );
}
}
