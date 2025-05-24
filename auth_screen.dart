
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../desafio/desafio_screen.dart';
import '../feed/feed_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  Future<UserCredential?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.flash_on),
              label: const Text("Ver Desafio do Dia"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DesafioScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.people),
              label: const Text("Ver Feed da Comunidade"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FeedScreen()),
                );
              },
            ),
          ],
        )
          icon: const Icon(Icons.login),
          label: const Text("Entrar com Google"),
          onPressed: () async {
            final user = await _signInWithGoogle();
            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, ${user?.displayName ?? "Usuário"}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const AuthScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.flash_on),
              label: const Text("Ver Desafio do Dia"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DesafioScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.people),
              label: const Text("Ver Feed da Comunidade"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FeedScreen()),
                );
              },
            ),
          ],
        )
          icon: const Icon(Icons.flash_on),
          label: const Text("Ver Desafio do Dia"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const DesafioScreen()),
            );
          },
        ),
      ),
    );
  }
}
