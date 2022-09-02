import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teratour/auth/auth_service.dart';
import 'package:teratour/utilities/constants.dart';
import 'login_view.dart';
import 'package:teratour/utilities/show_error_dialog.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}
class _UserProfileViewState extends State<UserProfileView> {
  final user = AuthService.firebase().currentUser?.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
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
          Container(
            padding: const EdgeInsets.all(4),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //profile
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: kButtonColor),
                        bottom: BorderSide(width: 1, color: kButtonColor)),
                    color: Colors.white54,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        Text(
                          'Profile',
                          style: kUserProfileTextStyle,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                //settings
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 1, color: kButtonColor)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, settingsRoute);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        Text(
                          'Settings',
                          style: kUserProfileTextStyle,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                //log out
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(width: 1, color: kButtonColor))),
                  child: TextButton(
                    onPressed: () async {
                      final shouldLogout = await showLogOutDialog(context);
                      if (shouldLogout) {
                        AuthService.firebase().logOut();
                        AuthService.firebase().logoutFacebook();
                        Navigator.pushNamed(context, loginRoute);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        Text(
                          'Log Out',
                          style: kUserProfileTextStyle,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
