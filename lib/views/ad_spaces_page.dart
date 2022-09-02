import 'package:flutter/material.dart';
class AdSpacesView extends StatefulWidget {
  const AdSpacesView({Key? key}) : super(key: key);

  @override
  State<AdSpacesView> createState() => _AdSpacesViewState();
}

class _AdSpacesViewState extends State<AdSpacesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AD SPACES'),
      ),
    );
  }
}

