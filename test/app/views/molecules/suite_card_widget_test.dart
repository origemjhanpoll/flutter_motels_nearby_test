import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_amenities_icons.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_card_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/gallery_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SuiteCardWidget =>', () {
    final suite = SuiteModel(
      name: 'Suíte Lua',
      quantity: 1,
      items: [],
      showAvailableQuantity: true,
      photos: [
        'https://example.com/image1.jpg',
        'https://example.com/image2.jpg',
        'https://example.com/image3.jpg',
      ],
      categoryItems: [
        CategoryItemModel(
            name: 'Frigobar', icon: 'https://example.com/icon1.png'),
        CategoryItemModel(
            name: 'Ar condicionado', icon: 'https://example.com/icon2.png'),
      ],
      periods: [
        PeriodModel(
          formattedTime: '3 horas',
          time: "3",
          price: 100.0,
          totalPrice: 80.0,
          hasCourtesy: false,
          discount: null,
        ),
      ],
    );

    testWidgets('should render suite card with gallery', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteCardWidget(
              suite: suite,
              motelName: 'Motel Estrela',
            ),
          ),
        ),
      );

      expect(find.byType(GalleryWidget), findsOneWidget);

      expect(find.text('Suíte Lua'), findsOneWidget);
    });

    testWidgets('should show amenities icons when gallery index is 0',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteCardWidget(
              suite: suite,
              motelName: 'Motel Estrela',
            ),
          ),
        ),
      );

      expect(find.byType(SuiteAmenitiesIcons), findsOneWidget);
    });

    testWidgets('should render the suite price correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteCardWidget(
              suite: suite,
              motelName: 'Motel Estrela',
            ),
          ),
        ),
      );

      expect(find.text('R\$ 80.0/3h'), findsOneWidget);
    });

    testWidgets('should call onTap when card is tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteCardWidget(
              suite: suite,
              motelName: 'Motel Estrela',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SuiteCardWidget));
      await tester.pump();

      expect(tapped, true);
    });
  });
}
