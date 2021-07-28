import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/models/movel.dart';
import 'package:lojinha/widgets/cardDetails.dart';
import 'package:lojinha/widgets/customAppBar.dart';

class Detalhes extends StatefulWidget {
  final Movel movel;

  Detalhes(this.movel);

  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes>{

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('utilidades/assets/imagens/${widget.movel.foto}'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar('Detalhes', false),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
            margin: EdgeInsets.all(16),
            height: 200,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
              child: CardDetails(
                widget.movel,
                atualizaPagina: atualiza,
              ),
            ),
          ),
          )));
  }
  atualiza() {
    setState(() {});
  }
}
