import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/suite_detail_page.dart';
import 'package:flutter_motels_nearby_test/app/views/widgets/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/utils/go_next_page.dart';

class MotelCardWidget extends StatefulWidget {
  final String name;
  final String neighborhood;
  final String logo;
  final List<SuiteModel> suites;
  final List<String> gallery;
  final double rating;
  final int reviewsCount;
  final VoidCallback? onTap;
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
                onTap: (value) => goNewPage(
                    fullscreenDialog: true,
                    context: context,
                    child: SuiteDetailPage(
                      suite: widget.suites[_currentIndex],
                      motelName: widget.name,
                    )),
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
        if (widget.suites[_currentIndex].periods.isNotEmpty)
          Builder(builder: (context) {
            final period = widget.suites[_currentIndex].period;
            return Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: PaddingSize.small, right: PaddingSize.small),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: theme.primaryColor),
                  child: Padding(
                    padding: EdgeInsets.all(PaddingSize.small),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text.rich(
                            style: TextStyle(overflow: TextOverflow.fade),
                            maxLines: 1,
                            TextSpan(children: [
                              if (period.$2)
                                TextSpan(
                                    text: 'de ',
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      color: Colors.white70,
                                    )),
                              if (period.$2)
                                TextSpan(
                                    text: 'R\$ ${period.$1.price}',
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      color: Colors.white70,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2,
                                      decorationColor: Colors.white38,
                                    )),
                              if (period.$2)
                                TextSpan(
                                    text: ' por ',
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      color: Colors.white70,
                                    )),
                              TextSpan(
                                  text: 'R\$ ${period.$1.totalPrice}',
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onPrimary,
                                  )),
                              TextSpan(
                                  text: '/${period.$1.time}h',
                                  style: theme.textTheme.labelSmall!
                                      .copyWith(color: Colors.white70))
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                top: PaddingSize.small, left: PaddingSize.small),
            child: SizedBox.square(
              dimension: 40,
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2)),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                      icon:
                          Icon(liked ? Icons.favorite : Icons.favorite_border),
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
