import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha/main.dart';
import 'package:lojinha/models/itemCarrinho.dart';
import 'package:lojinha/models/movel.dart';
import 'package:lojinha/paletaCores.dart';
import 'package:lojinha/widgets/textDetails.dart';

class CardDetails extends StatelessWidget {
  final formatacaoReal = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final Movel movel;
  final Function? atualizaPagina;

  CardDetails(this.movel,{this.atualizaPagina});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        //faz o texto comecar no inicio(poderia ser center,final)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextDetails(movel.titulo, estilo: Theme.of(context).textTheme.headline1),
          TextDetails(movel.descricao),
          Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      formatacaoReal.format(movel.preco),style: Theme.of(context).textTheme.headline2,
                      ),
                    SizedBox(
                        width: 120,
                        height: 50,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    PaletaCores.corMaisClara),shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                            onPressed: () {
                              -_verificarListaItemCarrinho(Inicio.itensCarrinho, ItemCarrinho(movel, 1));
                            },
                            child: Text(
                              'Comprar',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ])),
        ],
      ),
    );
  }

  _addItemCarinho(item){
    Inicio.itensCarrinho.add(item);
    atualizaPagina!();
  }

 _verificarListaItemCarrinho(List<ItemCarrinho> lista, ItemCarrinho item){
    int indiceMovel = lista.indexWhere((item) => item.movel == movel);
    if(indiceMovel >=0) {
      lista[indiceMovel].quantidade = lista[indiceMovel].quantidade +  1;
    } else {
      _addItemCarinho(item);
    }

 }
}
