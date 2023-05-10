import 'package:coinrich/models/coins_response_model.dart';
import 'package:coinrich/values/app_colors.dart';
import 'package:coinrich/views/widgets/coin_list_item/top_row.dart';
import 'package:flutter/material.dart';

import 'bottom_row.dart';

class CoinPriceListItem extends StatelessWidget{
  final CoinData coinData;

  const CoinPriceListItem(this.coinData, {super.key });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TopRowWidget(coinData),
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BottomRowWidget(coinData),
          ),
        ],
      ),
    );
  }

}