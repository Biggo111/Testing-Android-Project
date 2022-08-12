import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                'assets/login_page/signup.svg',
                height: size.height*0.3,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Login', 
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: size.height*0.1,
                  width: size.width*0.8,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name or Email',
                      hintText: 'Enter Username',
                    ),
                  ),
                ),
                Container(
                  height: size.height*0.1,
                  width: size.width*0.8,
                  child: TextField(
                    
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Password',
                    ),
                  ),
                ),
                Container(
                  width: size.height*0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '~Forgot password!',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                      color: Color.fromARGB(255, 166, 163, 163),
                    onPressed: () {}, 
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                      color: Color.fromARGB(255, 247, 246, 248),
                    onPressed: () {}, 
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
