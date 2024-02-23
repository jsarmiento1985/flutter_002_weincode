import 'package:flutter/material.dart';
import 'package:flutter_002/design/colors.dart';
import 'package:flutter_002/design/copys.dart';
import 'package:flutter_002/design/radius.dart';
import 'package:flutter_002/mocks/transactions_mock.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97.0,
        leadingWidth: 77.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: WeinFluRadius.radiusSmall,
                bottomRight: WeinFluRadius.radiusXs)),
        backgroundColor: WeinFluColors.brandLightColor,
        leading: Container(
          height: 40.0,
          width: 40.0,
          margin: const EdgeInsets.fromLTRB(16.0, 45.0, .0, 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: WeinFluColors.brandSuccessColor),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back,
                  color: WeinFluColors.brandPrimaryColor)),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 45.0, 16.0, 12.0),
          child: Text(
            Copys.recenTrx,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            height: 56.0,
            margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 32.0),
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, indice) {
                var currentCategorie = TransactionsMocks.categories[indice];
                //print(indice);
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: MaterialButton(
                    padding: const EdgeInsets.all(10),
                    height: 35.0,
                    minWidth: 35.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: indice == 0
                        ? WeinFluColors.brandPrimaryColor
                        : WeinFluColors.brandLightColor,
                    onPressed: () {},
                    child: Text(
                      currentCategorie,
                      style: TextStyle(
                        color: indice != 0
                            ? WeinFluColors.brandPrimaryColor
                            : WeinFluColors.brandLightColor,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                );
              },
              itemCount: TransactionsMocks.categories.length,
            ),
          ),
          Expanded(child: 
          ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: TransactionsMocks.)
          ),
        ],
      ),
    );
  }
}
