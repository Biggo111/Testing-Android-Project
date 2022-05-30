import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.myText,
    required TextEditingController controller,
  }) : _controller = controller, super(key: key);

  final String myText;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/bg.jpg'),
          const SizedBox(
            height: 20,
          ),
          Text(
            myText,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),
          )
        ],
      ),
    );
  }
}
