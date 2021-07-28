import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha/main.dart';
import 'package:lojinha/models/itemCarrinho.dart';
import 'package:lojinha/models/movel.dart';

class ListaCarrinho extends StatefulWidget {
  final Function atualiza;

  ListaCarrinho(this.atualiza);

  @override
  _ListaCarrinhoState createState() => _ListaCarrinhoState();
}

class _ListaCarrinhoState extends State<ListaCarrinho> {
  final List<ItemCarrinho> carrinho = Inicio.itensCarrinho;
  final formatacaoReal = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carrinho.length,
      itemBuilder: (BuildContext context, int indice) {
        ItemCarrinho item = carrinho[indice];
        Movel movel = item.movel;
        return Container(
          margin: EdgeInsets.all(13),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(children: [
              //Deixa as imagens do mesmo tamanho
              Expanded(
                child: Image(
                  image: AssetImage('utilidades/assets/imagens/${movel.foto}'),
                  height: 92,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Container(
                      height: 92,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(movel.titulo, style: Theme.of(context).textTheme.headline3,),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(formatacaoReal.format(movel.preco)),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => _diminuirQuantidade(item),
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Text('${item.quantidade}'),
                                      GestureDetector(
                                        onTap: () => _aumentaQuantidade(item),
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ])))
            ]),
          ),
        );
      },
    );
  }

  _aumentaQuantidade(ItemCarrinho item) {
    setState(() {
      item.quantidade++;
      widget.atualiza();
    });
  }

  _diminuirQuantidade(ItemCarrinho item) {
    setState(() {
      if (item.quantidade > 1) {
        item.quantidade--;
        widget.atualiza();
      } else {
        _removerMovel(item);
      }
    });
  }

  _removerMovel(ItemCarrinho item) {
    setState(() {
      Inicio.itensCarrinho.remove(item);
      widget.atualiza;
    });
  }
}
