import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://localhost:3000/api/auth";

  static Future<Map<String, dynamic>?> login({
    required String name,
    required int age,
    required String password,
    required String username,
    required String gender,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username":username,
        "password":password
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json["success"] == true) {
        return json["data"];
      }
    }
    return null;
  }
}
