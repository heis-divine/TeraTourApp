import 'package:flutter/material.dart';
class FrequentlyVisitedView extends StatefulWidget {
  const FrequentlyVisitedView({Key? key}) : super(key: key);

  @override
  State<FrequentlyVisitedView> createState() => _FrequentlyVisitedViewState();
}

class _FrequentlyVisitedViewState extends State<FrequentlyVisitedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
    );
  }
}
