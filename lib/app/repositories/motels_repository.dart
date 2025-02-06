import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';

import '../services/api_client.dart';

class MotelsRepository {
  final ApiClient apiClient;
  MotelsRepository(this.apiClient);

  Future<List<MotelModel>> getMotels() async {
    try {
      final response = await apiClient.fetchMotels();
      return response.data.motels;
    } catch (e) {
      throw Exception("Erro ao buscar motéis: $e");
    }
  }
}
