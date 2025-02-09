import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/motel_card_widget.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';

void main() {
  group('MotelCardWidget =>', () {
    late Widget widgetUnderTest;
    late List<SuiteModel> mockSuites;
    late List<String> mockGallery;

    setUp(() {
      mockSuites = [
        SuiteModel(
          name: 'Suíte Teste',
          quantity: 1,
          showAvailableQuantity: true,
          photos: ['https://via.placeholder.com/300'],
          items: [],
          categoryItems: [],
          periods: [],
        ),
      ];

      mockGallery = ['https://via.placeholder.com/300'];

      widgetUnderTest = MaterialApp(
        home: Scaffold(
          body: MotelCardWidget(
            name: 'Motel Teste',
            neighborhood: 'Centro',
            logo: 'https://via.placeholder.com/50',
            suites: mockSuites,
            gallery: mockGallery,
            rating: 4.5,
            reviewsCount: 100,
          ),
        ),
      );
    });

    testWidgets('should display motel name, neighborhood, and rating',
        (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest);

      expect(find.text('Motel Teste'), findsOneWidget);
      expect(find.text('Centro'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
    });

    testWidgets('should toggle favorite when heart icon is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest);

      final heartIcon = find.byIcon(Icons.favorite_border);
      expect(heartIcon, findsOneWidget);

      await tester.tap(heartIcon);
      await tester.pump();

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}
