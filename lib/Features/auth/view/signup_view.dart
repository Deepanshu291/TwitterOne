import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwitter/Components/Loader.dart';
import 'package:fwitter/Features/auth/controller/auth_controller.dart';
import '../../../Components/components.dart';
import '../../../Constants/appbar.dart';
import '../../../utils/pallate.dart';
import '../widgets/textfieldwidget.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpView());
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
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

  void onSignup() {
    final res = ref.read(AuthControllerProvider.notifier);
    res.signup(email: email.text, password: password.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(AuthControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading ? const Loader():  Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Join Fwitter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 35,
              ),
              roundsmallbtn(
                icon: Icons.ac_unit,
                label: "Sign up with Google",
                ontap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              roundsmallbtn(
                icon: Icons.ac_unit,
                label: "Sign up with Apple",
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
              roundsmallbtn(
                label: 'Create account',
                icon: Icons.abc,
                ontap: () => onSignup(),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                    text: "Have an account already?",
                    style:
                        const TextStyle(fontSize: 16, color: Pallete.greyColor),
                    children: [
                      TextSpan(
                          text: " Log in",
                          style: const TextStyle(
                              color: Pallete.blueColor, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(
                                context,
                                // LoginView.route()
                              );
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
