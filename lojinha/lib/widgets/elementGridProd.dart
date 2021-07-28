import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/models/movel.dart';
import 'package:lojinha/pages/details.dart';
import 'package:lojinha/widgets/degradeElement.dart';
import 'package:lojinha/widgets/imgElement.dart';
import 'package:lojinha/widgets/titleElement.dart';

class ElementGrid extends StatefulWidget {
  final Movel movel;
  final Function atualiza;

  ElementGrid(this.movel, this.atualiza);

  @override
  _ElementGridState createState() => _ElementGridState();
}
class _ElementGridState extends State<ElementGrid>{

  @override
  Widget build(BuildContext context) {
    //Parecido com o Gesture Dectected
    //A diferença é  que o Inkwell tem efeito visual do Material
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(widget.movel))
        ).then((value) => widget.atualiza());
      },
      child: Container(
        //Deixar uma sombra em volta dos moveis
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)
        ]),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImgElement(
                imagem: widget.movel.foto,
              ),
              DegradeElement(),
              TitleElement(titulo: widget.movel.titulo)
            ],
          ),
        ),
      ),
    );
  }
}
