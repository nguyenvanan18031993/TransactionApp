import 'package:flutter/material.dart';
import 'package:transaction_app/presentation/home/view/home_screen.dart';
import 'package:transaction_app/services/di.dart';
import 'package:transaction_app/utils/app_contants/app_constants.dart';
import 'package:transaction_app/utils/extensions/route_extension.dart';
import 'package:transaction_app/utils/shared_pref_manager/shared_pref_helper.dart';
import 'package:transaction_app/widgets/base_flat_button.dart';
import 'package:transaction_app/widgets/base_textfield.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextFieldALL(
                  textEditingController: emailController,
                  spaceBottom: false,
                  color: AppConstants.colorBorderBox,
                  radius: 8.0,
                  textAlign: TextAlign.center,
                  textInputType: TextInputType.emailAddress,
                  lengthLimitingText: 11,
                  isEnable: true,
                  hintText: 'Email',
                  isNeedValidate: true,
                  onTextChange: (value) {
                    emailController.text = value;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                AppTextFieldALL(
                  textEditingController: emailController,
                  spaceBottom: false,
                  color: AppConstants.colorBorderBox,
                  radius: 8.0,
                  textAlign: TextAlign.center,
                  textInputType: TextInputType.visiblePassword,
                  isEnable: true,
                  hintText: 'Password',
                  onTextChange: (value) {
                    passwordController.text = value;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                AppFlatButton(
                    text: 'Login',
                    onPressed: (emailController.text.isNotEmpty && passwordController.text.isNotEmpty)
                        ? () {
                            context.pushReplacementNamed(HomeScreen.routeName);
                            getIt<PreferenceUtils>().setBool('isLogedIn', true);
                          }
                        : null)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
