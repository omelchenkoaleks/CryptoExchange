import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:crypto_exchange/utility/sizes_app.dart';
import 'package:crypto_exchange/widget/custom_text_field.dart';
import 'package:crypto_exchange/widget/primary_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const path = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  Color buttonColor = ColorsApp.accent.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
        centerTitle: true,
        backgroundColor: ColorsApp.background,
        foregroundColor: ColorsApp.grey100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                gapH16,
                const Text(
                  'Для завершення верифікації вам необхідно вказати актуально пошту',
                  style: TextStyle(
                    color: ColorsApp.grey100,
                  ),
                ),
                gapH32,
                CustomTextField(
                  controller: controller,
                  title: 'Email',
                  hintText: 'Enter your email',
                  onChanged: (text) {
                    setState(() {
                      buttonColor = text.isNotEmpty
                          ? ColorsApp.accent
                          : ColorsApp.accent.withOpacity(0.5);
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                PrimaryButton(
                  title: 'Continue',
                  colorButton: buttonColor,
                  onTap: () {},
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
