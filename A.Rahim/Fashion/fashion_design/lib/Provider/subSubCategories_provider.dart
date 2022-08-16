import 'package:flutter/material.dart';

import '../Api_Service.dart/catagories_service.dart';
import '../Model/subSubCategoriesModel.dart';

class SubSubCategoriesProvider extends ChangeNotifier {
  List<Subsubcategory> subsubcategorieslist = [];

  GetSubSubcategories() async {
    var data = await SubSubCategoriesService().getSubSubCategories();

    subsubcategorieslist = data.subsubcategories!;
    notifyListeners();
  }
}
