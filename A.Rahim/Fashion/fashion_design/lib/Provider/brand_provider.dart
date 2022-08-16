
import 'package:flutter/material.dart';

import '../Api_Service.dart/brand_service.dart';
import '../Model/brand_model.dart';



class BrandProvider extends ChangeNotifier{
  List<Brand> brandList=[];
  bool isLoading=false;
   List<Brand>get _brandList=> brandList;
  getBrandProvider()async{
    isLoading=true;
    var data= await BrandService().getBrandService();
    brandList=data.brands!;
    print('Brand Length ${brandList.length}');
    isLoading=false;
 notifyListeners();
  }
}