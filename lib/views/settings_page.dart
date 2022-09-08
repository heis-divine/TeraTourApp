import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../utilities/constants.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final user = AuthService.firebase().currentUser?.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/account.png'),
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '$user',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //about us
          const SettingContainer(
            firstIconData: Icons.info,
            secondIconData: Icons.navigate_next,
            text: "About us",
          ),
          //contact us
          const SettingContainer(
              firstIconData: Icons.contact_mail,
              secondIconData: Icons.navigate_next,
              text: "Contact us"),
          //help
          const SettingContainer(
              firstIconData: Icons.help,
              secondIconData: Icons.navigate_next,
              text: "Help"),
          //rate us
          const SettingContainer(
              firstIconData: Icons.rate_review,
              secondIconData: Icons.navigate_next,
              text: "Rate us"),
        ],
      ),
    );
  }
}

class SettingContainer extends StatelessWidget {
  final IconData firstIconData;
  final IconData secondIconData;
  final String text;
  //final Function onClick;

  const SettingContainer({
    required this.firstIconData,
    required this.secondIconData,
    //required this.onClick,
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: kButtonColor),
          bottom: BorderSide(width: 1, color: kButtonColor),
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              firstIconData,
              color: Colors.black,
            ),
            Text(
              text,
              style: kUserProfileTextStyle,
            ),
            Icon(
              secondIconData,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
