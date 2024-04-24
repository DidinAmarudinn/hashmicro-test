import 'package:geocoding/geocoding.dart';

class LocationDecoder {
  static String convert(List<Placemark> location) {
    return "${location.firstOrNull?.street ?? ""} ${location.firstOrNull?.subLocality ?? ""}, ${location.firstOrNull?.locality ?? ""},  ${location.firstOrNull?.administrativeArea ?? ""}";
  }
}
