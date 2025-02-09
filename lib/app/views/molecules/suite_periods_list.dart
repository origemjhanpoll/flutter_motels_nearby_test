import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';

class SuitePeriodsList extends StatelessWidget {
  final List<PeriodModel> periods;
  final VoidCallback? onTap;
  const SuitePeriodsList({
    super.key,
    required this.periods,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: ListView.separated(
        padding: EdgeInsets.all(PaddingSize.medium),
        itemCount: periods.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          final period = periods[index];

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
                  style:
                      theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
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
              onPressed: onTap,
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
    );
  }
}
