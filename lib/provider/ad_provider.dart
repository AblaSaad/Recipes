import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes/models/ad.model.dart';
// ad_provider.dart

class AdProvider with ChangeNotifier {
  List<Ad> adsList = [];

  List<Ad> get ads => adsList;

  Future<void> loadAds() async {
    final String jsonAds =
        await rootBundle.loadString('assets/data/sample.json');
    var decodedJson =
        List<Map<String, dynamic>>.from(jsonDecode(jsonAds)['ads']);

    adsList = decodedJson.map((json) => Ad.fromJson(json)).toList();

    notifyListeners();
  }
}
