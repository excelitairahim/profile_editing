// // To parse this JSON data, do
// //
// //     final bannerModel = bannerModelFromJson(jsonString);

// import 'dart:convert';

// BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

// String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

// class BannerModel {
//     BannerModel({
//         this.banner,
//     });

//     List<Banner>? banner;

//     factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
//         banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "banner": List<dynamic>.from(banner!.map((x) => x.toJson())),
//     };
// }

// class Banner {
//     Banner({
//         this.bennarImg,
//     });

//     String ?bennarImg;

//     factory Banner.fromJson(Map<String, dynamic> json) => Banner(
//         bennarImg: json["bennar_img"],
//     );

//     Map<String, dynamic> toJson() => {
//         "bennar_img": bennarImg,
//     };
// }
