import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwitter/Components/Loader.dart';
import 'package:fwitter/Constants/constants.dart';
import 'package:fwitter/Features/auth/controller/auth_controller.dart';
import 'package:fwitter/Features/auth/view/signup_view.dart';
import 'package:fwitter/utils/pallate.dart';
import '../../../Components/components.dart';
import '../widgets/textfieldwidget.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final email = TextEditingController();
  final password = TextEditingController();
  final appbar = Uiconst.appBar();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void onLogin() {
    final res = ref.watch(AuthControllerProvider.notifier);
    res.login(email: email.text, password: password.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(AuthControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading? const Loader() :Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign in to Fwitter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 35,
              ),
              roundsmallbtn(
                icon: Icons.ac_unit,
                label: "Sign in with Google",
                ontap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              roundsmallbtn(
                icon: Icons.ac_unit,
                label: "Sign in with Apple",
                ontap: () {},
              ),
              const Stack(
                alignment: Alignment.center,
                children: [
                  Divider(color: Pallete.greyColor, height: 50),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Textfieldwidget(email: email, hintText: "email"),
              const SizedBox(
                height: 25,
              ),
              Textfieldwidget(email: password, hintText: "password"),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: roundsmallbtn(
                  label: 'Sign in',
                  icon: Icons.abc,
                  ontap: () => onLogin(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style:
                        const TextStyle(fontSize: 16, color: Pallete.greyColor),
                    children: [
                      TextSpan(
                          text: " Sign up",
                          style: const TextStyle(
                              color: Pallete.blueColor, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, SignUpView.route());
                            })
                    ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
