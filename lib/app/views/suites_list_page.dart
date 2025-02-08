import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/suite_detail_page.dart';
import 'package:flutter_motels_nearby_test/app/views/widgets/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/widgets/icon_blur_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/utils/go_next_page.dart';

class SuitesListPage extends StatefulWidget {
  final String title;
  final List<SuiteModel> suites;
  const SuitesListPage({super.key, required this.suites, required this.title});

  @override
  State<SuitesListPage> createState() => _SuitesListPageState();
}

class _SuitesListPageState extends State<SuitesListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          leadingWidth: 76,
          leading: BackButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(theme.colorScheme.primary),
              iconSize: WidgetStatePropertyAll(20.0),
              iconColor: WidgetStatePropertyAll(theme.colorScheme.onPrimary),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          title: Text(widget.title)),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.suites.length,
          padding: EdgeInsets.all(PaddingSize.medium),
          itemBuilder: (context, index) {
            return _SuiteCard(
              suite: widget.suites[index],
              motelName: widget.title,
            );
          },
        ),
      ),
    );
  }
}

class _SuiteCard extends StatefulWidget {
  final SuiteModel suite;
  final String motelName;

  const _SuiteCard({required this.suite, required this.motelName});

  @override
  State<_SuiteCard> createState() => _SuiteCardState();
}

class _SuiteCardState extends State<_SuiteCard> {
  int _galleryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => goNewPage(
          fullscreenDialog: true,
          child: SuiteDetailPage(
            suite: widget.suite,
            motelName: widget.motelName,
          ),
          context: context),
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
                    gallery: widget.suite.photos),
                Padding(
                  padding: EdgeInsets.only(
                    top: PaddingSize.medium,
                    right: PaddingSize.medium,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: PaddingSize.small,
                    children: [
                      ...List.generate(
                          widget.suite.categoryItems.length.clamp(0, 3),
                          (index) {
                        return AnimatedOpacity(
                          opacity: _galleryIndex > 0 ? 0 : 1,
                          duration: Durations.medium2,
                          child: IconBlurWidget(
                              color: Colors.black,
                              child: CachedNetworkImage(
                                color: Colors.white,
                                imageUrl:
                                    widget.suite.categoryItems[index].icon,
                              )),
                        );
                      }),
                      AnimatedOpacity(
                          opacity: _galleryIndex > 0 ? 0 : 1,
                          duration: Durations.medium2,
                          child: IconBlurWidget(
                            color: Colors.black,
                            child: Center(
                                child: Text(
                              '+${widget.suite.categoryItems.length - 3}',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ))
                    ],
                  ),
                ),
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
                          text: 'R\$ ${widget.suite.period.$1.price}',
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
                        text: 'R\$ ${widget.suite.period.$1.totalPrice}',
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary,
                        )),
                    TextSpan(
                        text: '/${widget.suite.period.$1.time}h',
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
