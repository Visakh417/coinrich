import 'package:coinrich/models/coins_response_model.dart';
import 'package:flutter/material.dart';

import '../controllers/coin_controller.dart';

class CoinProvider extends ChangeNotifier {
  CoinResponse? coinResponse;

  /// In [requiredCoins] we can save the coin symbols
  /// Those saved coins will be fetched from the API
  List<String> requiredCoins = ["BTC", "ETH", "LTC"];

  /// Fetch Coin and its Price Details
  /// if [clear] is true, the value in [coinResponse] will be assigned as null
  Future<void> fetchCoinPriceList({bool clear = false}) async {
    if (clear) {
      coinResponse = null;
      notifyListeners();
    }

    /// Any situation, [CoinController] will provide a non-nullable value
    /// Only the coins we saved on [requiredCoins] will be fetched
    coinResponse =
        await CoinController().fetchCoinPriceList(requiredCoins.join(","));
    notifyListeners();
  }
}
