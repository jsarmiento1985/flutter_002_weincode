import 'package:flutter/material.dart';
import 'package:flutter_002/design/colors.dart';
import 'package:flutter_002/design/radius.dart';
import 'package:flutter_002/widgets/custom_money_display.dart';
import 'package:flutter_002/widgets/summary_card.dart';

class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -12, 0),
      height: 389,
      decoration: const BoxDecoration(
          color: WeinFluColors.brandPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: WeinFluRadius.radiusSmall,
            bottomRight: WeinFluRadius.radiusSmall,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 56),
            child: Text('Your Budget',
                style: Theme.of(context).textTheme.displaySmall),
          ),
          CustomMoneyDisplay(
            amount: 2868000.12,
            padding: const EdgeInsets.only(top: 8.0, right: 4.0),
            amountStyle: Theme.of(context).textTheme.displayLarge!,
            amountStyleSmall: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: WeinFluColors.brandLightColor),
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.incomes,
            amount: 700000,
            period: 'From january 1 to January 31',
            action: () => print('incomes'),
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.spending,
            amount: 900000,
            period: 'From january 1 to January 31',
            action: () => print('spending'),
          )
        ],
      ),
    );
  }
}
