
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RespostaScreen extends StatefulWidget {
  const RespostaScreen({super.key});

  @override
  State<RespostaScreen> createState() => _RespostaScreenState();
}

class _RespostaScreenState extends State<RespostaScreen> {
  File? _imagemSelecionada;

  Future<void> _escolherImagem() async {
    final picker = ImagePicker();
    final XFile? imagem = await picker.pickImage(source: ImageSource.gallery);

    if (imagem != null) {
      setState(() {
        _imagemSelecionada = File(imagem.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enviar Resposta"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _imagemSelecionada != null
                ? Image.file(_imagemSelecionada!)
                : const Placeholder(fallbackHeight: 200),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.image),
              label: const Text("Escolher Imagem"),
              onPressed: _escolherImagem,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("Enviar Resposta"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Upload em desenvolvimento")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
