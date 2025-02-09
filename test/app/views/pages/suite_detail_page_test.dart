import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_periods_list.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/suite_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidgetUnderTest(SuiteModel suite) {
    return MaterialApp(
      home: SuiteDetailPage(
        suite: suite,
        motelName: 'Test Motel',
      ),
    );
  }

  group('SuiteDetailPage =>', () {
    testWidgets('should display suite details correctly', (tester) async {
      final suite = SuiteModel(
        name: 'Test Suite',
        photos: ['https://via.placeholder.com/150'],
        categoryItems: [
          CategoryItemModel(
              name: 'Test Category', icon: 'https://via.placeholder.com/150')
        ],
        items: [ItemModel(name: 'Test Item')],
        periods: [
          PeriodModel(
            formattedTime: '3 horas',
            time: "3",
            price: 88.0,
            totalPrice: 88.0,
            hasCourtesy: false,
            discount: null,
          )
        ],
        quantity: 2,
        showAvailableQuantity: false,
      );

      await tester.pumpWidget(createWidgetUnderTest(suite));

      // Verificar se a imagem da galeria é exibida
      expect(find.byType(GalleryWidget), findsOneWidget);

      // Verificar se o título e o subtítulo são exibidos corretamente
      expect(find.text('Test Suite'), findsOneWidget);
      expect(find.text('Test Motel'), findsOneWidget);

      // Verificar se a lista de períodos é exibida
      expect(find.byType(SuitePeriodsList), findsOneWidget);

      // Verificar se os itens principais são exibidos
      expect(find.text('Principais itens'), findsOneWidget);
      expect(find.text('Test Category'), findsOneWidget);

      // Verificar se os itens adicionais são exibidos
      expect(find.text('Tem também'), findsOneWidget);
      expect(find.text('Test Item'), findsOneWidget);
    });

    testWidgets('should display gallery and handle actions correctly',
        (tester) async {
      final suite = SuiteModel(
        name: 'Test Suite',
        photos: ['https://via.placeholder.com/150'],
        categoryItems: [
          CategoryItemModel(
              name: 'Test Category', icon: 'https://via.placeholder.com/150')
        ],
        items: [ItemModel(name: 'Test Item')],
        periods: [
          PeriodModel(
            formattedTime: '4 horas',
            time: "4",
            price: 88.0,
            totalPrice: 88.0,
            hasCourtesy: false,
            discount: null,
          )
        ],
        quantity: 2,
        showAvailableQuantity: false,
      );

      await tester.pumpWidget(createWidgetUnderTest(suite));

      // Verificar se a imagem da galeria é exibida
      expect(find.byType(GalleryWidget), findsOneWidget);

      // Verificar se o botão de fechar é exibido e funciona corretamente
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(find.byType(SuiteDetailPage), findsNothing);
    });
  });
}
