import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_ladder_game/login.dart';

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
      body: const Login(),
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
  void _gameOver() {
    controller.clear();
    _controller2.clear();
    kStrings.clear();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('You score is $score'),
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
    attempts = 3;
    score = 0;
    lastChar = null;
  }

  void _submit() {
    setState(() {
      // set focus to the second text field
      context.findRenderObject() as RenderObject;
      _focusNode.requestFocus();
      String word = controller.text.trim().split(RegExp(r'[^\w]+')).first;
      if (word.isEmpty) {
        return;
      }
      if (kStrings.contains(word)) {
        attempts--;
        if (attempts == 0) {
          _gameOver();
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
        attempts--;
        if (attempts == 0) {
          _gameOver();
          return;
        }
        _controller2.clear();
        kStrings.clear();
        score = 0;
        decoration = InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'Enter a word starts with $firstChar',
          errorText: 'Wrong word!',
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 0.3,
                maxHeight: MediaQuery.of(context).size.height * 0.3,
              ),
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.vertical,
                child: TextField(
                  controller: _controller2,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 5,
                  scrollPhysics: const BouncingScrollPhysics(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Your words',
                  ),
                  readOnly: true,
                  enableInteractiveSelection: false,
                  onTap: (() => {
                        // copy text to clipboard
                        Clipboard.setData(
                            ClipboardData(text: _controller2.text)),
                        // show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Copied to clipboard'),
                            duration: Duration(seconds: 1),
                          ),
                        ),
                      }),
                  // expands: true,
                  scrollController: ScrollController(
                    initialScrollOffset: 0.0,
                    keepScrollOffset: true,
                  ),
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 1,
                ),
                Text(
                  'Score: $score',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 150),
                Text(
                  'Attempts: $attempts',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 1),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            TextField(
              controller: controller,
              focusNode: _focusNode,
              decoration: decoration,
              onSubmitted: ((value) => _submit()),
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  // check if value contains only letters
                  if (value.isNotEmpty &&
                      value.characters.last.contains(RegExp(r'[^a-zA-Z]+'))) {
                    // if it does, skip this action
                    controller.text = value.substring(0, value.length - 1);
                    //  set cursor to the end of the text
                    controller.selection = TextSelection.fromPosition(
                      TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: controller.text.length,
                      ),
                    );
                  }
                });
              },
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
