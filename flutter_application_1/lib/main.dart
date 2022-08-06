import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Wakanda Forever'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final TextField nameField = TextField(
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Name',
      hintText: 'Enter your name',
    ),
    controller: TextEditingController(),
    autofocus: true,
  );
  final TextField passField = TextField(
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Password',
      hintText: 'Enter your password',
    ),
    controller: TextEditingController(),
  );

  void _onLogin(BuildContext context) {
    // ignore: avoid_print
    print('Login');
    // get the text from the text field
    final String name = nameField.controller!.text;
    final String pass = passField.controller!.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(username: name, password: pass),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            nameField,
            const Padding(padding: EdgeInsets.all(8.0)),
            passField,
            const Padding(padding: EdgeInsets.all(8.0)),
            ElevatedButton(
              // ignore: avoid_print
              onPressed: () => _onLogin(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.username, required this.password})
      : super(key: key);
  final String username;
  final String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome $username'),
            const Padding(padding: EdgeInsets.all(8.0)),
            Text('Your password is $password'),
          ],
        ),
      ),
    );
  }
}
