import "package:flutter/material.dart";
import "package:flutter_002/config/app_routes.dart";
import "package:flutter_002/design/themes.dart";
import "package:flutter_002/models/user.dart";
import "package:flutter_002/pages/home_page.dart";
import "package:flutter_002/pages/new_pages.dart";
import "package:flutter_002/pages/other_page.dart";

class WeinFluApp extends StatelessWidget {
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: WeinFluThemes.defaultTheme,
      /* home: const HomePage(
        key: Key('home page'),
      ),*/
      /* routes: {
        AppRoutes.newPage: (context) => const NewPage(),
        AppRoutes.otherPage: (context) => const OtherPage(),
        AppRoutes.home: (context) => const HomePage(),
      },*/

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.newPage:
            return MaterialPageRoute(builder: (context) => const NewPage());
          case AppRoutes.otherPage:
            return MaterialPageRoute(builder: (context) =>  OtherPage(userData: settings.arguments as User));
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
