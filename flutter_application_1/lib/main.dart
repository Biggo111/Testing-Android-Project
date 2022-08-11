import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential credential;
      if (kIsWeb) {
        var provider = GoogleAuthProvider();
        credential = await auth.signInWithPopup(provider);
      } else {
        final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        credential = await auth.signInWithCredential(authCredential);
      }
      final user = credential.user;
      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: ElevatedButton(
            onPressed: (() {
              // get user from signInWithGoogle
              signInWithGoogle().then((user) {
                if (user != null) {
                  // signInWithGoogle success
                  String? name = user.displayName;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(username: name),
                ),
              );
                } else {
                  // signInWithGoogle failed
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Card(
                    child: Text('Sign in failed'),
                  )));
                }
              });
              
            }),
            child: const Text('Sign in with Google')),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key, required this.username}) : super(key: key);
  final String? username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Text('Welcome to Flutter, $username!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyApp.signOut(context: context);
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
