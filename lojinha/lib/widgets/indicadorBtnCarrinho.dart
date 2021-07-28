import 'package:flutter/cupertino.dart';
import 'package:lojinha/paletaCores.dart';

class IndicadorBtnCarrinho extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: PaletaCores.corMaisClara,
        //Deixa o container/box na forma de um circulo
        shape: BoxShape.circle
      ),

    );
  }
}