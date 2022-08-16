
// To parse this JSON data, do
//
//     final subSubCatagoriesModel = subSubCatagoriesModelFromJson(jsonString);

import 'dart:convert';

SubSubCatagoriesModel subSubCatagoriesModelFromJson(String str) => SubSubCatagoriesModel.fromJson(json.decode(str));

String subSubCatagoriesModelToJson(SubSubCatagoriesModel data) => json.encode(data.toJson());

class SubSubCatagoriesModel {
    SubSubCatagoriesModel({
        this.subsubcategories,
    });

    List<Subsubcategory>? subsubcategories;

    factory SubSubCatagoriesModel.fromJson(Map<String, dynamic> json) => SubSubCatagoriesModel(
        subsubcategories: List<Subsubcategory>.from(json["subsubcategories"].map((x) => Subsubcategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subsubcategories": List<dynamic>.from(subsubcategories!.map((x) => x.toJson())),
    };
}

class Subsubcategory {
    Subsubcategory({
        this.categoryId,
        this.subcategoryId,
        this.subsubcategorySlugName,
    });

    String? categoryId;
    String? subcategoryId;
    String? subsubcategorySlugName;

    factory Subsubcategory.fromJson(Map<String, dynamic> json) => Subsubcategory(
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        subsubcategorySlugName: json["subsubcategory_slug_name"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "subsubcategory_slug_name": subsubcategorySlugName,
    };
}





// // To parse this JSON data, do
// //
// //     final subSubCatagoriesModel = subSubCatagoriesModelFromJson(jsonString);

// import 'dart:convert';

// SubSubCatagoriesModel subSubCatagoriesModelFromJson(String str) => SubSubCatagoriesModel.fromJson(json.decode(str));

// String subSubCatagoriesModelToJson(SubSubCatagoriesModel data) => json.encode(data.toJson());

// class SubSubCatagoriesModel {
//     SubSubCatagoriesModel({
//         this.subsubcategories,
//     });

//     List<Subsubcategory>? subsubcategories;

//     factory SubSubCatagoriesModel.fromJson(Map<String, dynamic> json) => SubSubCatagoriesModel(
//         subsubcategories: List<Subsubcategory>.from(json["subsubcategories"].map((x) => Subsubcategory.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "subsubcategories": List<dynamic>.from(subsubcategories!.map((x) => x.toJson())),
//     };
// }

// class Subsubcategory {
//     Subsubcategory({
//         this.categoryId,
//         this.subcategoryId,
//         this.subsubcategorySlugName,
//     });

//     String? categoryId;
//     String ?subcategoryId;
//     String ?subsubcategorySlugName;

//     factory Subsubcategory.fromJson(Map<String, dynamic> json) => Subsubcategory(
//         categoryId: json["category_id"],
//         subcategoryId: json["subcategory_id"],
//         subsubcategorySlugName: json["subsubcategory_slug_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "category_id": categoryId,
//         "subcategory_id": subcategoryId,
//         "subsubcategory_slug_name": subsubcategorySlugName,
//     };
// }
