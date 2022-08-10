import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var myController = TextEditingController();
  TextField _nameField() {
    return TextField(
      controller: myController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter your name',
        labelText: 'Name',
      ),
    );
  }
  void _login() {
    String? name = myController.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(name: name)),
    );
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            Image.asset('assets/bg.jpg'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _nameField(),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
