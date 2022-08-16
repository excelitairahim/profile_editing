import 'package:flutter/material.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
  List productsCatagories = [
    {'image': 'assets/banner.png', 'name': 'Men', 'price': '\$1000'},
    {'image': 'assets/banner.png', 'name': 'Women', 'price': '\$1000'},
    //{'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    //{'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    // {
    //   'image': 'assets/banner.png',
    //   'name': 'Men',
    //   'price': '\$2000',
    //   'discount': '\$2500'
    // },
    {'image': 'assets/banner.png', 'name': 'Accessories', 'price': '\$1000'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      
      ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: ((context, index) {
        return  Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'SPECIAL OFFER',
              style: TextStyle(
                shadows: [Shadow(color: Colors.red, offset: Offset(0, -5))],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
                    Text(
            'SPECIAL OFFER',
            style: TextStyle(
              shadows: [Shadow(color: Colors.red, offset: Offset(0, -5))],
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        
        ],
        );
      }))
      
    );
  }
}
