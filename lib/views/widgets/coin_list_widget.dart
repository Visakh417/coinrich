import 'package:coinrich/models/coins_response_model.dart';
import 'package:coinrich/views/widgets/coin_list_item/coin_list_item.dart';
import 'package:flutter/material.dart';

class CoinListWidget extends StatelessWidget {
  final List<CoinData> coinPriceList;
  const CoinListWidget(this.coinPriceList, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: coinPriceList.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CoinPriceListItem(coinPriceList[index]),
        );
      },
    );
  }
}
