import 'package:crypto_exchange/feature/login/cubit/login_cubit.dart';
import 'package:crypto_exchange/feature/login/cubit/login_state.dart';
import 'package:crypto_exchange/utility/colors_app.dart';
import 'package:crypto_exchange/utility/sizes_app.dart';
import 'package:crypto_exchange/utility/text_style_source.dart';
import 'package:crypto_exchange/widget/app_text_field.dart';
import 'package:crypto_exchange/widget/arrow_back_button.dart';
import 'package:crypto_exchange/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO: Data for testing TextFiels errors
const String fakeEmail = 'omko@gmail.com';
const String fakePassword = '1234Omko';

class LoginPage extends StatelessWidget {
  static const path = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Login'),
            centerTitle: true,
            backgroundColor: ColorsApp.background,
            foregroundColor: ColorsApp.grey100,
            leading: const ArrowBackButton(),
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
                          AppTextField(
                            title: 'Email',
                            hintText: 'Enter your email',
                            textInputType: TextInputType.emailAddress,
                            isValid:
                                state.error != LoginError.incorrectCredentials,
                            onChanged: (text) {
                              context.read<LoginCubit>().setEmail(text);
                            },
                          ),
                          gapH16,
                          AppTextField(
                            title: 'Password',
                            hintText: 'Enter your password',
                            onChanged: (text) {
                              context.read<LoginCubit>().setPassword(text);
                            },
                            isPassword: true,
                            obscureText: state.isPasswordHide,
                            isValid:
                                state.error != LoginError.incorrectCredentials,
                            isObscure: () {
                              context
                                  .read<LoginCubit>()
                                  .togglePasswordVisibility();
                            },
                          ),
                          gapH8,
                          Visibility(
                            visible:
                                state.error == LoginError.incorrectCredentials,
                            child: Text(
                              'Incorrect login or password. Check the data and try again',
                              style: TextStyleSource.style16regular.copyWith(
                                color: ColorsApp.red,
                              ),
                            ),
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
                        colorButton: state.isFieldValid
                            ? ColorsApp.accent
                            : ColorsApp.grey200,
                        colorText: state.isFieldValid
                            ? ColorsApp.grey400
                            : ColorsApp.white,
                        onTap: () {
                          debugPrint(
                              '${state.email} <<<<< Email, ${state.password} <<<<< Password ====== $fakeEmail and $fakePassword');
                          if (state.email == fakeEmail &&
                              state.password == fakePassword) {
                            debugPrint(
                                '>>>>>>>>>> Correct email and password <<<<<<<<<');
                          } else {
                            context
                                .read<LoginCubit>()
                                .setError(LoginError.incorrectCredentials);
                          }
                        },
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
        ),
      );
    });
  }
}
