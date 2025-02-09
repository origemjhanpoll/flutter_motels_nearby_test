import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_motels_nearby_test/app/models/response_model.dart';
import 'package:flutter_motels_nearby_test/app/services/api_client.dart';
import 'package:mockito/annotations.dart';

import '../../load_json.dart';
import '../../sample/response_sample.dart';
import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  final responseJson = await loadJson('test/json/response.json');

  late ApiClient apiClient;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiClient = ApiClient(client: mockClient);
  });

  group('ApiClient =>', () {
    test('should return a ResponseModel when the HTTP call is successful',
        () async {
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(responseJson), 200),
      );

      final result = await apiClient.fetchMotels();

      expect(result, isA<ResponseModel>());
      expect(result, responseSample);
    });

    test('should throw an HttpException when the HTTP call returns an error',
        () async {
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      final result = apiClient.fetchMotels();

      expect(result, throwsA(isA<HttpException>()));
    });

    test('should rethrow any other exceptions that occur', () async {
      when(mockClient.get(any)).thenThrow(Exception('Unexpected error'));

      final result = apiClient.fetchMotels();

      expect(result, throwsA(isA<Exception>()));
    });
  });
}
