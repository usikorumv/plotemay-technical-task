import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plotemay_technical_task/src/data/provider/geocoding_provider.dart';
import 'package:plotemay_technical_task/src/data/provider/geolocator_provider.dart';

Future<List<Placemark>> getPlacemarks() async {
  Position position = await fetchCurrentPosition();
  List<Placemark> placemarks =
      await fetchPlacemarks(position.latitude, position.longitude);

  return placemarks;
}

Future<String> getCityName() async {
  List<Placemark> placemarks = await getPlacemarks();

  String cityName = placemarks.first.locality!;

  return cityName;
}

Future<String> getCountryName() async {
  List<Placemark> placemarks = await getPlacemarks();

  String cityName = placemarks.first.country!;

  return cityName;
}
