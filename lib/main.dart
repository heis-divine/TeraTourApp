import 'package:flutter/material.dart';
import 'package:teratour/auth/auth_service.dart';
import 'package:teratour/views/ad_spaces_page.dart';
import 'package:teratour/views/categories_list.dart';
import 'package:teratour/views/description_page.dart';
import 'package:teratour/views/events_page.dart';
import 'package:teratour/views/forgot_password.dart';
import 'package:teratour/views/frequently_visited_page.dart';
import 'package:teratour/views/get_started_page.dart';
import 'package:teratour/views/home_view.dart';
import 'package:teratour/views/login_view.dart';
import 'package:teratour/views/register_view.dart';
import 'package:teratour/views/settings_page.dart';
import 'package:teratour/views/user_profile.dart';
import 'package:teratour/views/verify_email_view.dart';
import 'utilities/constants.dart';
import 'views/selection_page.dart';
import 'dart:developer' as devtools show log;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.firebase().initialize();
  runApp(const TeraTour());
}

class TeraTour extends StatelessWidget {
  const TeraTour({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeraTour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kButtonColor,
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: kButtonColor,
        ),
        //brightness: Brightness.dark
      ),
      home: const HomePage(),
      routes: {
        userProfileRoute: (context) => const UserProfileView(),
        forgotPasswordRoute: (context) => const ForgotPasswordView(),
        categoriesList: (context) => const CategoriesList(),
        mainPageRoute: (context) => const HomeView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        selectionPageRoute: (context) => const SelectionPage(),
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        adSpacesRoute: (context) => const AdSpacesView(),
        eventsRoute: (context) => const EventsView(),
        descriptionPageRoute: (context) => const DescriptionPage(),
        frequentlyVisitedRoute: (context) => const FrequentlyVisitedView(),
        settingsRoute: (context) => const SettingsView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            devtools.log(user.toString());
            if (user != null) {
              if (user.isEmailVerified) {
                return const HomeView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const GetStartedPage();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
