import 'package:fashion_design/App_Color/app_color.dart';
import 'package:fashion_design/Component/appbar.dart';
import 'package:fashion_design/Provider/banner_provider.dart';
import 'package:fashion_design/Provider/brand_provider.dart';
import 'package:fashion_design/widget/best_selling.dart';
import 'package:fashion_design/widget/latest_product.dart';
import 'package:fashion_design/widget/mostPopular_product.dart';
import 'package:fashion_design/widget/new_products.dart';
import 'package:fashion_design/widget/sport_food_bikes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:new_version/new_version.dart';
import '../Component/drawer.dart';
import '../widget/daily_best_sell.dart';
import '../widget/hot_deals.dart';
import '../widget/special_deal.dart';
import '../widget/special_offer.dart';
import '../widget/top_categoties.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
    {'image': 'assets/pic3.png', 'name': 'Kids'},
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
  ];

  @override
  void initState() {_checkVersion();
    BannerProvider bannerProvider =
        Provider.of<BannerProvider>(context, listen: false);
    bannerProvider.getBannerProvide();
    BrandProvider brandProvider =
        Provider.of<BrandProvider>(context, listen: false);
    brandProvider.getBrandProvider(); // TODO: implement initState
    super.initState();
  }
 void _checkVersion() async {
    final newVersion = NewVersion(
      androidId: "com.excelitai.bppshop",
    );
    final status = await newVersion.getVersionStatus();
    newVersion.showUpdateDialog(
      context: context,
      versionStatus: status!,
      dialogTitle: "UPDATE!!!",
      dismissButtonText: "Skip",
      dialogText: "Please update the app from " + "${status.localVersion}" + " to " + "${status.storeVersion}",
      dismissAction: () {
        SystemNavigator.pop();
      },
      updateButtonText: "Lets update",
    );

    print("DEVICE : " + status.localVersion);
    print("STORE : " + status.storeVersion);
  }
  @override
  Widget build(BuildContext context) {
    BannerProvider bannerProvider = Provider.of<BannerProvider>(context);
    BrandProvider brandProvider = Provider.of<BrandProvider>(context);

    return Scaffold(
        drawer: MainDrawer(),
        appBar: appBar(title: 'Fashion', backgroundcolor: appColor().mainColor),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Stack(
                        children: [
                          Container(
                              height: 130,
                              child: bannerProvider.bannerList.length != 0
                                  ? Image.network(
                                      'https://bppshops.com/' +
                                          '${bannerProvider.bannerList[0].bennarImg}',
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    )
                                  : Container(
                                      child: CircularProgressIndicator(),
                                    )

                              //  Image.asset(
                              //   'assets/banner.png',
                              //   fit: BoxFit.fill,
                              //   width: double.infinity,
                              // )
                              ),
                          Positioned(
                              left: 20,
                              top: 17,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'All Products',
                                    style: TextStyle(
                                        color: appColor().yellow_color,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    'MEGASTORE',
                                    style: TextStyle(
                                        color: appColor().red_color,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    'save Up to 20% off',
                                    style: TextStyle(
                                        color: appColor().black_color,
                                        // fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        width: 88,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: appColor().buttonColor,
                                        ),
                                        padding: EdgeInsets.all(6),
                                        child: Center(
                                            child: Text(
                                          'Shop Now',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ))),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  height: 60,
                                  child: bannerProvider.bannerList.length != 0
                                      ? Image.network(
                                          'https://bppshops.com/' +
                                              '${bannerProvider.bannerList[1].bennarImg}',
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        )
                                      : Container(
                                          child: CircularProgressIndicator(),
                                        ))),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            height: 60,
                            color: Colors.amber,
                            child: bannerProvider.bannerList.length != 0
                                ? Image.network(
                                    'https://bppshops.com/' +
                                        '${bannerProvider.bannerList[3].bennarImg}',
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  )
                                : Container(
                                    child: CircularProgressIndicator(),
                                  ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          'Our Product Categories',
                          style: TextStyle(
                              fontSize: 18, color: appColor().mainColor),
                        )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 120,
                        child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Container(
                                  padding: EdgeInsets.only(right: 10),
                                  // height: 80,
                                  // width: 80,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            categories[index]['image']),
                                        radius: 40,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 21,
                                        width: 50,
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: appColor().buttonColor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Center(
                                            child: Text(
                                                categories[index]['name'])),
                                      )
                                    ],
                                  ));
                            })),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          width: 190,
                          decoration: BoxDecoration(
                              border: Border.all(color: appColor().mainColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Text(
                                      'All Catrgories ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: appColor().mainColor),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Icon(Icons.arrow_forward,
                                    size: 18, color: appColor().mainColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                              height: 130,
                              child: bannerProvider.bannerList.length != 0
                                  ? Image.network(
                                      'https://bppshops.com/' +
                                          '${bannerProvider.bannerList[1].bennarImg}',
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    )
                                  : Container(
                                      child: CircularProgressIndicator(),
                                    )),
                          Positioned(
                              left: 20,
                              top: 17,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Smart Watch ',
                                    style: TextStyle(
                                        color: appColor().yellow_color,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    'SPECIAL OFFER',
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        width: 88,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: appColor().buttonColor,
                                        ),
                                        padding: EdgeInsets.all(6),
                                        child: Center(
                                            child: Text(
                                          'Shop Now',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ))),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          'Our Brands',
                          style: TextStyle(
                              fontSize: 18, color: appColor().mainColor),
                        )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 110,
                        child: ListView.builder(
                            itemCount: brandProvider.brandList.length,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Container(
                                  padding: EdgeInsets.only(right: 10),
                                  // height: 80,
                                  // width: 80,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://bppshops.com/' +
                                                  '${brandProvider.brandList[index].brandImage}',
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                            )

                                            // Image(
                                            //   image:brandProvider.brandList[index].brandImage.toString(),
                                            //       // AssetImage('assets/banner.png'),
                                            //   fit: BoxFit.fill,
                                            //   height: 100,
                                            // ),
                                            ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ));
                            })),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          width: 190,
                          decoration: BoxDecoration(
                              border: Border.all(color: appColor().mainColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Text(
                                      'Brands ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: appColor().mainColor),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Icon(Icons.arrow_forward,
                                    size: 18, color: appColor().mainColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HotDeals(),
                      SizedBox(
                        height: 20,
                      ),
                      LatestProduct(),
                      SizedBox(
                        height: 20,
                      ),
                      MostPopularProduct(),
                      SizedBox(
                        height: 20,
                      ),
                      Sports_food_bikes(),
                      SizedBox(
                        height: 20,
                      ),
                      BestSellingProduct(),
                      SizedBox(
                        height: 20,
                      ),
                      TopCatagories(),
                      SizedBox(
                        height: 20,
                      ),
                      DailyBestSelling(),
                      SizedBox(
                        height: 20,
                      ),
                      NewProducts(),
                      SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      
                          SpecialOffer(),
                      //     Expanded(
                      //       flex: ,
                      //       child: SpecialDeals())
                      //   ],
                      // )
                    ])))));
  }
}
