import 'package:flutter/material.dart';
import 'package:teratour/utilities/constants.dart';
import 'package:teratour/auth/auth_service.dart';
import '../auth/auth_exceptions.dart';
import '../utilities/show_error_dialog.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool showSpinner = false;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Welcome!',
                        style: kBigTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Sign in to continue',
                        style: kMiniTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 320,
                        height: 90,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _email,
                          decoration: const InputDecoration(
                            focusedBorder: kTextFieldStyle2,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 2)),
                            hintText: 'Enter your email',
                            hintStyle: kTextFieldStyle,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 320,
                        child: TextField(
                          obscureText: true,
                          controller: _password,
                          decoration: const InputDecoration(
                            focusedBorder: kTextFieldStyle2,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 2)),
                            hintText: 'Enter your password',
                            hintStyle: kTextFieldStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, forgotPasswordRoute);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: kSmallTextStyle,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  MaterialButton(
                    height: 55,
                    minWidth: 280,
                    textColor: Colors.white,
                    splashColor: Colors.white,
                    color: kButtonColor,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        await AuthService.firebase()
                            .logIn(email: email, password: password);
                        final user = AuthService.firebase().currentUser;
                        if (user?.isEmailVerified ?? false) {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(mainPageRoute, (route) => false);
                        } else {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              verifyEmailRoute, (route) => false);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } on UserNotFoundAuthException {
                        await showErrorDialog(
                          context,
                          'User not found',
                        );
                      } on WrongPasswordAuthException {
                        await showErrorDialog(context, 'Wrong password');
                      } on GenericAuthException {
                        await showErrorDialog(context, 'Authentication Error');
                      }
                    },
                    child: const Text(
                      'LOGIN',
                      style: kViewTextStyle,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, registerRoute);
                      },
                      child: const Text(
                        "Don't have an account? Sign up",
                        style: kSmallTextStyle1,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                      ),
                      Text('OR'),
                      SizedBox(
                        width: 160,
                        height: 20,
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Social Media Login'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        minWidth: 2,
                        onPressed: () async{
                          setState(() {
                            showSpinner = true;
                          });
                          await AuthService.firebase().signInWithGoogle();
                          Navigator.pushNamed(context, mainPageRoute);
                          setState(() {
                            showSpinner = false;
                          });
                        },
                        child: const Image(
                          image: AssetImage('images/google.png'),
                          height: 35,
                        ),
                      ),
                      FlatButton(
                        minWidth: 2,
                        onPressed: ()async{
                          setState(() {
                            showSpinner = true;
                          });
                          await AuthService.firebase().signInWithFacebook();
                          Navigator.pushNamed(context, mainPageRoute);
                          setState(() {
                            showSpinner = false;
                          });
                        },
                        child: const Image(
                          image: AssetImage('images/facebook.png'),
                          height: 35,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
