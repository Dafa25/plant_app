import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> chart = [];
  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(favoriteProduckPlant: favorites),
      ChartPage(addToChart: chart),
      const ProfilPage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite_border_outlined,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> listTitle = [
    "Beranda",
    "Favorit",
    "Keranjang",
    "Profil",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              listTitle[_bottomNavIndex],
              style: TextStyle(
                color: Guide.secondColor,
                fontWeight: FontWeight.w400,
                fontSize: 26,
              ),
            ),
            const Icon(
              Icons.notifications,
              size: 26.0,
              color: Colors.black54,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        elevation: 0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: _bottomNavIndex,
          notchSmoothness: NotchSmoothness.smoothEdge,
          gapLocation: GapLocation.none,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              final List<Plant> FavoriteProduckPlant =
                  Plant.getFavoritedPlants();
              final List<Plant> addToChart = Plant.addedToCartPlants();
              favorites = FavoriteProduckPlant;
              chart = addToChart.toSet().toList();
            });
          }),
    );
  }
}
