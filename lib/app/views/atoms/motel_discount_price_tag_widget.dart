import 'package:flutter/material.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';

class ModelDiscountPriceTagWidget extends StatelessWidget {
  final (PeriodModel, bool) period;
  const ModelDiscountPriceTagWidget({super.key, required this.period});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0), color: theme.primaryColor),
      child: Padding(
        padding: EdgeInsets.all(PaddingSize.small),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text.rich(
                style: TextStyle(overflow: TextOverflow.fade),
                maxLines: 1,
                TextSpan(children: [
                  if (period.$2)
                    TextSpan(
                        text: 'de ',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: Colors.white70,
                        )),
                  if (period.$2)
                    TextSpan(
                        text: 'R\$ ${period.$1.price}',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: Colors.white70,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationColor: Colors.white38,
                        )),
                  if (period.$2)
                    TextSpan(
                        text: ' por ',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: Colors.white70,
                        )),
                  TextSpan(
                      text: 'R\$ ${period.$1.totalPrice}',
                      style: theme.textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      )),
                  TextSpan(
                      text: '/${period.$1.time}h',
                      style: theme.textTheme.labelSmall!
                          .copyWith(color: Colors.white70))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
