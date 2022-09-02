import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:teratour/utilities/constants.dart';
import 'package:teratour/auth/auth_exceptions.dart';
import 'package:teratour/auth/auth_service.dart';

import '../utilities/show_error_dialog.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _fullName;
  bool showSpinner = false;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _fullName = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _fullName.dispose();
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
              const SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Hi!',style: kBigTextStyle,)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Create a new account', style: kMiniTextStyle,)),
                    const SizedBox(
                      height: 35,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 320,
                        height: 90,
                        child: TextField(
                          controller: _fullName,
                          decoration: const InputDecoration(
                            focusedBorder: kTextFieldStyle2,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 2)
                            ),
                            hintText: 'Enter your fullname',
                            hintStyle: kTextFieldStyle,

                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 320,
                        height: 90,
                        child: TextField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            focusedBorder: kTextFieldStyle2,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 2)
                            ),
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
                          controller: _password,
                          autocorrect: false,
                          obscureText: true,
                          decoration: const InputDecoration(
                            focusedBorder: kTextFieldStyle2,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 2)
                            ),
                            hintText: 'Enter your password',
                            hintStyle: kTextFieldStyle,

                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  MaterialButton(
                    height: 55,
                    minWidth: 280,
                    textColor: Colors.white,
                    splashColor: Colors.white,
                    color: kButtonColor,
                    onPressed: () async{
                      setState(() {
                        showSpinner = true;
                      });
                      final email = _email.text;
                      final password = _password.text;
                      final fullName = _fullName.text;
                      try {
                        await AuthService.firebase().createUser(email: email, password: password,fullName: fullName);
                        final user = AuthService.firebase().currentUser;
                        await AuthService.firebase().sendEmailVerification();
                        Navigator.of(context).pushNamed(verifyEmailRoute);
                        setState(() {
                          showSpinner = false;
                        });
                      } on WeakPasswordAuthException {
                        await showErrorDialog(context, 'Weak password');
                      } on EmailAlreadyInUseAuthException {
                        await showErrorDialog(context, 'Email is  already in use');
                      } on InvalidEmailAuthException {
                        await showErrorDialog(context, 'Invalid Email');
                      } on GenericAuthException {
                        await showErrorDialog(context, 'Failed to Register');
                      }
                    },
                    child: const Text('SIGN UP', style: kViewTextStyle,),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, loginRoute);
                  }
                      , child: const Text("Already have an account? Sign In",style: kSmallTextStyle1,)),
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
                        height: 40,
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
              ),


            ],
          )

        ),
      ),
    );
  }
}
