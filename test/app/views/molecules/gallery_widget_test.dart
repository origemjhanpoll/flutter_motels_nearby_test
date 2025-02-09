import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/gallery_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  group('GalleryWidget =>', () {
    final galleryImages = [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
      'https://example.com/image3.jpg',
    ];

    testWidgets('should render correctly with images', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GalleryWidget(gallery: galleryImages),
          ),
        ),
      );

      final cachedNetworkImage =
          tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(cachedNetworkImage.imageUrl, galleryImages.first);
      expect(find.byType(AnimatedSmoothIndicator), findsOneWidget);
    });

    testWidgets('should call onGalleryChanged when page changes',
        (tester) async {
      int changedIndex = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GalleryWidget(
              gallery: galleryImages,
              onGalleryChanged: (index) {
                changedIndex = index;
              },
            ),
          ),
        ),
      );

      await tester.drag(find.byType(PageView), const Offset(-600, 0));
      await tester.pump(const Duration(milliseconds: 500));

      expect(changedIndex, 1);
    });

    testWidgets('should call onTap when image is tapped', (tester) async {
      String? tappedImage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GalleryWidget(
              gallery: galleryImages,
              onTap: (image) {
                tappedImage = image;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CachedNetworkImage).first);
      await tester.pump();

      expect(tappedImage, galleryImages.first);
    });
  });
}
