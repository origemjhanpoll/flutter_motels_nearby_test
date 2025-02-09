import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_amenities_icons.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';

class SuiteCardWidget extends StatefulWidget {
  final SuiteModel suite;
  final String motelName;
  final VoidCallback? onTap;

  const SuiteCardWidget({
    super.key,
    required this.suite,
    required this.motelName,
    this.onTap,
  });

  @override
  State<SuiteCardWidget> createState() => SuiteCardWidgetState();
}

class SuiteCardWidgetState extends State<SuiteCardWidget> {
  int _galleryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        color: theme.primaryColor,
        margin: EdgeInsets.zero.copyWith(bottom: PaddingSize.medium),
        child: Column(
          children: [
            Stack(
              children: [
                GalleryWidget(
                  onGalleryChanged: (value) {
                    setState(() {
                      _galleryIndex = value;
                    });
                  },
                  gallery: widget.suite.photos,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: PaddingSize.medium,
                      right: PaddingSize.medium,
                    ),
                    child: SuiteAmenitiesIcons(
                      categoryItems: widget.suite.categoryItems,
                      isHidden: _galleryIndex > 0,
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: PaddingSize.medium),
              child: Text(
                widget.suite.name,
                style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Divider(
                      height: 1,
                      indent: PaddingSize.extraLarge,
                      endIndent: PaddingSize.medium,
                      color: Colors.white38),
                ),
                Text.rich(
                  TextSpan(
                      children:
                          List.generate(widget.suite.periods.length, (index) {
                    final period = widget.suite.periods[index];
                    return TextSpan(text: '${period.time}h', children: [
                      if (period != widget.suite.periods.last)
                        TextSpan(text: ' • ')
                    ]);
                  })),
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: Colors.white70),
                ),
                Flexible(
                  child: Divider(
                    height: 1,
                    indent: PaddingSize.medium,
                    endIndent: PaddingSize.extraLarge,
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
            if (widget.suite.period.$1 != null)
              Center(
                child: Padding(
                  padding: EdgeInsets.all(PaddingSize.medium)
                      .copyWith(top: PaddingSize.small),
                  child: Text.rich(
                    maxLines: 1,
                    TextSpan(children: [
                      if (widget.suite.period.$2)
                        TextSpan(
                            text: 'de ',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.white70,
                            )),
                      if (widget.suite.period.$2)
                        TextSpan(
                            text: 'R\$ ${widget.suite.period.$1!.price}',
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: Colors.white70,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                              decorationColor: Colors.white38,
                            )),
                      if (widget.suite.period.$2)
                        TextSpan(
                            text: ' por ',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.white70,
                            )),
                      TextSpan(
                          text: 'R\$ ${widget.suite.period.$1!.totalPrice}',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary,
                          )),
                      TextSpan(
                          text: '/${widget.suite.period.$1!.time}h',
                          style: theme.textTheme.labelSmall!
                              .copyWith(color: Colors.white70))
                    ]),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
