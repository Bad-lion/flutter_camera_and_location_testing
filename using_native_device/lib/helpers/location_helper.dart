import 'package:http/http.dart' as http;

const apiKey =
    'pk.eyJ1Ijoibm9tYWRrZyIsImEiOiJja3Frd2FrMWcwdGN3MndwcXg5ZjJidDJrIn0.4vhynQK2KLaybLopofkojQ';

class LocationHelper {
  static String generatePreviewImageUrl({double latitude, double longitude}) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$apiKey';
  }
}
