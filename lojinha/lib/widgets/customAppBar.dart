import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/paletaCores.dart';
import 'package:lojinha/widgets/buttonCarrinho.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{

  final String titulo;
  final bool ehPagCarrinho;

  CustomAppBar(this.titulo, this.ehPagCarrinho);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      centerTitle: true,
      title: Text(titulo, style: TextStyle(color: Colors.white)),
      backgroundColor: PaletaCores.corPrincipal,
      actions: [
        _mudarPagCarrinho(ehPagCarrinho),
      ],
    );
  }
  //Definindo o tamanho, o kToolbarHeight é um tamanho padrão porém pode passar o valor que quiser
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  _mudarPagCarrinho(bool ehPagCarrinho){
    if(ehPagCarrinho) return Container();
    return btnCarrinho();
  }
}