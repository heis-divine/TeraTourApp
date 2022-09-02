import 'package:flutter/material.dart';
import 'package:teratour/main.dart';
import 'package:teratour/utilities/constants.dart';
class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/intro.png"),
            fit: BoxFit.cover,
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                      height: 55,
                      minWidth: 250,
                      textColor: Colors.white,
                      splashColor: Colors.white,
                      color: kButtonColor,
                      onPressed: () {
                        Navigator.pushNamed(context, loginRoute);
                      },
                      child: const Text('LOGIN', style: kViewTextStyle,),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      height: 55,
                      child: OutlinedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, registerRoute);
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: kButtonColor,
                                width: 2,
                            ),
                            primary: Colors.black,
                            textStyle: kViewTextStyle
                          ),
                          child: const Text('SIGN UP')),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
