import 'package:geolocator/geolocator.dart';

Future<Position> getPermission() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.requestPermission();
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied
      await Geolocator.requestPermission();
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are permanently denied
    throw Exception(
      'Location permissions are permanently denied, cannot request.',
    );
  }
  Position position = await Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
  );

  return position;
}
