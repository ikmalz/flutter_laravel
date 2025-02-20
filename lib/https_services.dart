import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pwd_model.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }
}
