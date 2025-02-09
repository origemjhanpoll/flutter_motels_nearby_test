import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_amenities_icons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SuiteAmenitiesIcons =>', () {
    final categoryItems = [
      CategoryItemModel(
          name: 'Frigobar', icon: 'https://example.com/icon1.png'),
      CategoryItemModel(
          name: 'Ar condicionado', icon: 'https://example.com/icon2.png'),
      CategoryItemModel(name: 'TV', icon: 'https://example.com/icon3.png'),
      CategoryItemModel(name: 'Wi-Fi', icon: 'https://example.com/icon4.png'),
    ];

    testWidgets('should render correctly with visible icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteAmenitiesIcons(
                categoryItems: categoryItems, isHidden: false),
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsNWidgets(3));

      expect(find.text('+1'), findsOneWidget);
    });

    testWidgets('should hide icons and show "+n" when isHidden is true',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteAmenitiesIcons(
                categoryItems: categoryItems, isHidden: true),
          ),
        ),
      );

      expect(
          tester
              .widget<AnimatedOpacity>(find.byType(AnimatedOpacity).last)
              .opacity,
          0);
    });

    testWidgets('should not display "+n" if categoryItems length is 3 or less',
        (tester) async {
      final categoryItemsShort = [
        CategoryItemModel(
            name: 'Frigobar', icon: 'https://example.com/icon1.png'),
        CategoryItemModel(
            name: 'Ar condicionado', icon: 'https://example.com/icon2.png'),
        CategoryItemModel(name: 'TV', icon: 'https://example.com/icon3.png'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteAmenitiesIcons(
                categoryItems: categoryItemsShort, isHidden: false),
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsNWidgets(3));

      expect(find.text('+'), findsNothing);
    });
  });
}
