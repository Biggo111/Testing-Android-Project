import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Word Ladder'),
      ),
      body: const Center(
        child: Game(),
      ),
    ),
  ));
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  String? lastChar;
  var controller = TextEditingController(
    text: '',
  );
  final _controller2 = TextEditingController(
    text: '',
  );
  final _focusNode = FocusNode();
  var decoration = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    hintText: 'Enter a word',
  );
  void _submit() {
    setState(() {
      _controller2.text = '${_controller2.text}${controller.text} ';
      String firstChar = controller.text.substring(0, 1).toUpperCase();
      if (lastChar != null && lastChar != firstChar) {
        lastChar = null;
        _controller2.clear();
        decoration = InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'Enter a word',
          errorText: 'Words must start with the same letter',
        );
        return;
      } 
      lastChar = controller.text.characters.last.toUpperCase();
      decoration = InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'Enter a word starts with $lastChar',
      );
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(8)),
          TextField(
            controller: _controller2,
            enabled: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              labelText: 'Your guessed words',
              fillColor: Colors.limeAccent,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: controller,
            onSubmitted: (value) => _submit(),
            autofocus: true,
            focusNode: _focusNode,
            // focus back to the text field after submission
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_focusNode),
            decoration: decoration,
          ),
          ElevatedButton(onPressed: _submit, child: const Text('Go')),
        ],
      ),
    );
  }
}
