import 'dart:convert';
import 'package:fin_project/models/profile_model.dart';
import 'package:http/http.dart' as http;


class ProfileService {
  final String url = 'https://randomuser.me/api/';

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final userJson = jsonData['results'][0];
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
