import "package:flutter/material.dart";

import "package:flutter_002/design/colors.dart";

class HomeAppBarTitle extends StatelessWidget {
  final String storeName;

  const HomeAppBarTitle({
    Key? key,
    required this.storeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/user.png')),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        Expanded(
          child: Text(
            storeName,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ContainerHeaderIcon(
            configMargin: const EdgeInsets.only(right: 12),
            iconButton: IconButton(
                onPressed: () => print('presionaron icono notificaciones'),
                icon: const Icon(
                  Icons.notifications,
                  color: WeinFluColors.brandPrimaryColor,
                ))),
        ContainerHeaderIcon(
            iconButton: IconButton(
                onPressed: () => print('presionaron icono more vertical'),
                icon: const Icon(
                  Icons.more_vert,
                  color: WeinFluColors.brandPrimaryColor,
                )))
      ],
    );
  }
}

class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;
  const ContainerHeaderIcon(
      {super.key, required this.iconButton, this.configMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      margin: configMargin,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(210, 94, 1, 255)),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: iconButton,
    );
  }
}
