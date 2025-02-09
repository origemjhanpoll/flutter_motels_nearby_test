import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';
import 'package:flutter_motels_nearby_test/app/viewmodel/motels_viewmodel.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/motel_card_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/motels_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'motels_list_page_test.mocks.dart';

@GenerateMocks([MotelsViewModel])
void main() {
  late MockMotelsViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockMotelsViewModel();
    provideDummy<MotelsState>(MotelsInit());
    when(mockViewModel.stream).thenAnswer((_) => Stream<MotelsState>.empty());
    GetIt.instance.registerSingleton<MotelsViewModel>(mockViewModel);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      themeMode: ThemeMode.light,
      home: BlocProvider<MotelsViewModel>.value(
        value: mockViewModel,
        child: const MotelsListPage(),
      ),
    );
  }

  group('MotelsListPage =>', () {
    testWidgets('should display loading indicator when state is MotelsLoading',
        (WidgetTester tester) async {
      when(mockViewModel.state).thenReturn(MotelsLoading());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display list of motels when state is MotelsLoaded',
        (WidgetTester tester) async {
      final motels = [
        MotelModel(
            name: 'Motel 1',
            neighborhood: 'Neighborhood 1',
            logo: 'logo1.png',
            suites: [],
            distance: 2,
            favoritesCount: 2,
            rating: 4.5,
            reviewsCount: 10),
        MotelModel(
            name: 'Motel 2',
            neighborhood: 'Neighborhood 2',
            logo: 'logo2.png',
            suites: [],
            distance: 2,
            favoritesCount: 2,
            rating: 4.0,
            reviewsCount: 8),
      ];

      when(mockViewModel.state).thenReturn(MotelsLoaded(motels));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(MotelCardWidget), findsNWidgets(2));
    });

    testWidgets('should display no motels message when state is MotelsEmpty',
        (WidgetTester tester) async {
      when(mockViewModel.state).thenReturn(MotelsEmpty());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Nenhum motel encontrado.'), findsOneWidget);
    });

    testWidgets('should display error message when state is MotelsError',
        (WidgetTester tester) async {
      when(mockViewModel.state).thenReturn(MotelsError('Error message'));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Error message'), findsOneWidget);
    });
  });
}
