// To parse this JSON data, do
//
//     final catagoriesModel = catagoriesModelFromJson(jsonString);

import 'dart:convert';

CatagoriesModel catagoriesModelFromJson(String str) => CatagoriesModel.fromJson(json.decode(str));

String catagoriesModelToJson(CatagoriesModel data) => json.encode(data.toJson());

class CatagoriesModel {
    CatagoriesModel({
        this.getcategory,
    });

    List<Getcategory>? getcategory;

    factory CatagoriesModel.fromJson(Map<String, dynamic> json) => CatagoriesModel(
        getcategory: List<Getcategory>.from(json["getcategory"].map((x) => Getcategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "getcategory": List<dynamic>.from(getcategory!.map((x) => x.toJson())),
    };
}

class Getcategory {
    Getcategory({
        this.id,
        this.categoryName,
        this.categoryIcon,
    });

    int? id;
    String ?categoryName;
    String ?categoryIcon;

    factory Getcategory.fromJson(Map<String, dynamic> json) => Getcategory(
        id: json["id"],
        categoryName: json["category_name"],
        categoryIcon: json["category_icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_icon": categoryIcon,
    };
}





// // To parse this JSON data, do
// //
// //     final catagoriesModel = catagoriesModelFromJson(jsonString);

// import 'dart:convert';

// CatagoriesModel catagoriesModelFromJson(String str) => CatagoriesModel.fromJson(json.decode(str));

// String catagoriesModelToJson(CatagoriesModel data) => json.encode(data.toJson());

// class CatagoriesModel {
//     CatagoriesModel({
//         this.getcategory,
//     });

//     List<Getcategory> ?getcategory;

//     factory CatagoriesModel.fromJson(Map<String, dynamic> json) => CatagoriesModel(
//         getcategory: List<Getcategory>.from(json["getcategory"].map((x) => Getcategory.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "getcategory": List<dynamic>.from(getcategory!.map((x) => x.toJson())),
//     };
// }

// class Getcategory {
//     Getcategory({
//         this.id,
//         this.categoryName,
//         this.categorySlugName,
//         this.categoryImage,
//         this.categoryIcon,
//     });

//     int? id;
//     String? categoryName;
//     String? categorySlugName;
//     String ?categoryImage;
//     String ?categoryIcon;

//     factory Getcategory.fromJson(Map<String, dynamic> json) => Getcategory(
//         id: json["id"],
//         categoryName: json["category_name"],
//         categorySlugName: json["category_slug_name"],
//         categoryImage: json["category_image"],
//         categoryIcon: json["category_icon"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_name": categoryName,
//         "category_slug_name": categorySlugName,
//         "category_image": categoryImage,
//         "category_icon": categoryIcon,
//     };
// }
