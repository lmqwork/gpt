import 'package:auto_gpt_web/src/presentation/helper/helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum PageState {
  signIn,
  signUp,
  forgotPassword,
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRememberMe = false;
  PageState pageState = PageState.signUp;

  String getTitle() {
    switch (pageState) {
      case PageState.signIn:
        return 'Login To Your Account';
      case PageState.signUp:
        return 'Create New Account';
      default:
        return 'Forgot Password';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 244, 246),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Center(
                child: LayoutBuilder(builder: (context, c) {
                  return SizedBox(
                    width: c.maxWidth * 2 / 3,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/half_page_with_illustration-svg1.svg',
                          width: 128,
                          height: 128,
                        ),
                        const SizedBox(height: 50),
                        TText(
                          getTitle(),
                          props:
                              'text-2xl md:text-3xl sm:text-4xl font-bold leading-tight',
                        ),
                        const SizedBox(height: 24),
                        InputTextField(
                          title: 'Email',
                          controller: passwordController,
                        ),
                        const SizedBox(height: 8),
                        InputTextField(
                          title: 'Password',
                          controller: passwordController,
                        ),
                        const SizedBox(height: 8),
                        const InputTextField(
                          title: 'Re-type Password',
                          controller: null,
                        ),
                        const SizedBox(height: 24),
                        if (pageState == PageState.signIn)
                          Row(
                            children: [
                              Checkbox(
                                  value: isRememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      isRememberMe = value ?? false;
                                    });
                                  }),
                              const TText(
                                'Remember Me',
                                props: 'text-xs',
                              ),
                              const Spacer(),
                              RichText(
                                  text: TextSpan(
                                      text: 'Forgot Password?',
                                      recognizer: TapGestureRecognizer(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: TColor.indigo600)))
                            ],
                          ),
                        const SizedBox(height: 24),
                        MyButton(
                          onPressed: () {},
                          title: getActionButtonTitle(),
                        ),
                        const Spacer(),
                        if (pageState == PageState.signIn)
                          RichText(
                              text: TextSpan(
                                  text: "Don't Have A Account? ",
                                  children: [
                                    TextSpan(
                                        text: 'Sign Up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Colors.blue))
                                  ],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.black))),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          if (Helper.isDesktop(context))
            Expanded(
              child: LayoutBuilder(builder: (context, c) {
                return Stack(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 79, 70, 229),
                      child:
                          Center(child: Image.asset('assets/image/team.png')),
                    ),
                    Positioned.fill(
                        bottom: 100,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: c.maxWidth - 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: SvgPicture.asset(
                                      'assets/svg/half_page_with_illustration-svg2.svg'),
                                ),
                                Container(
                                  width: 1,
                                  height: 100,
                                  color: TColor.gray700,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        TText(
                                          'Hassle Free Team Augmentation Like Never Before.',
                                          props:
                                              'text-md font-semibold text-gray-800 dark:text-gray-100 leading-normal',
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        TText(
                                          'Staff augmentation is quickly becoming a buzzword on the IT job market, attracting more global businesses to hire remotely.',
                                          props:
                                              'text-sm pt-2 text-gray-700 dark:text-gray-400 leading-normal',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                );
              }),
            ),
        ],
      ),
    );
  }

  getActionButtonTitle() {
    switch (pageState) {
      case PageState.signIn:
        return 'Login To Your Account';
      case PageState.signUp:
        return 'Create New Account';
      default:
        return 'Send Email';
    }
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 24, horizontal: 30)),
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromARGB(255, 67, 56, 202),
            )),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.white),
        ));
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({super.key, this.controller, required this.title});
  final TextEditingController? controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TText(
              title,
              props: 'text-lg font-semibold leading-tight',
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              fillColor: Colors.white70),
        ),
      ],
    );
  }
}
