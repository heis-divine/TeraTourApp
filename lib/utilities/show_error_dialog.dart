import 'package:flutter/material.dart';
Future<void> showErrorDialog(BuildContext context, String text,){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text('An error occurred'),
      content: Text(text),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text('OK'))
      ],

    );
  });
}
Future<bool>showLogOutDialog(BuildContext context){
  return showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(true);
              },
              child: const Text('Log out'),
            )
          ],
        );

      }).then((value) => value ?? false);
}

Future<void> showPasswordResetDialog(BuildContext context){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text('Password Reset'),
      content: const Text('Email Sent Successfully'),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text('OK'))
      ],

    );
  });
}