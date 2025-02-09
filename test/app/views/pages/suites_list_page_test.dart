import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/suites_list_page.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_card_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SuitesListPage =>', () {
    final List<SuiteModel> suites = [
      SuiteModel(
        name: 'Suíte Marselha',
        quantity: 1,
        showAvailableQuantity: true,
        photos: ['https://example.com/photo1.jpg'],
        items: [],
        categoryItems: [],
        periods: [],
      ),
      SuiteModel(
        name: 'Suíte Paris',
        quantity: 1,
        showAvailableQuantity: true,
        photos: ['https://example.com/photo2.jpg'],
        items: [],
        categoryItems: [],
        periods: [],
      ),
    ];

    testWidgets('should render a list of suites', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SuitesListPage(
            suites: suites,
            title: 'Motels Nearby',
          ),
        ),
      );

      expect(find.byType(SuiteCardWidget), findsNWidgets(suites.length));
    });
  });
}
