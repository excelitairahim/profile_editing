import 'package:fashion_design/App_Color/app_color.dart';
import 'package:flutter/material.dart';

class HotDeals extends StatefulWidget {
  const HotDeals({Key? key}) : super(key: key);

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals> {
  List categories = [
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
    {'image': 'assets/pic3.png', 'name': 'Kids'},
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
  ];
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.grey,
              width: 3.0,
            ),
            right: BorderSide(
              color: Colors.grey,
              width: 3.0,
            ),
            bottom: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 5),
                width: double.infinity,
                height: 30,
                color: appColor().mainColor,
                child: Text(
                  'Hot Deals',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 100,
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
                                backgroundImage:
                                    AssetImage(categories[index]['image']),
                                radius: 40,
                              ),
                            ],
                          ));
                    })),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text('\$2000'),
                    SizedBox(width: 15),
                    Text(
                      '\$ 2500',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: appColor().red_color),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'winter Fashion',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                height: 90,
                width: 250,
                child: Image(
                  image: AssetImage('assets/banner.png'),
                  fit: BoxFit.fill,
                  //
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Hurry Up !',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Offer ends in :',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: appColor().yellow_color,
                                borderRadius: BorderRadius.circular(5)),
                            height: 25,
                            width: 27,
                            child: Center(
                                child: Text(
                              '00',
                            )),
                          ),
                          Text(
                            'Days',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: appColor().yellow_color,
                                borderRadius: BorderRadius.circular(5)),
                            height: 25,
                            width: 27,
                            child: Center(
                                child: Text(
                              '00',
                            )),
                          ),
                          Text(
                            'Hours',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: appColor().yellow_color,
                                borderRadius: BorderRadius.circular(5)),
                            height: 25,
                            width: 27,
                            child: Center(
                                child: Text(
                              '00',
                            )),
                          ),
                          Text(
                            'Min',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: appColor().yellow_color,
                                borderRadius: BorderRadius.circular(5)),
                            height: 25,
                            width: 27,
                            child: Center(
                                child: Text(
                              '00',
                            )),
                          ),
                          Text(
                            'Sec',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 88,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appColor().buttonColor,
                      ),
                      padding: EdgeInsets.all(6),
                      child: const Center(
                          child: Text(
                        'Shop Now',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: appColor().soft_grey_color,
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    )),
                padding: EdgeInsets.all(5),
                height: 40,
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 12,
                      color: Colors.grey,
                    ),
                    Text(
                      'Previous Deal',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '|',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Next Deal',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        )),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      clipper: ContainerClipSize(),
    );
  }
}

class ContainerClipSize extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width - 170, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
