import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/widgets/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/utils/go_next_page.dart';

class SuiteDetailPage extends StatefulWidget {
  final SuiteModel suite;

  const SuiteDetailPage({super.key, required this.suite});

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
              flexibleSpace: Hero(
                tag: Key(widget.suite.photos.first),
                child: GalleryWidget(
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
              ),
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                      right: PaddingSize.small, bottom: PaddingSize.small),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            theme.colorScheme.onPrimary.withValues(alpha: 0.5),
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
                                    Colors.black45.withValues(alpha: 0.2))),
                            color: theme.colorScheme.onPrimary,
                            icon: Icon(Icons.fit_screen_rounded),
                            onPressed: () => showImage(
                                context: context,
                                image: widget.suite.photos[_galleryIndex]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: PaddingSize.medium, bottom: PaddingSize.small),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            theme.colorScheme.onPrimary.withValues(alpha: 0.5),
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
                                    Colors.black45.withValues(alpha: 0.2))),
                            color: theme.colorScheme.onPrimary,
                            icon: Icon(Icons.close),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  subtitle: Text(
                    widget.suite.quantity > 1
                        ? '${widget.suite.quantity} Unidades'
                        : '${widget.suite.quantity} Unidade',
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.all(PaddingSize.medium),
                    itemCount: widget.suite.periods.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      final period = widget.suite.periods[index];

                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        contentPadding: EdgeInsets.zero,
                        title: Text.rich(TextSpan(children: [
                          if (period.discount != null)
                            TextSpan(
                              text: period.price.toString(),
                              style: theme.textTheme.titleLarge!.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                decorationColor: Colors.grey,
                              ),
                            ),
                          if (period.discount != null)
                            TextSpan(
                              text: 'R\$',
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                          if (period.discount != null) TextSpan(text: ' '),
                          TextSpan(
                            text: period.totalPrice.toString(),
                            style: theme.textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'R\$',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ])),
                        titleTextStyle: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Text(
                          period.formattedTime,
                          style: theme.textTheme.bodyLarge,
                        ),
                        trailing: FilledButton(
                          onPressed: () =>
                              goNewPage(title: 'Reservar', context: context),
                          child: Text(
                            'RESERVAR',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
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

  Future<dynamic> showImage(
      {required BuildContext context, required String image}) {
    return showDialog(
        useSafeArea: false,
        context: context,
        barrierColor: Colors.black.withValues(alpha: 0.9),
        builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: CachedNetworkImage(
              imageUrl: image,
              progressIndicatorBuilder: (context, url, progress) =>
                  DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
