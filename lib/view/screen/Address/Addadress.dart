
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:testproject/controller/Address/AddressController.dart';

class Addaddress extends StatelessWidget {
    const Addaddress({super.key});

  @override
  Widget build(BuildContext context) {


  final AddressController _mapController = AddressController();

  // مواقع مختلفة كمثال
   
  final LatLng riyadh = LatLng(24.7136, 46.6753);
  final LatLng jeddah = LatLng(21.3891, 39.8579);
 



     LatLng _center = LatLng(24.7136, 46.6753); // الرياض
  double _zoom = 12;

    return Scaffold(
      appBar: AppBar(title: const Text("Map Controller Example")),
      body: FlutterMap(
     //   mapController: _mapController,
        options: MapOptions(
          initialCenter: riyadh,
          initialZoom: 12,
          onTap: (tapPosition, point) {
            // لما المستخدم يضغط على الخريطة
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("إحداثيات: ${point.latitude}, ${point.longitude}")),
            );
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.myapp',
          ),
          /* MarkerLayer(
            markers: _mapController.mmarkar.
          ), */
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.zoom_out),
              onPressed: () {
                _mapController.move(
                _center,
                  _zoom - 1,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.zoom_in),
              onPressed: () {
                _mapController.move(
                  _center,
                  _zoom + 1,
                );
              },
            ),
            /* ElevatedButton(
              onPressed: () {
                _mapController.move(riyadh, 13);
              },
              child: const Text("Riyadh"),
            ),
            ElevatedButton(
              onPressed: () {
                _mapController.move(jeddah, 13);
              },
              child: const Text("Jeddah"),
            ), */
          ],
        ),
      ),
    );
  }
}

