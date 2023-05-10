import 'package:coinrich/providers/coin_provider.dart';
import 'package:coinrich/values/app_colors.dart';
import 'package:coinrich/values/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinListHeader extends StatelessWidget {
  const CoinListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        chartWidget(context),
        Consumer<CoinProvider>(builder: (context, coinProvider, child) {
          return Text("Count : ${coinProvider.coinResponse?.coinPriceList.length ?? 0}", style: Theme.of(context).textTheme.bodyMedium,);
        },)
      ],
    );
  }

  Widget chartWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.pie_chart_outline_rounded,
          color: AppColors.accentColor,
        ),
        const SizedBox(width: 8,),
        Text(
          StringConstants.showChart,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.accentColor
          ),
        )
      ],
    );
  }
}
