import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:path/path.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";
import 'package:test/constants.dart';
import 'package:location/location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:collection';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(84.48322, 42.72644);
  static const LatLng destination = LatLng(84.49008, 42.72409);
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentlocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 13.5,
              target: LatLng(newLoc.latitude!, newLoc.longitude!))));
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));

      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentlocation();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  zoom: 14.5),
              polylines: {
                Polyline(
                    polylineId: PolylineId("route"),
                    points: polylineCoordinates,
                    color: Colors.pink,
                    width: 6)
              },
              markers: {
                Marker(
                    markerId: const MarkerId('current location'),
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!)),
                const Marker(
                    markerId: MarkerId('source'), position: sourceLocation),
                const Marker(
                    markerId: MarkerId('destination'), position: destination),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'map1',
              onPressed: () {
                setState(() {});
              },
              backgroundColor: Colors.purple,
              hoverColor: Colors.deepPurple,
              child: const Icon(Icons.done),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: 'map2',
              onPressed: () {
                setState(() {
                  print(1);
                });
              },
              backgroundColor: Colors.purple,
              hoverColor: Colors.deepPurple,
              child: const Icon(Icons.home),
            ),
          ],
        ),
      ),
    );
  }
}
