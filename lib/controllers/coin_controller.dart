import 'dart:convert';

import 'package:coinrich/models/coins_response_model.dart';

import '../models/api_error_model.dart';
import '../repository/api_calls.dart';
import '../repository/end_points.dart';

class CoinController{
  /// [CoinController] is responsible for all the Coin related functionalities
  
  /// [fetchCoinPriceList] fetch data from NY Times Server
  /// and return a [CoinResponse] object
  Future<CoinResponse> fetchCoinPriceList(String symbols) async {
    try {

      /// Fetch the response in [responseModel]
      ResponseModel responseModel =
          await APICall().get("${EndPoints.coinPriceList}?symbol=$symbols",header: {
            'X-CMC_PRO_API_KEY' : EndPoints.apiKey
          });

      /// Extracts the 'body', 'StatusCode', 'message' from [responseModel]
      /// Convert those data to an [CoinResponse] Object
      Map<String, dynamic> body = jsonDecode(responseModel.response?.body ?? "");
      CoinResponse coinResponse = CoinResponse(
          responseModel.response?.statusCode ?? 500,
          responseData: body,
          message: responseModel.response?.statusCode == 200
              ? null
              : NetworkStatusMessages.somethingWentWrong);
      return coinResponse;
    } catch (e) {
      /// If any issue raise in this process, it will be considered as Internal Error
      CoinResponse coinResponse =
          CoinResponse(500, message: NetworkStatusMessages.somethingWentWrong);
      return coinResponse;
    }
  }
}