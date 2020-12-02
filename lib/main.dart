import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provinha/SegundaTela.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: PrimeiraTela(),
  ));
}


class PrimeiraTela extends StatefulWidget {
  @override
  _EstadoPrimeiraTela createState() {
    return _EstadoPrimeiraTela();
  }
}

class _EstadoPrimeiraTela extends State<PrimeiraTela> {

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('App Pokedex'), centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://logos-world.net/wp-content/uploads/2020/05/Pokemon-Logo-History.jpg"),
              Text('Digite o nome do pokemon a ser procurado',
                  style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: textFieldController,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),

              RaisedButton(
                child: Text(
                  'Confirmar seleção',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  _sendDataToSecondScreen(context);
                },
              ),
              Image.network("https://64.media.tumblr.com/46b10f58389e6fd28150a8306b8f34f7/tumblr_mx6re14jMH1rpn9eno1_500.gif")
            ],
          ),
        )
    );
  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SegundaTela(text: textToSend,),
        ));
  }
}
