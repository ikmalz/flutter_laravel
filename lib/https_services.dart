import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pwd_model.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000j/api";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Gagal mengambil data user');
    }
  }
}
