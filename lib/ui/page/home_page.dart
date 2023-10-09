// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:plant_app/guide.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/ui/page/detail_produk_plant.dart';
import 'package:plant_app/widget/plant_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    List<String> plantCategory = [
      "Rekomondasi",
      "Paling Banyak dibeli",
      "Indoor",
      "Outdoor",
      "Tanaman hias",
      "Garden",
    ];

    bool toogleIsfavorated(bool isFavorit) {
      return !isFavorit;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 235, 235, 235),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text(
                    "Good Morning",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: const Text("Temukan tanaman yang kamu sukai disini"),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    // search bar
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.search,
                          size: 24.0,
                          color: Colors.black54,
                        ),
                        Expanded(
                            child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Guide.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plantCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          plantCategory[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: selectedIndex == index
                                ? Guide.primaryColor
                                : Guide.secondColor,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 0),
              child: const Text(
                "Favorit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailProduk(
                                  idPlant: _plantList[index].plantId,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              offset: const Offset(1, 20),
                              blurRadius: 8,
                            )
                          ],
                          color: Guide.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bool isFavorit = toogleIsfavorated(
                                            _plantList[index].isFavorated);
                                        _plantList[index].isFavorated =
                                            isFavorit;
                                      });
                                    },
                                    icon: Icon(
                                      _plantList[index].isFavorated == true
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Guide.primaryColor,
                                    ),
                                    iconSize: 20,
                                  ),
                                )),
                            Positioned(
                              bottom: 40,
                              left: 10,
                              right: 10,
                              top: 10,
                              child: Image.asset(_plantList[index].imageURL),
                            ),
                            Positioned(
                                bottom: 15,
                                left: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _plantList[index].category,
                                      style: const TextStyle(
                                        color: Colors.white60,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      _plantList[index].plantName,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                                bottom: 15,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    _plantList[index].price.toString() + r"K",
                                    style: TextStyle(
                                      color: Guide.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                "Tanaman Baru",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _plantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailProduk(
                                      idPlant: _plantList[index].plantId),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child:
                            plantWidget(index: index, PlantList: _plantList));
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
