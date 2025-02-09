import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/atoms/icon_blur_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/suite_periods_list.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/utils/go_next_page.dart';
import 'package:flutter_motels_nearby_test/core/utils/show_gallery_dialog.dart';

class SuiteDetailPage extends StatefulWidget {
  final String motelName;
  final SuiteModel suite;

  const SuiteDetailPage(
      {super.key, required this.suite, required this.motelName});

  @override
  State<SuiteDetailPage> createState() => _SuiteDetailPageState();
}

class _SuiteDetailPageState extends State<SuiteDetailPage> {
  int _galleryIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.sizeOf(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              forceMaterialTransparency: true,
              expandedHeight: screen.height * 0.4,
              pinned: true,
              flexibleSpace: GalleryWidget(
                onGalleryChanged: (value) {
                  setState(() {
                    _galleryIndex = value;
                  });
                },
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(48.0)),
                size: Size.fromHeight(screen.height * 0.5),
                gallery: widget.suite.photos,
              ),
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: PaddingSize.small,
                    bottom: PaddingSize.small,
                  ),
                  child: IconBlurWidget(
                      onTap: () => showGalleryDialog(
                            context: context,
                            images: widget.suite.photos,
                            initialImage: _galleryIndex,
                          ),
                      child: Icon(
                        Icons.aspect_ratio,
                        color: theme.colorScheme.onPrimary,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: PaddingSize.medium,
                    bottom: PaddingSize.small,
                  ),
                  child: IconBlurWidget(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        color: theme.colorScheme.onPrimary,
                      )),
                )
              ],
            ),
          ];
        },
        body: SafeArea(
          top: false,
          bottom: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(PaddingSize.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(widget.suite.name),
                  contentPadding: EdgeInsets.zero,
                  titleTextStyle: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  subtitle: Text(widget.motelName),
                ),
                SuitePeriodsList(
                  periods: widget.suite.periods,
                  onTap: () => goNewPage(title: 'Reservar', context: context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: PaddingSize.medium),
                  child: Text(
                    'Principais itens',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  spacing: PaddingSize.small,
                  children:
                      List.generate(widget.suite.categoryItems.length, (index) {
                    final categoryItem = widget.suite.categoryItems[index];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox.square(
                          dimension: 48,
                          child:
                              CachedNetworkImage(imageUrl: categoryItem.icon),
                        ),
                        Text(
                          categoryItem.name,
                          style: theme.textTheme.bodyMedium,
                        )
                      ],
                    );
                  }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: PaddingSize.medium),
                  child: Text(
                    'Tem também',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  spacing: PaddingSize.small,
                  children: List.generate(widget.suite.items.length, (index) {
                    final item = widget.suite.items[index];
                    return Chip(
                      visualDensity: VisualDensity.compact,
                      labelStyle: theme.textTheme.bodyMedium,
                      color: WidgetStatePropertyAll(theme.highlightColor),
                      label: Text(item.name),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
