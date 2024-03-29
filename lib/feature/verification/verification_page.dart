import 'package:crypto_exchange/feature/login/login_page.dart';
import 'package:crypto_exchange/feature/verification/cubit/verification_cubit.dart';
import 'package:crypto_exchange/feature/verification/cubit/verification_state.dart';
import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:crypto_exchange/utility/sizes_app.dart';
import 'package:crypto_exchange/utility/text_style_source.dart';
import 'package:crypto_exchange/widget/custom_text_field.dart';
import 'package:crypto_exchange/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerificationPage extends StatelessWidget {
  static const path = '/';

  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
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
                  Text(
                    'To complete the verification, you need to provide the following email address',
                    style: TextStyleSource.style16regular.copyWith(
                      color: ColorsApp.grey100,
                    ),
                  ),
                  gapH32,
                  CustomTextField(
                    title: 'Email',
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    onChanged: (text) {
                      context.read<VerificationCubit>().setEmail(text);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  PrimaryButton(
                    title: 'Continue',
                    colorButton: state.isEmailValid
                        ? ColorsApp.accent
                        : ColorsApp.accent.withOpacity(0.5),
                    onTap: () {
                      context.push(LoginPage.path);
                    },
                  ),
                  gapH24,
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
