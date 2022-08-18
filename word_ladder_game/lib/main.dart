import 'package:flutter/material.dart';

// declare a list of unique strings
List<String> kStrings = <String>[];
int attempts = 3;
int score = 0;
void main() {
  // kStrings.clear();
  // attempts = 3;
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
  // ignore: library_private_types_in_public_api
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
      String word = controller.text;
      if (word.isEmpty) {
        return;
      }
      if (kStrings.contains(word)) {
        attempts--;
        if (attempts == 0) {
          // show dialog box "Game Over"
          controller.clear();
          _controller2.clear();
          kStrings.clear();
          decoration = InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Enter a word',
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Game Over'),
                content: const Text('You have run out of attempts'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
          return;
        }
        decoration = InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'Enter a word starts with $lastChar',
          errorText: 'Word already used!',
        );
        return;
      }
      kStrings.add(word);
      score++;
      _controller2.text = '${_controller2.text}$word ';
      String firstChar = word.substring(0, 1).toUpperCase();
      if (lastChar != null && lastChar != firstChar) {
        lastChar = null;
        _controller2.clear();
        kStrings.clear();
        decoration = InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'Enter a word',
          errorText: 'Words must start with the same letter',
        );
        return;
      }
      lastChar = word.characters.last.toUpperCase();
      decoration = InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'Enter a word starts with $lastChar',
      );
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(8)),
          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                height: size.height * 0.01,
              ),
              controller: _controller2,
              enabled: false,
              scrollController: ScrollController(
                initialScrollOffset: 0,
              ),
              decoration: InputDecoration(
                labelText: 'Your guessed words',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(padding: EdgeInsets.all(8)),
              Text(
                'Attempts: $attempts',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: size.width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text(
                'Score: $score',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: size.width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.all(8)),
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: (value) => _submit(),
                  autofocus: true,
                  focusNode: _focusNode,
                  // focus back to the text field after submission
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_focusNode),
                  decoration: decoration,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Container(
                  alignment: Alignment.center,
                  transformAlignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('Go'),
                  )),
              const Padding(padding: EdgeInsets.all(8)),
            ],
          ),
        ],
      ),
    );
  }
}
