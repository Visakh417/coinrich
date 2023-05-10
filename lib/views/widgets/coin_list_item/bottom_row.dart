import 'package:coinrich/models/coins_response_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/number_utils.dart';
import '../../../values/app_colors.dart';

class BottomRowWidget extends StatelessWidget {
  final CoinData coinData;

  const BottomRowWidget(this.coinData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabelValueWidget(
          label: "Price",
          value: "\$ ${NumberUtils.getReducedFigure(coinData.quote?.uSD?.price)}",
        ),
        const SizedBox(width: 24),
        LabelValueWidget(
          label: "Rank",
          value: "${coinData.cmcRank ?? "N/A"}",
        ),
        const Spacer(),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.arrow_forward_rounded, 
              size: 20,
              color: AppColors.black,),
        ),
      ],
    );
  }
}

class LabelValueWidget extends StatelessWidget {
  final String label, value;

  const LabelValueWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
