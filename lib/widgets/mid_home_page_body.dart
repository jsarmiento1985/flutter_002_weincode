import "package:flutter/material.dart";

class MidHomePageBody extends StatelessWidget {
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recientTransactionBtnStyle;
  final void Function()? categoriesBtnAction;
  final void Function()? recientBtnAction;

  const MidHomePageBody({
    super.key,
    required this.categorieBtnStyle,
    required this.recientTransactionBtnStyle,
    required this.categoriesBtnAction,
    required this.recientBtnAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color.fromARGB(51, 181, 171, 171),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          )),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 5.0),
              child: ElevatedButton(
                style: categorieBtnStyle,
                onPressed: categoriesBtnAction,
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text('Categories',
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 13, 13),
                          fontSize: 14.0)),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: recientTransactionBtnStyle,
            onPressed: recientBtnAction,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text('Recent Transaction',
                  style: TextStyle(
                      color: Color.fromARGB(255, 13, 13, 13), fontSize: 14.0)),
            ),
          ),
        ],
      ),
    );
  }
}
