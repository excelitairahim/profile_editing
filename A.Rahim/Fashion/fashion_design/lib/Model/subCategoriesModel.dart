// To parse this JSON data, do
//
//     final subCatagoriesModel = subCatagoriesModelFromJson(jsonString);

import 'dart:convert';

SubCatagoriesModel subCatagoriesModelFromJson(String str) => SubCatagoriesModel.fromJson(json.decode(str));

String subCatagoriesModelToJson(SubCatagoriesModel data) => json.encode(data.toJson());

class SubCatagoriesModel {
    SubCatagoriesModel({
        this.subcategory,
    });

    List<Subcategory> ?subcategory;

    factory SubCatagoriesModel.fromJson(Map<String, dynamic> json) => SubCatagoriesModel(
        subcategory: List<Subcategory>.from(json["subcategory"].map((x) => Subcategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subcategory": List<dynamic>.from(subcategory!.map((x) => x.toJson())),
    };
}

class Subcategory {
    Subcategory({
        this.id,
        this.categoryId,
        this.subCategorySlugName,
    });

    int? id;
    String? categoryId;
    String? subCategorySlugName;

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        categoryId: json["category_id"],
        subCategorySlugName: json["sub_category_slug_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "sub_category_slug_name": subCategorySlugName,
    };
}






// // To parse this JSON data, do
// //
// //     final subCatagoriesModel = subCatagoriesModelFromJson(jsonString);

// import 'dart:convert';

// SubCatagoriesModel subCatagoriesModelFromJson(String str) => SubCatagoriesModel.fromJson(json.decode(str));

// String subCatagoriesModelToJson(SubCatagoriesModel data) => json.encode(data.toJson());

// class SubCatagoriesModel {
//     SubCatagoriesModel({
//         this.subcategory,
//     });

//     List<Subcategory>? subcategory;

//     factory SubCatagoriesModel.fromJson(Map<String, dynamic> json) => SubCatagoriesModel(
//         subcategory: List<Subcategory>.from(json["subcategory"].map((x) => Subcategory.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "subcategory": List<dynamic>.from(subcategory!.map((x) => x.toJson())),
//     };
// }

// class Subcategory {
//     Subcategory({
//         this.id,
//         this.categoryId,
//         this.subCategorySlugName,
//     });

//     int? id;
//     String? categoryId;
//     String? subCategorySlugName;

//     factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
//         id: json["id"],
//         categoryId: json["category_id"],
//         subCategorySlugName: json["sub_category_slug_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_id": categoryId,
//         "sub_category_slug_name": subCategorySlugName,
//     };
// }
