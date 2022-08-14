import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  void _onPressed() {
    print('Signup button pressed');
  }

  void _backToLogin() {
    print('Back to login button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // inser
              // Heading text
              const Text('REGISTER',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              // User text field
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Username',
                    hintText: 'Enter your username'),
              ),
              // const SizedBox(height: 28),
              // Email text field
              Padding(
                padding: const EdgeInsets.fromLTRB(52, 28, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
              ),
              // Password text field
              // const SizedBox(height: 28),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 28),
              // Confirm password text field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                ),
              ),
              const SizedBox(height: 53),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                      onPressed: _onPressed, child: const Text('Register')),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))
                              ),
                      onPressed: _backToLogin,
                      child: const Text('Back')),
                ),
              ]),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
