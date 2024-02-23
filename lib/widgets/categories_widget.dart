import "package:flutter/material.dart";
import "package:flutter_002/design/colors.dart";

import "package:flutter_002/widgets/custom_money_display.dart";

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: const ButtonStyle(alignment: Alignment.centerRight),
          child: const Text(
            "View All",
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(53, 97, 254, 1)),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('all-transactions');
          },
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/pizza.png',
          amount: 391254.01,
          productName: 'Food & Drink',
          currentSells: '2250',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.incomes,
          pathToProductImage: 'assets/images/tv.png',
          amount: 3176254.01,
          productName: 'Electronics',
          currentSells: '2250',
          percentage: '43.6',
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.outcomes,
          pathToProductImage: 'assets/images/health.png',
          amount: 38.01,
          productName: 'Health',
          currentSells: '110',
          percentage: '25.8',
        ),
      ],
    );
  }
}

enum TypeProductDetailCard { incomes, outcomes }

class ProductDetailCard extends StatelessWidget {
  final String pathToProductImage;
  final double amount;
  final String productName;
  final String currentSells;
  final String percentage;
  final TypeProductDetailCard typeProductDetailCard;

  const ProductDetailCard(
      {super.key,
      required this.pathToProductImage,
      required this.amount,
      required this.productName,
      required this.currentSells,
      required this.percentage,
      required this.typeProductDetailCard});

  @override
  Widget build(BuildContext context) {
    var iconIncomes = const Icon(
      Icons.expand_less,
      size: 20,
      color: WeinFluColors.brandOnSuccessColor,
    );
    var iconSpending = const Icon(
      Icons.expand_more,
      size: 20,
      color: WeinFluColors.brandOnErrorColor,
    );
    var currentBgPercentageColor = WeinFluColors.brandSuccessColor;
    var currentTextPercentageColor = WeinFluColors.brandOnSuccessColor;
    var currentIcon = iconIncomes;

    if (typeProductDetailCard == TypeProductDetailCard.outcomes) {
      currentBgPercentageColor = WeinFluColors.brandErrorColor;
      currentTextPercentageColor = WeinFluColors.brandOnErrorColor;
      currentIcon = iconSpending;
    }

    return Container(
      margin: const EdgeInsets.only(
        top: 14,
      ),
      height: 111,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: WeinFluColors.brandLightColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            height: 79,
            width: 56,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(pathToProductImage)),
              color: WeinFluColors.brandSecondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: WeinFluColors.brandDarkColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'RobotoMono',
                        fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      '+ \$ $currentSells Today',
                      style: const TextStyle(
                          color: WeinFluColors.brandLigthDarkColor,
                          fontFamily: 'RobotoMono',
                          fontSize: 10),
                    ),
                  ),
                  CustomMoneyDisplay(
                    padding: const EdgeInsets.only(top: 4, right: 2),
                    amount: amount,
                    amountStyle: const TextStyle(
                        color: WeinFluColors.brandPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    amountStyleSmall: const TextStyle(
                        color: WeinFluColors.brandPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 70,
              right: 16,
            ),
            height: 19,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(19)),
                color: currentBgPercentageColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                currentIcon,
                Text(
                  '$percentage %',
                  style: TextStyle(
                      fontSize: 10, color: currentTextPercentageColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
