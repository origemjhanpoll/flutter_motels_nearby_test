import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_motels_nearby_test/app/viewmodel/motels_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';
import 'package:flutter_motels_nearby_test/app/repositories/motels_repository.dart';
import 'package:mockito/annotations.dart';

import 'motels_viewmodel_test.mocks.dart';

@GenerateMocks([MotelsRepository])
void main() {
  late MotelsViewModel motelsBloc;
  late MockMotelsRepository mockRepository;

  setUp(() {
    mockRepository = MockMotelsRepository();
    motelsBloc = MotelsViewModel(mockRepository);
  });

  tearDown(() {
    motelsBloc.close();
  });

  group('MotelsViewModel =>', () {
    test('initial state should be MotelsInit', () {
      expect(motelsBloc.state, equals(MotelsInit()));
    });

    blocTest<MotelsViewModel, MotelsState>(
      'should emit [MotelsLoading, MotelsLoaded] when motels are successfully fetched',
      build: () {
        when(mockRepository.getMotels()).thenAnswer((_) async => [
              MotelModel(
                name: 'Motel Teste',
                logo: 'https://example.com/logo.png',
                neighborhood: 'Bairro Teste',
                distance: 5.0,
                favoritesCount: 10,
                suites: [],
                reviewsCount: 100,
                rating: 4.5,
              )
            ]);
        return motelsBloc;
      },
      act: (bloc) => bloc.add(LoadMotels()),
      expect: () => [
        MotelsLoading(),
        isA<MotelsLoaded>()
            .having((state) => state.motels.length, 'motels length', 1),
      ],
    );

    blocTest<MotelsViewModel, MotelsState>(
      'should emit [MotelsLoading, MotelsEmpty] when there are no motels',
      build: () {
        when(mockRepository.getMotels()).thenAnswer((_) async => []);
        return motelsBloc;
      },
      act: (bloc) => bloc.add(LoadMotels()),
      expect: () => [
        MotelsLoading(),
        MotelsEmpty(),
      ],
    );

    blocTest<MotelsViewModel, MotelsState>(
      'should emit [MotelsLoading, MotelsError] when there is an HttpException',
      build: () {
        when(mockRepository.getMotels())
            .thenThrow(HttpException('Erro de conexão'));
        return motelsBloc;
      },
      act: (bloc) => bloc.add(LoadMotels()),
      expect: () => [
        MotelsLoading(),
        MotelsError('Erro de conexão'),
      ],
    );

    blocTest<MotelsViewModel, MotelsState>(
      'should emit [MotelsLoading, MotelsError] when an unknown error occurs',
      build: () {
        when(mockRepository.getMotels())
            .thenThrow(Exception('Erro desconhecido'));
        return motelsBloc;
      },
      act: (bloc) => bloc.add(LoadMotels()),
      expect: () => [
        MotelsLoading(),
        isA<MotelsError>().having((state) => state.message, 'message',
            contains('Erro ao buscar motéis')),
      ],
    );
  });
}
