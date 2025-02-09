import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GalleryWidget extends StatefulWidget {
  final List<String> gallery;
  final ValueChanged<int>? onGalleryChanged;
  final Size? size;
  final BorderRadius? borderRadius;
  final ValueChanged<String>? onTap;
  const GalleryWidget({
    super.key,
    required this.gallery,
    this.onGalleryChanged,
    this.size,
    this.borderRadius,
    this.onTap,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(24.0),
      child: SizedBox.fromSize(
        size: widget.size ?? const Size.fromHeight(200),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              itemCount: widget.gallery.length,
              onPageChanged: (index) {
                widget.onGalleryChanged?.call(index);
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final image = widget.gallery[index];
                return IgnorePointer(
                  ignoring: widget.onTap == null,
                  child: GestureDetector(
                    onTap: () => widget.onTap?.call(image),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                      ),
                      imageUrl: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            if (widget.gallery.isNotEmpty)
              Positioned(
                bottom: PaddingSize.medium,
                child: AnimatedSmoothIndicator(
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: Durations.medium2,
                      curve: Curves.easeInOut,
                    );
                  },
                  activeIndex: _currentIndex,
                  count: widget.gallery.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white54,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
