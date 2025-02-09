import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/core/shared/back_button_custom_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPage extends StatelessWidget {
  final String? title;
  final String? text;
  final String? asset;
  const EmptyPage({super.key, this.title, this.text, this.asset});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: title != null
          ? AppBar(leading: BackButtonCustomWidget(), title: Text(title!))
          : null,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (asset != null)
                SvgPicture.asset(
                  asset!,
                  width: 46.0,
                  height: 46.0,
                  colorFilter:
                      ColorFilter.mode(Colors.grey.shade400, BlendMode.srcIn),
                ),
              Text(
                text ?? 'Página vazia',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
