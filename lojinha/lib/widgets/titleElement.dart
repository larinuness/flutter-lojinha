import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleElement extends StatelessWidget {

  final String? titulo;

  TitleElement({this.titulo});

  @override
  Widget build(BuildContext context) {
   return Positioned(
       bottom: 10,
       child: Text(titulo!, style: TextStyle(color: Colors.white),));
  }

}