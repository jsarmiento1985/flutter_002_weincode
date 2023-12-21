import 'package:flutter/material.dart';
import 'package:flutter_002/config/app_routes.dart';
import 'package:flutter_002/models/user.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userData = User(name: "James", age: 38);
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Page"),
        ),
        body: Center(
            child: TextButton(
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(AppRoutes.otherPage, arguments: userData),
          child: const Text("Hola a todos anda bien"),
        )));
  }
}
