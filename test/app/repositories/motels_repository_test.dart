import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_motels_nearby_test/app/repositories/motels_repository.dart';
import 'package:flutter_motels_nearby_test/app/services/api_client.dart';
import 'package:mockito/annotations.dart';

import '../../sample/data_sample.dart';
import '../../sample/motel_sample.dart';
import '../../sample/response_sample.dart';

import 'motels_repository_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late MotelsRepository motelsRepository;

  setUp(() {
    mockApiClient = MockApiClient();
    motelsRepository = MotelsRepository(mockApiClient);
  });

  group('MotelsRepository =>', () {
    test('should return a list of motels when the API call is successful',
        () async {
      final res = responseSample.copyWith(
          data: dataSample.copyWith(motels: [motelSample]));

      when(mockApiClient.fetchMotels()).thenAnswer((_) async => res);

      final result = await motelsRepository.getMotels();

      expect(result, [motelSample]);
    });

    test('should throw an HttpException when the API call fails', () async {
      when(mockApiClient.fetchMotels())
          .thenThrow(HttpException('Failed to fetch motels'));

      final result = motelsRepository.getMotels();

      expect(result, throwsA(isA<HttpException>()));
    });

    test(
        'should throw a generic Exception if the API call fails for any other reason',
        () async {
      when(mockApiClient.fetchMotels())
          .thenThrow(Exception('Unexpected error'));

      final result = motelsRepository.getMotels();

      expect(result, throwsA(isA<Exception>()));
    });
  });
}
