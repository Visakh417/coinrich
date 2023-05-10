import 'package:coinrich/models/api_error_model.dart';
import 'package:coinrich/providers/coin_provider.dart';
import 'package:coinrich/values/string_constants.dart';
import 'package:coinrich/views/widgets/coin_list_header.dart';
import 'package:coinrich/views/widgets/coin_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../values/app_colors.dart';
import '../widgets/custom_circular_progress.dart';
import '../widgets/error_message_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    /// Initiate to fetch coinPriceList in  [initState]
    /// if only data is not available
    if (Provider.of<CoinProvider>(context, listen: false).coinResponse ==
        null) {
      Provider.of<CoinProvider>(context, listen: false).fetchCoinPriceList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CoinListHeader(),
          ),
          /// The [Consumer] will listen to the [CoinProvider]
          /// and it will rebuild the widget whenever a change
          /// occur in [CoinProvider] class
          Consumer<CoinProvider>(
            builder: (context, coinProvider, child) {
              // Shows a loading widget, if the CoinPriceDetails is been loading
              if (coinProvider.coinResponse == null) {
                return const Center(child: CustomCircularProgress());
              }

              // List the CoinPrice
              if (coinProvider.coinResponse?.statusCode == 200) {
                return Expanded(
                  child: CoinListWidget(
                      coinProvider.coinResponse?.coinPriceList ?? []),
                );
              }

              /// Shows a Error message if [statusCode] is not 200
              /// Set the message as [StringConstants.somethingWentWrong], if the response message is null
              return ErrorMessageWidget(coinProvider.coinResponse?.message ??
                  NetworkStatusMessages.somethingWentWrong);
            },
          )
        ],
      ),
    ));
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        StringConstants.appName,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
