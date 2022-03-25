// ignore_for_file: file_names
import 'package:atelier2_app_mobile/model/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as lt;

// ignore: must_be_immutable
class MapComponent extends StatefulWidget {
  const MapComponent({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<MapComponent> createState() => _MapComponentState();
}

/// see : https://pub.dev/packages/flutter_map
class _MapComponentState extends State<MapComponent> {
  @override
  Widget build(BuildContext context) {
    List<Marker> mark = [];

    ///on stocke widget.events dans une variable temporaire pour bien lui faire
    ///comprendre que la valeur n'est pas nul, cf if au dessus
    mark.add(Marker(
      width: 80.0,
      height: 80.0,
      point: lt.LatLng(widget.event.getLat(), widget.event.getLong()),
      builder: (ctx) =>
          const Icon(Icons.location_pin, color: Colors.indigoAccent),
    ));

    return FlutterMap(
      options: MapOptions(
        center: lt.LatLng(widget.event.getLat(), widget.event.getLong()),
        zoom: 14.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return const Text("© OpenStreetMap");
          },
        ),
        MarkerLayerOptions(markers: mark)
      ],
    );
  }
}
