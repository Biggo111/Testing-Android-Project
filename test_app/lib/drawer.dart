import 'package:flutter/material.dart';
import 'package:test_app/pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Saiham Islam'),
            accountEmail: Text('coderabi11@gmail.com'),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a-/AOh14GhwWW-6U2jtCXmyoFBWLKbj9-c3iO6TVTXVslUirQ=s288-p-rw-no')),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Saiham Islam'),
            subtitle: Text('Developer'),
            trailing: Icon(Icons.edit),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('coderabi11@gmail.com'),
            trailing: Icon(Icons.edit),
          ),
          // logout button
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            // logout on
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
            },
          ),
        ],
      ),
    );
  }
}
