
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final respostas = [
      {
        "usuario": "Ana",
        "imagemUrl": "https://placekitten.com/200/200",
        "comentario": "Amei participar do desafio de hoje!"
      },
      {
        "usuario": "Carlos",
        "imagemUrl": "https://placekitten.com/201/200",
        "comentario": "Foi hilário fazer essa dublagem!"
      },
      {
        "usuario": "Lúcia",
        "imagemUrl": "https://placekitten.com/200/201",
        "comentario": "Desafio super criativo, já quero o próximo!"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed da Comunidade"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: respostas.length,
        itemBuilder: (context, index) {
          final r = respostas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(r["imagemUrl"]!),
              title: Text(r["usuario"]!),
              subtitle: Text(r["comentario"]!),
            ),
          );
        },
      ),
    );
  }
}
