import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/constants/screen_size.dart';

class MotelCardWidget extends StatelessWidget {
  final String name;
  final String neighborhood;
  final String logo;
  final List<SuiteModel> suites;
  const MotelCardWidget({
    super.key,
    required this.name,
    required this.neighborhood,
    required this.logo,
    required this.suites,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.sizeOf(context);
    final isSmall = screen.width < ScreenSize.small;
    final size = Size(screen.width, 560);

    return Column(
      children: [
        ListTile(
          title: Text(name),
          titleTextStyle: theme.textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
          subtitle: Text(neighborhood),
          leading: SizedBox.square(
            dimension: 50.0,
            child: ClipRect(
              child: CachedNetworkImage(imageUrl: logo),
            ),
          ),
        ),
        SizedBox(
          height: size.height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: suites.length,
            padding: EdgeInsets.symmetric(horizontal: PaddingSize.medium),
            itemBuilder: (context, index) {
              final suite = suites[index];

              return Card(
                margin: EdgeInsets.only(right: PaddingSize.small),
                child: SizedBox.fromSize(
                  size: Size.fromWidth(
                      isSmall ? screen.width * .9 : screen.width * .35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(PaddingSize.medium)
                            .copyWith(bottom: 0.0),
                        child: CachedNetworkImage(
                            imageUrl: suite.photos.first, fit: BoxFit.cover),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: PaddingSize.medium),
                        title: Text(suite.name),
                        titleTextStyle: theme.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        subtitle: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: PaddingSize.small),
                          child: Wrap(
                            runSpacing: PaddingSize.small,
                            spacing: PaddingSize.small,
                            children: List.generate(suite.categoryItems.length,
                                (index) {
                              final categoryItem = suite.categoryItems[index];
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                    color:
                                        theme.colorScheme.surfaceContainerHigh),
                                child: SizedBox.square(
                                  dimension: 34,
                                  child: CachedNetworkImage(
                                    imageUrl: categoryItem.icon,
                                    color: theme.primaryColor,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(color: theme.primaryColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: PaddingSize.medium),
                          child: Column(
                            children:
                                List.generate(suite.periods.length, (index) {
                              final period = suite.periods[index];
                              return ListTile(
                                title: Text(period.formattedTime.toString()),
                                titleTextStyle:
                                    theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                                trailing: SizedBox(
                                  width: 120.0,
                                  child: FilledButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.white),
                                    ),
                                    child: Text(
                                      'R\$ ${period.totalPrice.toString()}',
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
