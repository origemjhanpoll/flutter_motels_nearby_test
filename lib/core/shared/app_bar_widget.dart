import 'package:flutter/material.dart';
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
      backgroundColor: theme.primaryColor,
      title: ListTile(
        leading: Icon(
          Icons.location_on_rounded,
          color: theme.colorScheme.onPrimary,
        ),
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Localização',
          style: theme.textTheme.labelMedium!.copyWith(
            color: Colors.white70,
          ),
        ),
        subtitle: Text(
          'São Paulo - SP',
          style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        IconButton(
          color: theme.colorScheme.onPrimary,
          onPressed: () => goNewPage(title: 'Notificações', context: context),
          icon: Icon(Icons.notifications_none),
        )
      ],
    );
  }
}
