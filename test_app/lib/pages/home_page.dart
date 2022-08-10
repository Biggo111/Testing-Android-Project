import 'package:flutter/material.dart';

import '../card.dart';
import '../drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.name}) : super(key: key);

  final String title = "Awesome App";
  final String name;

  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() =>  _MyHomePageState(myText: "Welcome, $name");
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({required this.myText});
  String myText;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: MyCard(myText: myText, controller: _controller),
        ),
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myText = "Welcome, ${_controller.text}";
            _controller.clear();
          });
        },
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// git remote add origin 