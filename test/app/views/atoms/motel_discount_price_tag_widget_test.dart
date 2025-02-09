import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:flutter_motels_nearby_test/app/views/atoms/motel_discount_price_tag_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ModelDiscountPriceTagWidget =>', () {
    final periodWithDiscount = (
      PeriodModel(
        formattedTime: '3 horas',
        time: "3",
        price: 100.0,
        totalPrice: 80.0,
        hasCourtesy: false,
        discount: null,
      ),
      true
    );

    final periodWithoutDiscount = (
      PeriodModel(
        formattedTime: '3 horas',
        time: "3",
        price: 80.0,
        totalPrice: 80.0,
        hasCourtesy: false,
        discount: null,
      ),
      false
    );

    testWidgets('should render correctly with discount', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ModelDiscountPriceTagWidget(period: periodWithDiscount),
          ),
        ),
      );

      expect(find.textContaining('de '), findsOneWidget);
      expect(find.textContaining('R\$ 100.0'), findsOneWidget);
      expect(find.textContaining(' por '), findsOneWidget);
      expect(find.textContaining('R\$ 80.0'), findsOneWidget);
      expect(find.textContaining('/3h'), findsOneWidget);
    });

    testWidgets('should render correctly without discount', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ModelDiscountPriceTagWidget(period: periodWithoutDiscount),
          ),
        ),
      );

      expect(find.textContaining('de '), findsNothing);
      expect(find.textContaining('R\$ 100.0'), findsNothing);
      expect(find.textContaining(' por '), findsNothing);
      expect(find.textContaining('R\$ 80.0'), findsOneWidget);
      expect(find.textContaining('/3h'), findsOneWidget);
    });
  });
}
