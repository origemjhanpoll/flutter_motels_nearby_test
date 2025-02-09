import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/web_blocked_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WebBlockedPage => ', () {
    testWidgets('should renders all elements correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: WebBlockedPage(),
        ),
      );

      expect(find.byIcon(Icons.mobile_screen_share), findsOneWidget);

      expect(find.text('Este aplicativo não está disponível na versão Web.'),
          findsOneWidget);
      expect(find.text('Baixe o aplicativo móvel para continuar.'),
          findsOneWidget);

      expect(find.byType(SvgPicture), findsNWidgets(2));
    });
  });
}
