import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/atoms/icon_blur_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IconBlurWidget =>', () {
    testWidgets('should render correctly with default properties',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: IconBlurWidget(
              child: Icon(Icons.favorite),
            ),
          ),
        ),
      );

      expect(find.byType(IconBlurWidget), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('should apply blur effect', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: IconBlurWidget(
              child: Icon(Icons.star),
            ),
          ),
        ),
      );

      expect(find.byType(BackdropFilter), findsOneWidget);
    });

    testWidgets('should call onTap when tapped', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconBlurWidget(
              child: const Icon(Icons.touch_app),
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(tapped, isFalse);

      await tester.tap(find.byType(IconBlurWidget));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
