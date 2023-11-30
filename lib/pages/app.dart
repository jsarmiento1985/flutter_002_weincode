import "package:flutter/material.dart";
import "package:flutter_002/design/themes.dart";
import "package:flutter_002/pages/home_page.dart";

class WeinFluApp extends StatelessWidget {
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: WeinFluThemes.defaultTheme,
        home: const HomePage(
          key: Key('home page'),
        ));
  }
}
