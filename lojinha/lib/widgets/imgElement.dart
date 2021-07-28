import 'package:flutter/cupertino.dart';

class ImgElement extends StatelessWidget {

  final String? imagem;

  ImgElement({this.imagem});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
       child: Image(
            fit: BoxFit.cover,
            image: AssetImage('utilidades/assets/imagens/$imagem')),
    );

  }
}