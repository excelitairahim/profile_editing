import 'package:flutter/material.dart';

AppBar appBar ({required String title,backgroundcolor,leading}){
return AppBar(
  title: Text(title),
  backgroundColor:backgroundcolor ,
  centerTitle: true,
  leading: leading,
  elevation: 0,
);
}