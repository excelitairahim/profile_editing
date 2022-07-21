

import 'package:flutter/material.dart';

import '../component.dart/cart.dart';

class CartPage extends StatefulWidget{
  @override
  State createState() {
    // TODO: implement createState
   return CartPageState();
  }

}

class CartPageState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Cart Items"),backgroundColor: Colors.green,),
      body:( Cart().getList().length>0) ?GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: Cart().getList().length,
          itemBuilder: (context,index){
            return Container(
              width: 200,

              child: Card(
                child: Stack(

                  children: [
                    //Image.network("https://www.tutorix.com/images/class_7_blood_and_blood_vessels.jpg"),
                    Image.network("https://www.tutorialspoint.com/videotutorials/assets/videos/courses/173/images/course_173_image.png"),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Text("Product Name",style: TextStyle(color: Colors.green,fontWeight:  FontWeight.bold,fontSize: 20),),
                          FlatButton(onPressed: (){
                            setState(() {
                              print(Cart().getList().length);
                              Cart().getList().removeAt(index);
                            });

                          }, child: Text("Remove",style: TextStyle(color: Colors.white),),color: Colors.green,)
                        ],
                      ),
                    )


                  ],
                ),
              ),
            );
          }):Center(child: Text("No Items found in Cart", style: TextStyle(color: Colors.red,fontSize: 20),),),
    );
  }

}