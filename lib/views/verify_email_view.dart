import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:teratour/auth/auth_service.dart';
import 'package:teratour/utilities/constants.dart';
import 'package:teratour/auth/auth_exceptions.dart';
import 'package:teratour/utilities/show_error_dialog.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
        backgroundColor: kButtonColor,
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/email2.png"), fit: BoxFit.cover),

            ),
            //padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
              MaterialButton(
                height: 55,
                minWidth: 340,
                textColor: Colors.white,
                splashColor: Colors.white,
                color: kButtonColor,
                onPressed: () async{
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    AuthService.firebase().sendEmailVerification();
                    setState(() {
                      showSpinner = false;
                    });
                  }on UserNotLoggedInAuthException{
                    await showErrorDialog(context, 'User not Logged in');
                  }catch(_){
                    await showErrorDialog(context, '$_');
                  }
                },
                child: const Text('Send Email Verfication'),
              ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, mainPageRoute);
                  }, child: Text('Skip',style: kSmallTextStyle,))
            ]),
          ),
        ),
      ),
    );
  }
}
