import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/main.dart';
import 'package:lojinha/paletaCores.dart';
import 'package:lojinha/widgets/indicadorBtnCarrinho.dart';

class btnCarrinho extends StatefulWidget {
  @override
  _btnCarrinhoState createState() => _btnCarrinhoState();
}
 class _btnCarrinhoState extends State<btnCarrinho> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/carrinho').then((value) => setState((){}));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            )),
        height: 40,
        margin: EdgeInsets.only(
          bottom: 4,
          top: 4,
        ),
        //EdgeInset.only deixar escolher em qual lado quer por o padding
        padding: EdgeInsets.only(
          right: 10,
          left: 20,
        ),
        child: _visibilidadeIndicadorCarrinho()
      ),
    );
  }

  _visibilidadeIndicadorCarrinho(){
    if(Inicio.itensCarrinho.length > 0) {
      return Container(
        margin: EdgeInsets.only(top: 7),
        child:Stack(
          children: [
        Icon(
          Icons.shopping_bag_outlined,
          size: 30,
          color: PaletaCores.corMaisClara,
        ),
        IndicadorBtnCarrinho()
      ]));
    }
    return Container(
        margin: EdgeInsets.only(top: 7),
        child:Stack(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: PaletaCores.corMaisClara,
              ),

            ]));
  }
}
