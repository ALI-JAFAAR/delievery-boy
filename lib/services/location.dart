import 'dart:convert';
import 'package:http/http.dart' as http;
import '../env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/direction.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

   

  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await http.get(
      Uri.parse(_baseUrl+"origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleAPIKey"),
    );

    // Check if response is successful\
    // if (response.statusCode == 200) {
      return Directions.fromMap(json.decode(response.body));
    // }
    // return null;
  }
}