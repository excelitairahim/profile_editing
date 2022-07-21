import 'package:add_to_cart/component.dart/cart.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> productName = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
  List<String> productUnit = [
    'KG',
    'DORZEN',
    'KG',
    'LITER',
    'GRAM',
    'PUYA',
    'MON'
  ];
  List<int> productPRICE = [11, 22, 33, 33, 44, 55, 55];
  List<String> productmageUrl = [
    'https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg',
    'https://tinypng.com/images/social/website.jpg',
    'https://static.addtoany.com/images/dracaena-cinnabari.jpg',
    'https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg',
    'https://tinypng.com/images/social/website.jpg',
    'https://static.addtoany.com/images/dracaena-cinnabari.jpg',
    'https://static.addtoany.com/images/dracaena-cinnabari.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Product List'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Badge(
                badgeContent: Text(
                  Cart().getList().length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: ListView.builder(
                itemCount: productName.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var nameindex = productName[index];
                  var unitindex = productUnit[index];
                  var priceindex = productPRICE[index];
                  var imageurl = productmageUrl[index];

                  return Card(
                    child: ListTile(
                        leading: Container(
                          height: 80,
                          width: 100,
                          child: Image.network(
                            imageurl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        trailing: MaterialButton(
                          onPressed: () {
                            Carts().addCart(index);
                            print( Cart().getList().length.toString());
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Add To DB',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Carts {
  static List list = List.empty(growable: true);

  addCart(int pos) {
    list.add(pos);
  }

  List getList() {
    return list;
  }
}

// import 'package:add_to_cart/Screen/cart_page.dart';
// import 'package:add_to_cart/component.dart/cart.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.green,
//           title: Text("Shoping Cart"),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Stack(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.add_shopping_cart),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => CartPage()));
//                         },
//                       ),
//                       (Cart().getList().length > 0)
//                           ? Positioned(
//                               top: 5,
//                               right: 5,
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(10))),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(3.0),
//                                     child: Text(
//                                         Cart().getList().length.toString()),
//                                   )),
//                             )
//                           : Text("")
//                     ],
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Center(
//                         child: Text(
//                       "SignIn",
//                       style: TextStyle(fontSize: 20),
//                     )),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//         body: ListView(
//           scrollDirection: Axis.vertical,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Top courses",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red),
//               ),
//             ),
//             Container(
//               height: 200,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       width: 200,
//                       child: Card(
//                         child: Stack(
//                           children: [
//                             //Image.network("https://www.tutorix.com/images/class_7_blood_and_blood_vessels.jpg"),
//                             Image.network(
//                                 "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/173/images/course_173_image.png"),
//                             Positioned(
//                               bottom: 0,
//                               left: 0,
//                               right: 0,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   //Text("Product Name",style: TextStyle(color: Colors.green,fontWeight:  FontWeight.bold,fontSize: 20),),
//                                   FlatButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         print(Cart().getList().length);
//                                         Cart().addCart(index);
//                                       });
//                                     },
//                                     child: Text(
//                                       "Add To Cart",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     color: Colors.green,
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Video courses",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(5)),
//                   border: Border.all(color: Colors.black26, width: 2)),
//               height: 220,
//               child: Image.network(
//                 "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/525/images/course_525_image.jpg",
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Popular courses",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red),
//               ),
//             ),
//             Container(
//               height: 200,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       width: 200,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Card(
//                           child: Stack(
//                             children: [
//                               //Image.network("https://www.tutorix.com/images/class_7_blood_and_blood_vessels.jpg"),
//                               Image.network(
//                                 "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/174/images/course_174_image.png",
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 left: 0,
//                                 right: 0,
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     // Text("Product Name",style: TextStyle(color: Colors.green,fontWeight:  FontWeight.bold,fontSize: 20),),
//                                     FlatButton(
//                                       onPressed: () {
//                                      setState(() {
//                                         print(Cart().getList().length);
//                                         Cart().addCart(index);
//                                       });
//                                       },
//                                       child: Text(
//                                         "Add To Cart",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       color: Colors.green,
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Popular courses",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red),
//               ),
//             ),
//             Container(
//               height: 200,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       width: 200,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Card(
//                           child: Stack(
//                             children: [
//                               //Image.network("https://www.tutorix.com/images/class_7_blood_and_blood_vessels.jpg"),
//                               Image.network(
//                                 "https://www.tutorialspoint.com/videotutorials/assets/videos/courses/174/images/course_174_image.png",
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 left: 0,
//                                 right: 0,
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     // Text("Product Name",style: TextStyle(color: Colors.green,fontWeight:  FontWeight.bold,fontSize: 20),),
//                                     FlatButton(
//                                       onPressed: () {},
//                                       child: Text(
//                                         "Add To Cart",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       color: Colors.green,
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ) // This trailing comma makes auto-formatting nicer for build methods.

//         );
//   }
// }
