import 'package:coinrich/models/coins_response_model.dart';
import 'package:coinrich/utils/number_utils.dart';
import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class TopRowWidget extends StatelessWidget {
  final CoinData coinData;
  const TopRowWidget(this.coinData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          coinData.name ?? "N/A",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          isPriceChangeNegative ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
          size: 20,
          color: isPriceChangeNegative
              ? AppColors.red
              : AppColors.green,
        ),
        Text(
          "${NumberUtils.getReducedFigure(coinData.quote?.uSD?.percentChange24h)}%",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.subText),
        ),
        const Spacer(),
        CoinSymbol(coinData.symbol ?? "N/A")
      ],
    );
  }

  bool get isPriceChangeNegative{
    if((coinData.quote?.uSD?.percentChange24h ?? 0) < 0){
      return true;
    }return false;
  }
}

class CoinSymbol extends StatelessWidget {
  final String symbol;

  const CoinSymbol(this.symbol, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        symbol,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
