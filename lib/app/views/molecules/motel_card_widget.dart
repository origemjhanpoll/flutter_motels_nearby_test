import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/atoms/motel_discount_price_tag_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/atoms/icon_blur_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';

class MotelCardWidget extends StatefulWidget {
  final String name;
  final String neighborhood;
  final String logo;
  final List<SuiteModel> suites;
  final List<String> gallery;
  final double rating;
  final int reviewsCount;
  final VoidCallback? onTap;
  final ValueChanged<SuiteModel>? onSuiteTap;
  const MotelCardWidget({
    super.key,
    required this.name,
    required this.neighborhood,
    required this.logo,
    required this.suites,
    required this.gallery,
    required this.rating,
    required this.reviewsCount,
    this.onTap,
    this.onSuiteTap,
  });

  @override
  State<MotelCardWidget> createState() => _MotelCardWidgetState();
}

class _MotelCardWidgetState extends State<MotelCardWidget> {
  int _currentIndex = 0;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GalleryWidget(
                onTap: (_) =>
                    widget.onSuiteTap?.call(widget.suites[_currentIndex]),
                gallery: widget.gallery,
                onGalleryChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              ListTile(
                onTap: widget.onTap,
                title: Text(widget.name),
                titleTextStyle: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                subtitle: Text(widget.neighborhood),
                leading: SizedBox.square(
                  dimension: 50.0,
                  child: ClipOval(
                    child: CachedNetworkImage(imageUrl: widget.logo),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      widget.rating.toString(),
                      style: theme.textTheme.labelLarge,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.suites.isNotEmpty &&
            widget.suites[_currentIndex].period.$1 != null)
          Builder(builder: (context) {
            final period = widget.suites[_currentIndex].period;
            return Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: PaddingSize.small, right: PaddingSize.small),
                  child: ModelDiscountPriceTagWidget(
                      period: (period.$1!, period.$2))),
            );
          }),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.only(
                  top: PaddingSize.small, left: PaddingSize.small),
              child: IconBlurWidget(
                  onTap: () => setState(() {
                        liked = !liked;
                      }),
                  child: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ))),
        )
      ],
    );
  }
}
