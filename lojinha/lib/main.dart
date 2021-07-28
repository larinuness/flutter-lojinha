import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/models/itemCarrinho.dart';
import 'package:lojinha/pages/carrinho.dart';
import 'package:lojinha/pages/details.dart';
import 'package:lojinha/paletaCores.dart';
import 'package:lojinha/widgets/customAppBar.dart';
import 'package:lojinha/widgets/gridProd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/carrinho': (context) => Carrinho()},
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'Alata',
            fontWeight: FontWeight.bold,
            color: PaletaCores.corMaisClara),
        headline2: TextStyle(
            fontSize: 20,
            fontFamily: 'Alata',
            fontWeight: FontWeight.bold,
            color: Colors.black),
        headline3: TextStyle(
            fontSize: 17,
            fontFamily: 'Alata',
            fontWeight: FontWeight.bold,
            color: PaletaCores.corPrincipal),
      )),
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  static List<ItemCarrinho> itensCarrinho = [];
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List moveis = [
    {
      "titulo": "Mesa",
      "preco": 300,
      "foto": "movel1.jpeg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Cadeira",
      "preco": 120,
      "foto": "movel2.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Manta",
      "preco": 200,
      "foto": "movel3.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Cinza",
      "preco": 800,
      "foto": "movel4.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Mesa de cabeceira",
      "preco": 400,
      "foto": "movel5.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Jogo de Cama",
      "preco": 250,
      "foto": "movel6.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Branco",
      "preco": 900,
      "foto": "movel7.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f3f9),
      appBar: CustomAppBar('Lojinha da Lari', false),
      body: Column(children: [
        Row(
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 30, right: 20, top: 10, bottom: 10),
              child: Divider(),
            )),
            Text(
              'Produtos',
              style: TextStyle(fontSize: 20, color: Colors.black45),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
              child: Divider(),
            )),
          ],
        ),
        Flexible(
            child: GridProd(
              moveis,
              atualiza,

        ))
      ]),
    );
  }

  atualiza() {
    setState(() {});
  }
}
