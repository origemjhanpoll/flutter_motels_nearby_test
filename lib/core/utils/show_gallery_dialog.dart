import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showGalleryDialog({
  required BuildContext context,
  required List<String> images,
  int initialImage = 0,
}) async {
  if (!context.mounted) return;

  final navigator = Navigator.of(context);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  if (!context.mounted) return;

  await showDialog(
    context: context,
    barrierColor: Colors.black,
    builder: (context) {
      return Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutBack,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Center(
                  child: PageView.builder(
                    controller: PageController(initialPage: initialImage),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: image,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              );
            },
          ),
          Positioned(
            right: 16,
            top: 2,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
              child: SizedBox.square(
                dimension: 40,
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.black45.withValues(alpha: 0.2),
                        ),
                      ),
                      color: Colors.white,
                      icon: const Icon(Icons.close),
                      onPressed: () => navigator.pop(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );

  if (context.mounted) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
