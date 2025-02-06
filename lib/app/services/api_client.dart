import 'dart:convert';
import 'package:flutter_motels_nearby_test/app/models/response_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;
  ApiClient({required this.client});

  final _url =
      'https://raw.githubusercontent.com/origemjhanpoll/flutter_motels_nearby_test/refs/heads/main/test/json/response.json';

  Future<ResponseModel> fetchMotels() async {
    final response = await client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      return ResponseModel.fromJson(decodedJson);
    } else {
      throw Exception('Failed to load motels');
    }
  }
}
