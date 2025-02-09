import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/discount_model.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_periods_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SuitePeriodsList =>', () {
    final periods = [
      PeriodModel(
        formattedTime: '3 horas',
        time: '3',
        price: 120.0,
        totalPrice: 100.0,
        hasCourtesy: false,
        discount: DiscountModel(amount: 20.0),
      ),
      PeriodModel(
        formattedTime: '5 horas',
        time: '5',
        price: 150.0,
        totalPrice: 140.0,
        hasCourtesy: false,
        discount: null,
      ),
    ];

    testWidgets('should render list of periods', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuitePeriodsList(
              periods: periods,
            ),
          ),
        ),
      );

      expect(find.byType(ListTile), findsNWidgets(periods.length));
    });

    testWidgets('should display price with discounted', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuitePeriodsList(
              periods: periods,
            ),
          ),
        ),
      );

      expect(
        find.text('120.0R\$ 100.0R\$'),
        findsOneWidget,
      );
    });

    testWidgets('should call onTap when "RESERVAR" is pressed', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuitePeriodsList(
              periods: periods,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('RESERVAR').first);
      await tester.pump();

      expect(tapped, true);
    });
  });
}
