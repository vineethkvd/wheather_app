import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Placemark?> getLocationName(Position? position) async {
    if (position != null) {
      try {
        final placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemarks.isNotEmpty) {
          return placemarks[0];
        }
      } catch (e) {
        print("Error fetching location name: $e");
      }
    }
    return null; // Return null in case of an empty placemark list or an error
  }
}
