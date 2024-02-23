import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageUrlService {
  List<String> imageUrl = [];

  String url = 'https://dog.ceo/api/breeds/image/random/10';
  Future<void> getImageData() async {
    try {
      var response = await http.get(Uri.parse(url));
      await Future.delayed(const Duration(seconds: 1));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        imageUrl = List<String>.from(data['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
