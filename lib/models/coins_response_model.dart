import 'package:flutter/material.dart';

class CoinResponse {
  List<CoinData> coinPriceList = [];
  int statusCode;
  String? message;

  CoinResponse(this.statusCode,
      {Map<String?, dynamic> responseData = const {}, this.message}) {
    Map<String?, dynamic> data = responseData['data'];

    try {
      for (var element in data.values) {
        coinPriceList.add(CoinData.fromJson(element));
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}

class CoinData {
  num? id;
  String? name;
  String? symbol;
  String? slug;
  num? numMarketPairs;
  String? dateAdded;
  List<String>? tags;
  num? maxSupply;
  num? circulatingSupply;
  num? totalSupply;
  num? isActive;
  bool? infiniteSupply;
  num? cmcRank;
  num? isFiat;
  String? lastUpdated;
  Quote? quote;

  CoinData(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.numMarketPairs,
      this.dateAdded,
      this.tags,
      this.maxSupply,
      this.circulatingSupply,
      this.totalSupply,
      this.isActive,
      this.infiniteSupply,
      this.cmcRank,
      this.isFiat,
      this.lastUpdated,
      this.quote});

  CoinData.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];
    maxSupply = json['max_supply'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    isActive = json['is_active'];
    infiniteSupply = json['infinite_supply'];
    cmcRank = json['cmc_rank'];
    isFiat = json['is_fiat'];

    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }
}

class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String?, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }
}

class USD {
  double? price;
  double? volume24h;
  double? volumeChange24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? percentChange30d;
  double? percentChange60d;
  double? percentChange90d;
  double? marketCap;
  double? marketCapDominance;
  double? fullyDilutedMarketCap;
  String? lastUpdated;

  USD(
      {this.price,
      this.volume24h,
      this.volumeChange24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.percentChange30d,
      this.percentChange60d,
      this.percentChange90d,
      this.marketCap,
      this.marketCapDominance,
      this.fullyDilutedMarketCap,
      this.lastUpdated});

  USD.fromJson(Map<String?, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }
}
