import 'package:proyecto_mintic/data/services/geolocation.dart';
import 'package:geolocator/geolocator.dart';

class LocationManager {
  final gpsService = GpsService();

  Future<Position> getCurrentLocation() async {
    // Retorna la ubicacion actual
    return await gpsService.getCurrentLocation();
  }
}
