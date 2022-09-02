import 'package:flutter/material.dart';
import 'package:teratour/auth/auth_service.dart';
import 'package:teratour/utilities/constants.dart';
import 'package:teratour/utilities/show_error_dialog.dart';
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _controller,
            decoration: const InputDecoration(
              focusedBorder: kTextFieldStyle2,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2)
              ),
              hintText: 'Enter your email address',
              hintStyle: kTextFieldStyle,

            ),
          ),
          Column(
            children: [
              MaterialButton(
                height: 55,
                minWidth: 340,
                textColor: Colors.white,
                splashColor: Colors.white,
                color: kButtonColor,
                onPressed: () async{
                  final email = _controller.text;
                  try {
                    AuthService.firebase().sendPasswordReset(toEmail: email);
                    await showPasswordResetDialog(context);
                  }catch(_){
                    await showErrorDialog(context, '$_');
                  }
                },
                child: const Text('Send Password Reset Link'),

              ),
              TextButton(onPressed: (){
              }, child: Text('',style: kSmallTextStyle,))
            ],
          ),

        ],
      ),
    );
  }

}

