import 'dart:convert';

import 'package:fudge_financial_app/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      // print("response is $data");
      final List<User> users = data.map((user) => User.fromJson(user)).toList();
      // Return only the top 10 users
      return users.take(10).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
