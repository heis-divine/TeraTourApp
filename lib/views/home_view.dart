import 'package:flutter/material.dart';
import 'package:teratour/utilities/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kButtonColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, userProfileRoute);
          },
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          tooltip: 'Profile',
        ),
        title: const Text('TeraTour'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, categoriesList);
            },
            icon: const Icon(
              Icons.format_list_bulleted_outlined,
              color: Colors.white,
            ),
            tooltip: 'Categories',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: hotelIcon),
                  locationName: 'Toscana Hotels',
                  locationKm: '4km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: shoppingIcon),
                  locationName: 'Roban Stores',
                  locationKm: '6km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: schoolIcon),
                  locationName: 'SOLIS',
                  locationKm: '9km',
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: hospitalIcon),
                  locationName: 'Good Shepherd',
                  locationKm: '4km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: barIcon),
                  locationName: 'Bush Bar',
                  locationKm: '6km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: barIcon),
                  locationName: 'Bush Bar',
                  locationKm: '6km',
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: hotelIcon),
                  locationName: 'Toscana Hotels',
                  locationKm: '4km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: shoppingIcon),
                  locationName: 'Roban Stores',
                  locationKm: '6km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: schoolIcon),
                  locationName: 'SOLIS',
                  locationKm: '9km',
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: hospitalIcon),
                  locationName: 'Good Shepherd',
                  locationKm: '4km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: barIcon),
                  locationName: 'Bush Bar',
                  locationKm: '6km',
                ),
                LocationCircle(
                  icon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, descriptionPageRoute);
                      },
                      icon: barIcon),
                  locationName: 'Bush Bar',
                  locationKm: '6km',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, mainPageRoute);
                },
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                tooltip: 'Near me',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, eventsRoute);
                  },
                  child: const Text(
                    'Events',
                    style: kNavTextStyle,
                  )),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, frequentlyVisitedRoute);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                tooltip: 'Frequently visited',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, adSpacesRoute);
                  },
                  child: const Text(
                    'Ad Spaces',
                    style: kNavTextStyle,
                  )),
            ],
          )),
    );
  }
}

class LocationCircle extends StatelessWidget {
  final IconButton icon;
  final String locationName;
  final String locationKm;

  const LocationCircle({
    Key? key,
    required this.icon,
    required this.locationName,
    required this.locationKm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Color(0xffFFB6C1),
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        Text(
          locationName,
          style: kViewTextStyle,
        ),
        Text(
          locationKm,
          style: kSmallTextStyle,
        )
      ],
    );
  }
}
