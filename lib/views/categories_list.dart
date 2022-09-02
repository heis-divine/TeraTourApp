import 'package:flutter/material.dart';
import 'package:teratour/utilities/constants.dart';
class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          Category(imageAddress: "images/Hotels.png", imageText: 'Hotels'),
          Category(imageAddress: "images/Restaurants.png", imageText: "Restaurants"),
          Category(imageAddress: 'images/Parks.png', imageText: 'Parks'),
          Category(imageAddress: 'images/Clubs.png', imageText: 'Clubs'),
          Category(imageAddress: 'images/Hospitals.png', imageText: 'Hospitals'),
          Category(imageAddress: 'images/Malls.png', imageText: 'Malls/Stores'),
          Category(imageAddress: 'images/Pharmacy.png', imageText: 'Pharmacy'),
          Category(imageAddress: 'images/Markets.png', imageText: 'Markets'),
          Category(imageAddress: 'images/Schools.png', imageText: 'Schools'),
          Category(imageAddress: 'images/Museums.png', imageText: 'Museums'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageAddress;
  final String imageText;
  const Category({
    Key? key,
    required this.imageAddress,
    required this.imageText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
              image: AssetImage(imageAddress), fit: BoxFit.cover),
        ),
        child:  TextButton(
          onPressed: (){
            Navigator.pushNamed(context, mainPageRoute);
          },
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(imageText, style: kCategoriesTextStyle,)),
        ),
      ),
    );
  }
}
