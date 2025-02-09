import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/empty_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  group('EmptyPage =>', () {
    testWidgets('should display default empty message when no text is provided',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EmptyPage(),
        ),
      );

      expect(find.text('Página vazia'), findsOneWidget);
    });

    testWidgets('should display provided text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EmptyPage(text: 'Nenhum dado encontrado'),
        ),
      );

      expect(find.text('Nenhum dado encontrado'), findsOneWidget);
    });

    testWidgets('should display app bar when title is provided',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EmptyPage(title: 'Minha Página'),
        ),
      );

      expect(find.text('Minha Página'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should display SVG asset when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: EmptyPage(asset: 'assets/icon.svg'),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
    });
  });
}
