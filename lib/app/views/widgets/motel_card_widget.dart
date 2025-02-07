import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/widgets/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';

class MotelCardWidget extends StatelessWidget {
  final String name;
  final String neighborhood;
  final String logo;
  final List<SuiteModel> suites;
  final List<String> gallery;
  final double rating;
  final int reviewsCount;
  const MotelCardWidget({
    super.key,
    required this.name,
    required this.neighborhood,
    required this.logo,
    required this.suites,
    required this.gallery,
    required this.rating,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final screen = MediaQuery.of(context);

    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GalleryWidget(gallery: gallery),
              ListTile(
                title: Text(name),
                titleTextStyle: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                subtitle: Text(neighborhood),
                leading: SizedBox.square(
                  dimension: 50.0,
                  child: ClipOval(
                    child: CachedNetworkImage(imageUrl: logo),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star_rounded),
                    Text(
                      rating.toString(),
                      style: theme.textTheme.labelLarge,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(
                top: PaddingSize.small, right: PaddingSize.small),
            child: SizedBox.square(
              dimension: 40,
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
