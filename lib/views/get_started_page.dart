import 'package:flutter/material.dart';

import '../utilities/constants.dart';
class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/getstarted.png"), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                height: 55,
                minWidth: 280,
                textColor: Colors.white,
                splashColor: Colors.white,
                color: kButtonColor,
                onPressed: () {
                  Navigator.pushNamed(context, selectionPageRoute);
                },
                child: const Text('GET STARTED'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
