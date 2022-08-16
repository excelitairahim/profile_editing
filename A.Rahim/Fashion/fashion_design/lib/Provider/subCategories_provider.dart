import 'package:fashion_design/Component/drawer.dart';
import 'package:flutter/material.dart';

import '../Api_Service.dart/catagories_service.dart';
import '../Model/subCategoriesModel.dart';

class SubCategoriesProvider extends ChangeNotifier {
  List<Subcategory> subCategorieslist = [];


  bool isLoading = false;
  getSubCategoriesdata() async {
    isLoading = true;
    var data = await SubCategoriesService().getSubCategories( );
    subCategorieslist = data.subcategory!;
    isLoading = false;
    notifyListeners();
  }
}
