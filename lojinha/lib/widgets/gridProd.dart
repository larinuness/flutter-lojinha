import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/models/movel.dart';
import 'package:lojinha/widgets/elementGridProd.dart';

class GridProd extends StatelessWidget {
  final Function atualiza;
  final moveis;

  GridProd(this.moveis,this.atualiza);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //Faz com que no grid, apareca qtde de itens por linha
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //pode colocar o valor que quiser, nesse caso, é 2 por linha
        crossAxisCount: 2,
      ),
      //colocar moveis.lenght se não vai ser tudo infinito
      itemCount: moveis.length,
      itemBuilder: (BuildContext context, int indice){
        final movel = Movel.fromJson(moveis[indice]);
        return ElementGrid(
          movel,
          atualiza
        );
      },
    );
  }
}