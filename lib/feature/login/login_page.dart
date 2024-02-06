import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:crypto_exchange/utility/sizes_app.dart';
import 'package:crypto_exchange/utility/text_style_source.dart';
import 'package:crypto_exchange/widget/custom_text_field.dart';
import 'package:crypto_exchange/widget/primary_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const path = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color buttonColor = ColorsApp.grey200;
  Color textColor = ColorsApp.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: ColorsApp.background,
        foregroundColor: ColorsApp.grey100,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      gapH16,
                      Text(
                        'To log in to your account, please enter the information provided by your super administrator',
                        style: TextStyleSource.style16regular.copyWith(
                          color: ColorsApp.grey100,
                        ),
                      ),
                      gapH32,
                      CustomTextField(
                        title: 'Email',
                        hintText: 'Enter your email',
                        onChanged: (text) {
                          setState(() {
                            buttonColor = text.isNotEmpty
                                ? ColorsApp.accent
                                : ColorsApp.grey200;
                            textColor = text.isNotEmpty
                                ? ColorsApp.grey400
                                : ColorsApp.white;
                          });
                        },
                      ),
                      gapH16,
                      CustomTextField(
                        title: 'Password',
                        hintText: 'Enter your password',
                        onChanged: (text) {
                          setState(() {
                            buttonColor = text.isNotEmpty
                                ? ColorsApp.accent
                                : ColorsApp.grey200;
                            textColor = text.isNotEmpty
                                ? ColorsApp.grey400
                                : ColorsApp.white;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: PrimaryButton(
                    title: 'Continue',
                    colorButton: buttonColor,
                    colorText: textColor,
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                  child: PrimaryButton(
                    title: 'Forgot your password?',
                    colorButton: ColorsApp.background,
                    colorText: ColorsApp.accent,
                    elevation: 0,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
