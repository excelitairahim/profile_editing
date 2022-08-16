import 'package:fashion_design/Api_Service.dart/hotDeal.dart';
import 'package:fashion_design/App_Color/app_color.dart';
import 'package:fashion_design/Component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';

class AllBrandsFiltering extends StatefulWidget {
  const AllBrandsFiltering({Key? key}) : super(key: key);

  @override
  State<AllBrandsFiltering> createState() => _AllBrandsFilteringState();
}

class _AllBrandsFilteringState extends State<AllBrandsFiltering> {
  // HotDealsProvider? hotDealsProvider;
  @override
  void initState() {
    final hotDealsProvider =
        Provider.of<HotDealsProvider>(context, listen: false);
    hotDealsProvider.getHotDealsProvider();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hotDealsProvider = Provider.of<HotDealsProvider>(
      context,
    );
    DateTime date1 =
        DateTime.parse(hotDealsProvider.hotDealList[0].endDate.toString());
    DateTime date2 =
        DateTime.parse(hotDealsProvider.hotDealList[0].startDate.toString());
    int daysBetween_wrong2(DateTime date1, DateTime date2) {
      date1 = DateTime(date1.year, date1.month, date1.day);
      date2 = DateTime(date2.year, date2.month, date2.day);
      return DateTime.utc(date1.year, date1.month, date1.day)
          .difference(DateTime.utc(date2.year, date2.month, date2.day))
          .inSeconds;
    }

    int endTime = DateTime.now().millisecondsSinceEpoch +
        1000 * int.parse(daysBetween_wrong2(date1, date2).toString());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('All Brand'),
          centerTitle: true,
          backgroundColor: appColor().mainColor,
          elevation: 00,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Text(daysBetween_wrong2(date1, date2).toString()),
                Text(date1.toString()),
                Text(date2.toString()),
                Center(
                  child: CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_, time) {
                      if (time == null) {
                        return Text('Game over');
                      }
                      return Text(
                          'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
                    },
                  ),
                ),
                ListView.builder(
                    itemCount: hotDealsProvider.hotDealList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Text('Price'),
                          Text(hotDealsProvider.hotDealList[index].sellingPrice
                              .toString()),
                          Text('discountPrice'),
                          Text(hotDealsProvider.hotDealList[index].discountPrice
                              .toString()),
                          Text('product name'),
                          Text(hotDealsProvider.hotDealList[index].productName
                              .toString()),
                          Container(
                              height: 100,
                              child: Image.network('https://bppshops.com/' +
                                  '${hotDealsProvider.hotDealList[index].productThambnail}'))
                        ],
                      );
                    }))
              ],
            ),
          ),
        ));
  }
}
