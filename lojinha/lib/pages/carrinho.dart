import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha/main.dart';
import 'package:lojinha/paletaCores.dart';
import 'package:lojinha/widgets/customAppBar.dart';
import 'package:lojinha/widgets/listaCarrinho.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
  
}

class _CarrinhoState extends State<Carrinho> {
  final formatacaoReal = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  @override
  Widget build(BuildContext context) {
    int valorTotal = _calcularTotal();
    return Scaffold(
      bottomNavigationBar: Container(
        color: PaletaCores.corPrincipal,
        height: 80,
        padding: EdgeInsets.all(20),
        child:
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
        Text('Total',style: TextStyle(color: Colors.white, fontSize: 20),),
        Text(formatacaoReal.format(valorTotal), style: TextStyle(color: Colors.white, fontSize: 20),),
      ]),),
      appBar: CustomAppBar('Carrinho', true),
      body: _constroiTela(),
    );
  }

  atualiza() {
    setState(() {});
  }
  
  _calcularTotal(){
    if(Inicio.itensCarrinho.isNotEmpty) {
      return Inicio.itensCarrinho
          .map((item) => item.movel.preco * item.quantidade)
          .reduce((precoAtual, precoNovo) => precoAtual + precoNovo);
    } else {
    return 0;}
  }

  Widget _constroiTela(){
    if(Inicio.itensCarrinho.isNotEmpty){
      return ListaCarrinho(
        atualiza,
      );
    } else {
      return Container(
        //deixa centralizado no meio da tela
        height: double.infinity,
          alignment: Alignment.center,
          child: Text('Nenhum item no carrinho =('),);
    }
  }
}
