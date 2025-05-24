
import 'package:flutter/material.dart';
import 'resposta_screen.dart';

class DesafioScreen extends StatelessWidget {
  const DesafioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desafio = "Faça uma dublagem engraçada usando um filtro de voz!";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Desafio do Dia"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              desafio,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.videocam),
              label: const Text("Participar Agora"),
              onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RespostaScreen()));
                // ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Funcionalidade em desenvolvimento")),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
