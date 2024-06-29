import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordquest/src/features/authentication/presentation/signup.dart';
import 'package:wordquest/src/features/utils/main_button.dart';
import 'package:wordquest/src/features/utils/text_field_custom.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? results;
  const LoginScreen({super.key, this.results});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool buttonActive = true;

  //  global key for the form on this screen
  final _formKey = GlobalKey<FormState>();

  bool buttonIsDisabled = true;

  @override
  Widget build(BuildContext context) {
    // AuthRepo authRepo = AuthRepo.instance;
    // var currentDiagnosisState = ref.watch(diagnosisControllerProvider);

    // CurrentUserController currentUserState =
    //     ref.read(currentUserControllerProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: SizedBox(
              width: 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const Text(
                    "Login to your account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldCustom(
                          controller: emailController,
                          label: "Email",
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldCustom(
                          obscureText: true,
                          controller: passwordController,
                          label: "Password",
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Dont have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF082163),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: MainButton(
                        disabled: buttonActive ? false : true,
                        //disabled: buttonIsDisabled,
                        text: "Log in",
                        onpressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            // setState(() {
                            //   buttonActive = false;
                            // });
                            // bool response = await authRepo.login(
                            //     emailController.text.trim(),
                            //     passwordController.text.trim(),
                            //     currentUserState,
                            //     widget.results,
                            //     currentDiagnosisState);
                            // if (response) {
                            //   Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(builder: (context) => NavBar()),
                            //     (Route<dynamic> route) =>
                            //         false, // Remove all routes from the stack
                            //   );
                            // } else {
                            //   AuthSnackBar.show(context, "Login Failed", true);
                            //   setState(() {
                            //     buttonActive = true;
                            //   });
                            // }
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
