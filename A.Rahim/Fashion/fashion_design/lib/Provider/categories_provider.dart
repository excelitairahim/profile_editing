import 'package:flutter/material.dart';

import '../Api_Service.dart/catagories_service.dart';
import '../Model/categoriesModel.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Getcategory> catagorieslist = [];

  bool isLoading = false;
  Getcategorydata() async {
    isLoading = true;
    var data = await CategoriesService().getCategories();

    catagorieslist = data.getcategory!;
    isLoading = false;
    notifyListeners();

    // print(Categories);
  }

  
}
