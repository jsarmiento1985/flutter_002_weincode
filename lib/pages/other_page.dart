import 'package:flutter/material.dart';
import 'package:flutter_002/models/user.dart';

class OtherPage extends StatelessWidget {
  final User userData;

  const OtherPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Other Page"),
        ),
        body: Center(
            child: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
              "Hola, ${userData.name}  usteden en promedio tienen ${userData.age}"),
        )));
  }
}
