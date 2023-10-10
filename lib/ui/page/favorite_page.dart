import 'package:flutter/material.dart';
import 'package:plant_app/core.dart';
import 'package:plant_app/widget/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoriteProduckPlant;
  const FavoritePage({super.key, required this.favoriteProduckPlant});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.favoriteProduckPlant.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      child: Image.asset("assets/images/favorited.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tambahkan tanaman Kedalam Favorit",
                      style: TextStyle(
                        color: Guide.primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 30,
                ),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: widget.favoriteProduckPlant.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return plantWidget(
                          index: index, PlantList: widget.favoriteProduckPlant);
                    }),
              ));
  }
}
