import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Saiham Islam'),
            accountEmail: Text('coderabi11@gmail.com'),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a-/AOh14GhwWW-6U2jtCXmyoFBWLKbj9-c3iO6TVTXVslUirQ=s288-p-rw-no')),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Saiham Islam'),
            subtitle: Text('Developer'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('coderabi11@gmail.com'),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
