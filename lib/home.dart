import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valor = "Clieque no Botão para ver o valor";
  void _consultarPeco() async {
    var url = Uri.parse("https://blockchain.info/ticker");
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> resposta = json.decode(response.body);
    setState(() {
      _valor = "R\$ ${resposta['BRL']['buy'].toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("imagens/bitcoin.png"),
              Padding(
                padding: const EdgeInsets.only(top: 42),
                child: Text(
                  _valor,
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  style: style,
                  onPressed: _consultarPeco,
                  child: const Text(
                    "Atualizar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
