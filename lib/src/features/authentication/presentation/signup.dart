import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordquest/src/features/utils/main_button.dart';
import 'package:wordquest/src/features/utils/text_field_custom.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool buttonActive = true;

  //  global key for the form on this screen
  final _formKey = GlobalKey<FormState>();

  bool buttonIsDisabled = true;

  @override
  Widget build(BuildContext context) {
    // AuthRepo authRepo = AuthRepo.instance;
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
                    height: 50,
                  ),
                  const Text(
                    "Create an account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Lets get started! Provide both names",
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
                          controller: nameController,
                          label: "Name",
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                    height: 40,
                  ),
                  MainButton(
                      disabled: buttonActive ? false : true,
                      //disabled: buttonIsDisabled,
                      text: "Sign Up",
                      onpressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // setState(() {
                          //   buttonActive = false;
                          // });
                          // bool response = await authRepo.signUp(
                          //   nameController.text.trim(),
                          //   emailController.text.trim(),
                          //   passwordController.text.trim(),
                          // );
                          // if (response) {
                          //   Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(builder: (context) => LoginScreen()),
                          //     (Route<dynamic> route) =>
                          //         false, // Remove all routes from the stack
                          //   );
                          // } else {
                          //   AuthSnackBar.show(context, "Sign up Failed", true);
                          //   setState(() {
                          //     buttonActive = true;
                          //   });
                          // }
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
