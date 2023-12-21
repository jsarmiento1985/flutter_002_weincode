import "package:flutter/material.dart";
import "package:flutter_002/design/colors.dart";
import "package:flutter_002/design/radius.dart";
import "package:flutter_002/widgets/categories_widget.dart";
import "package:flutter_002/widgets/home_app_bar_title.dart";
import "package:flutter_002/widgets/mid_home_page_body.dart";
import "package:flutter_002/widgets/top_home_page_body.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ButtonStyle buttonStyleInactive = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: WeinFluColors.brandSecondaryColor,
      shadowColor: WeinFluColors.brandLigthDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ));

  ButtonStyle buttonStyleActive = ElevatedButton.styleFrom(
      backgroundColor: WeinFluColors.brandMidGreyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ));

  Widget currentDetailWidget = const CategoriesWidget();
  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recientTransactionBtnStyle;

  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recientTransactionBtnStyle = buttonStyleInactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 97.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: WeinFluRadius.radiusSmall,
                  bottomRight: WeinFluRadius.radiusXs)),
          backgroundColor: WeinFluColors.brandLightColor,
          title: const Padding(
            padding: EdgeInsets.fromLTRB(16, 45, 16, 12),
            child: HomeAppBarTitle(),
          )),
      body: Column(
        children: [
          const TopHomePageBody(),
          MidHomePageBody(
            categorieBtnStyle: categorieBtnStyle,
            recientTransactionBtnStyle: recientTransactionBtnStyle,
            categoriesBtnAction: () {
              setState(() {
                currentDetailWidget = const CategoriesWidget();
                categorieBtnStyle = buttonStyleActive;
                recientTransactionBtnStyle = buttonStyleInactive;
              });
            },
            recientBtnAction: () {
              setState(() {
                currentDetailWidget = const RecentTransactions();
                categorieBtnStyle = buttonStyleInactive;
                recientTransactionBtnStyle = buttonStyleActive;
              });
            },
          ),
          //const Expanded(child: CategoriesWidget()),
          Expanded(child: currentDetailWidget),
        ],
      ),
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Este es el reto',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
