import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provinha/models/pokeAPI.dart';
import 'package:provinha/utilities/Network_Helper.dart';


class SegundaTela extends StatefulWidget {
  final String text;
  SegundaTela({Key key, @required this.text}) : super(key: key);

  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  NetworkHelper requisicao;
  PokeAPI pokeAPI = new PokeAPI();
  @override
  void initState() {
    iniciaData();
    super.initState();
  }
  iniciaData() {
    String pokemon = widget.text;
    pokemon = pokemon.replaceAll(" ", "%20");
    requisicao = NetworkHelper(
        url: "https://pokeapi.co/api/v2/pokemon/"+pokemon.toLowerCase());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                          ),
                          onPressed: () => Navigator.pop(context)),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              ("Encontrado um pokémon"),
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: requisicao.getData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        pokeAPI = PokeAPI.fromJson(snapshot.data);
                        return Expanded(
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                              ),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                String name = pokeAPI.name;
                                Sprites sprites = pokeAPI.sprites;
                                return Column(
                                  children: [
                                    Text(("O pokémon encontrado é " + name),),
                                    Image.network(sprites.frontDefault),
                                    Image.network("https://media1.tenor.com/images/9eacf2912610418519fcb673e2499f47/tenor.gif?itemid=17969662")
                                  ],
                                );
                              },
                            ));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Pokemon nao encontrado',
                              style: TextStyle(
                                fontSize: 24,
                              ),

                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
        )
    );
  }
}