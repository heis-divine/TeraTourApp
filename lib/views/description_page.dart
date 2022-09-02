import 'package:flutter/material.dart';
import 'package:teratour/utilities/constants.dart';
class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: Column(
        children:  [
          const SizedBox(height: 16,),
          const Center(
            child: Image(
                image: AssetImage('images/Hotels.png'),
              height: 170,
            ),
          ),
          const SizedBox(height: 15,),
        const DescriptionText(name: 'Name:  ', description: 'Toscana Hotels',),
         const SizedBox(height: 15,),
         Row(
           children: const [
             Text('Description:  ',style: kDescriptionTextStyle,),
             Expanded(child: Text("What is the name of the boy named John I’m the name of the boy named John print hello world in the directory of the boy in the main the basic of the main John of the boy of the crash of the main game of the boy in the general main game of the boy named John of the body of christ of the directory main game of the main game print hello world of the world"))
           ],
         ),
          const SizedBox(height: 15,),
          const DescriptionText(name: 'Location:  ', description: '4km away'),
          const SizedBox(height: 15,),
          const DescriptionText(name: 'Category:  ', description: 'Hotels'),

        ],
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String name;
  final String description;
  const DescriptionText({
    Key? key,
    required this.name,
    required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name,style: kDescriptionTextStyle,),
        Text(description)
      ],
    );
  }
}
