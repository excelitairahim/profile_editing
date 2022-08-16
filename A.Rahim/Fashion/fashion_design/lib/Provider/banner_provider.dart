
import 'package:flutter/material.dart';

import '../Api_Service.dart/banner_service.dart';
import '../Model/banner_model.dart';




//import 'package:bpp_shop/fashion/model/Fashion_Model/banner_model.dart';

class BannerProvider extends ChangeNotifier {
  List<Banners> bannerList=[];
  List<Banners> get _bannerList=> bannerList ;
bool isLoading=false;
  getBannerProvide() async {
    isLoading=true;
    final data = await BannerService().getBannerService();

    bannerList = data.banner!;
    isLoading=false;

    notifyListeners();
  }
}
