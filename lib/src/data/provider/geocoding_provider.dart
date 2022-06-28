import 'package:geocoding/geocoding.dart';

Future<List<Placemark>> fetchPlacemarks(
    double latitude, double longtitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longtitude);
  return placemarks;
}
