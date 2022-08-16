

import 'package:fashion_design/Model/hotmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class HotDealsService {
  Future<HotDealModel> getHotDealService() async {
    Map<String, dynamic>? result;
    try {
      String url = 'https://bppshops.com/api/fashion/hotdeals';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
     result = convert.jsonDecode(response.body);
        print( 'Hot Deal data: $result');
        return HotDealModel.fromJson(result!) ;
      }
    } catch (e) {
      print(e.toString());
    }
    return HotDealModel.fromJson(result!);
  }
}



class HotDealsProvider extends ChangeNotifier{
  List<HotDeal> hotDealList=[];
  getHotDealsProvider()async{
    var data= await HotDealsService().getHotDealService();
    hotDealList=data.hotDeals!;
    print('Brand Length ${hotDealList.length}');
 notifyListeners();
  }
}