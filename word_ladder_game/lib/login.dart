import 'package:flutter/material.dart';
import 'package:word_ladder_game/main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(
          child: Column(
        children: [
          const Icon(
            Icons.account_circle,
            size: 100,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Enter your name',
            ),
          ),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Word Ladder'),
                  ),
                  body: const Game(),
                )),
              );
            },
          ),
        ],
      )),
    );
  }
}
