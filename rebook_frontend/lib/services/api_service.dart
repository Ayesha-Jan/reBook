import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.188.103"; // for emulator

  static Future<Map<String, dynamic>> getBook() async {
    final res = await http.get(Uri.parse("$baseUrl/books"));
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> sendExchangeRequest(String name) async {
    final res = await http.post(Uri.parse("$baseUrl/exchange/request?name=$name"));
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> acceptExchange() async {
    final res = await http.post(Uri.parse("$baseUrl/exchange/accept"));
    return json.decode(res.body);
  }

  static Future<Map<String, dynamic>> getProfile() async {
    final res = await http.get(Uri.parse("$baseUrl/profile"));
    return json.decode(res.body);
  }
}
