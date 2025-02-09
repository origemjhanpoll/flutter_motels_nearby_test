import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';
import 'package:flutter_motels_nearby_test/app/views/atoms/icon_blur_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';

class SuiteAmenitiesIcons extends StatelessWidget {
  final List<CategoryItemModel> categoryItems;
  final bool isHidden;
  const SuiteAmenitiesIcons({
    super.key,
    required this.categoryItems,
    this.isHidden = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: PaddingSize.small,
      children: [
        ...List.generate(categoryItems.length.clamp(0, 3), (index) {
          return AnimatedOpacity(
            opacity: isHidden ? 0 : 1,
            duration: Durations.medium2,
            child: IconBlurWidget(
                color: Colors.black,
                child: CachedNetworkImage(
                  color: Colors.white,
                  imageUrl: categoryItems[index].icon,
                )),
          );
        }),
        AnimatedOpacity(
            opacity: isHidden ? 0 : 1,
            duration: Durations.medium2,
            child: IconBlurWidget(
              color: Colors.black,
              child: Center(
                  child: Text(
                '+${categoryItems.length - 3}',
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ))
      ],
    );
  }
}
