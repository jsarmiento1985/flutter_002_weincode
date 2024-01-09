import 'package:flutter/material.dart';
import 'package:flutter_002/config/app_routes.dart';
import 'package:flutter_002/design/colors.dart';
import 'package:flutter_002/design/copys.dart';
import 'package:flutter_002/design/radius.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  var checkBoxState = false;

  var userInputController = TextEditingController();

  late String userName;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;

  final defaultContainerInputDecoration = const BoxDecoration(
      color: WeinFluColors.brandSecondaryColor,
      borderRadius: BorderRadius.all(WeinFluRadius.radiusSmall));

  final activeContainerInputDecoration = BoxDecoration(
      color: WeinFluColors.brandSecondaryColor,
      border: Border.all(color: WeinFluColors.brandPrimaryColor, width: 2.0),
      borderRadius: const BorderRadius.all(WeinFluRadius.radiusSmall));

  final defaultInputBorder = InputBorder.none;
  final defaultInputLabelTheme = const TextStyle(
      fontSize: 13,
      color: WeinFluColors.brandLigthDarkColor,
      fontWeight: FontWeight.normal);

  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 100.0, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  Copys.hello,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 21, 16, 59),
                  child: Text(Copys.lorem,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center),
                ),
                Form(
                    key: _formLoginKey,
                    child: Column(
                      children: [
                        Container(
                          height: 70.0,
                          padding: const EdgeInsets.only(
                            left: 24,
                          ),
                          decoration: userContainerDecoration,
                          child: TextFormField(
                            controller: userInputController,
                            style: Theme.of(context).textTheme.labelSmall,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return WeinFluErrors.userError;
                              }
                              if (value.length >= 10) {
                                return WeinFluErrors.userErrorLen;
                              }

                              // userName = value;
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                userContainerDecoration =
                                    activeContainerInputDecoration;
                                pswContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            onTapOutside: (event) {
                              setState(() {
                                userContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            onSaved: (userNameValue) {
                              userName = userNameValue!;
                            },
                            decoration: InputDecoration(
                                border: defaultInputBorder,
                                label: Text(
                                  Copys.userInputLabel,
                                  style: defaultInputLabelTheme,
                                )),
                          ),
                        ),
                        Container(
                          height: 70.0,
                          padding: const EdgeInsets.only(left: 24.0),
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: pswContainerDecoration,
                          child: TextFormField(
                              validator: (values) {
                                if (values == null || values.isEmpty) {
                                  return WeinFluErrors.userPsw;
                                }

                                return null;
                              },
                              onTap: () {
                                setState(() {
                                  pswContainerDecoration =
                                      activeContainerInputDecoration;
                                  userContainerDecoration =
                                      defaultContainerInputDecoration;
                                });
                              },
                              onTapOutside: (event) {
                                setState(() {
                                  pswContainerDecoration =
                                      defaultContainerInputDecoration;
                                });
                              },
                              obscureText: true,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                  border: defaultInputBorder,
                                  label: const Text(Copys.userPswInputLabel),
                                  labelStyle: defaultInputLabelTheme)),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      WeinFluRadius.radiusSmall)),
                              value: checkBoxState,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxState = !checkBoxState;
                                });
                              },
                              checkColor: WeinFluColors.brandLightColor,
                              activeColor: WeinFluColors.brandPrimaryColor,
                            ),
                            const Expanded(child: Text(Copys.rememberMe)),
                            TextButton(
                              onPressed: () {},
                              child: Text(Copys.recoveryPassword,
                                  style: defaultInputLabelTheme),
                            ),
                          ],
                        ),
                        Container(
                          width: 394.0,
                          height: 64.0,
                          margin:
                              const EdgeInsets.only(top: 32.0, bottom: 48.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formLoginKey.currentState!.validate()) {
                                // _formLoginKey.currentState!.save();
                                userName = userInputController.text;
                                Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.home,
                                  arguments: userName,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    WeinFluColors.brandPrimaryColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        WeinFluRadius.radiusSmall))),
                            child: const Text(Copys.logIn),
                          ),
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: WeinFluColors.brandLigthDarkColor,
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14.0),
                              child: Text(Copys.orContinue),
                            ),
                            Expanded(
                              child: Divider(
                                color: WeinFluColors.brandLigthDarkColor,
                                thickness: 1.0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 22.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                width: 189.0,
                                height: 69,
                                decoration: const BoxDecoration(
                                  color: WeinFluColors.brandSecondaryColor,
                                  borderRadius: BorderRadius.all(
                                      WeinFluRadius.radiusSmall),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/google.png'),
                                      width: 30.0,
                                      height: 30.0,
                                    ),
                                    SizedBox(width: 12.0),
                                    Text(
                                      Copys.google,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: WeinFluColors
                                              .brandLigthDarkColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            Container(
                              width: 189.0,
                              height: 69,
                              decoration: const BoxDecoration(
                                color: WeinFluColors.brandSecondaryColor,
                                borderRadius:
                                    BorderRadius.all(WeinFluRadius.radiusSmall),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/facebook.png'),
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  SizedBox(width: 12.0),
                                  Text(
                                    Copys.facebook,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            WeinFluColors.brandLigthDarkColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(Copys.notAMember),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  Copys.registerNow,
                                  style: TextStyle(
                                      color: WeinFluColors.brandPrimaryColor,
                                      fontSize: 13.0),
                                ))
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
