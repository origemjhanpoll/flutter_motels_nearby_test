import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/utils/go_next_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      forceMaterialTransparency: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Localização',
            style: theme.textTheme.labelSmall!.copyWith(color: theme.hintColor),
          ),
          Row(
            spacing: PaddingSize.small * 0.5,
            children: [
              Icon(Icons.location_on_rounded),
              Text(
                'São Paulo - SP',
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => goNewPage(title: 'Notificações', context: context),
          icon: Icon(Icons.notifications_none),
        )
      ],
    );
  }
}
