import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/app/views/widgets/gallery_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';

class SuiteDetailPage extends StatefulWidget {
  final SuiteModel suite;

  const SuiteDetailPage({super.key, required this.suite});

  @override
  State<SuiteDetailPage> createState() => _SuiteDetailPageState();
}

class _SuiteDetailPageState extends State<SuiteDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                forceMaterialTransparency: true,
                expandedHeight: screen.height * 0.4,
                pinned: true,
                flexibleSpace: GalleryWidget(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(48.0)),
                  size: Size.fromHeight(screen.height * 0.5),
                  gallery: widget.suite.photos,
                ),
                automaticallyImplyLeading: false,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: PaddingSize.medium, bottom: PaddingSize.small),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.onPrimary
                              .withValues(alpha: 0.5),
                          width: 2, // 🔹 Borda de 2px ao redor do botão
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: PaddingSize.small,
              children: [
                ListTile(
                  title: Text(widget.suite.name),
                  titleTextStyle: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  subtitle: Text(
                    widget.suite.quantity > 1
                        ? '${widget.suite.quantity} Unidades'
                        : '${widget.suite.quantity} Unidade',
                  ),
                ),
                Divider(
                  endIndent: PaddingSize.medium,
                  indent: PaddingSize.medium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: PaddingSize.medium),
                  child: Text(
                    'Principais itens',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: PaddingSize.small),
                  child: Wrap(
                    spacing: PaddingSize.small,
                    children: List.generate(widget.suite.categoryItems.length,
                        (index) {
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: PaddingSize.medium),
                  child: Text(
                    'Tem também',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: PaddingSize.small),
                  child: Wrap(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
