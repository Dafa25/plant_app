import 'package:flutter/material.dart';
import 'package:plant_app/guide.dart';
import 'package:plant_app/model/plant.dart';

class DetailProduk extends StatefulWidget {
  final int idPlant;
  const DetailProduk({super.key, required this.idPlant});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> isplantList = Plant.plantList;
    return Scaffold(
      body: Container(
        color: Guide.primaryColor.withOpacity(.5),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(.5),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Guide.primaryColor,
                        size: 24.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(.5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorit = toggleIsFavorated(
                                isplantList[widget.idPlant].isFavorated);
                            isplantList[widget.idPlant].isFavorated = isFavorit;
                          });
                        },
                        icon: Icon(
                          isplantList[widget.idPlant].isFavorated == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Guide.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                width: size.width * .8,
                height: size.height * .8,
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                        top: -20,
                        left: 0,
                        child: SizedBox(
                          height: 350,
                          child:
                              Image.asset(isplantList[widget.idPlant].imageURL),
                        )),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlantFeature(
                              title: 'Size',
                              plantFeature: isplantList[widget.idPlant].size,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PlantFeature(
                              title: 'Humadity',
                              plantFeature: isplantList[widget.idPlant]
                                  .humidity
                                  .toString(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PlantFeature(
                              title: 'Temperature',
                              plantFeature:
                                  isplantList[widget.idPlant].temperature,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
                  height: size.height * .5,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    isplantList[widget.idPlant].plantName,
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Guide.primaryColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                isplantList[widget.idPlant].rating.toString(),
                                style: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.black87,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                size: 26.0,
                                color: Color.fromARGB(255, 255, 188, 3),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Text(
                          isplantList[widget.idPlant].decription,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 18,
                            color: Guide.secondColor,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    bool isSelected = toggleIsSelected(
                        isplantList[widget.idPlant].isSelected);
                    isplantList[widget.idPlant].isSelected = isSelected;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: isplantList[widget.idPlant].isSelected == true
                      ? Colors.white
                      : Guide.primaryColor,
                ),
              ),
              decoration: BoxDecoration(
                color: isplantList[widget.idPlant].isSelected == true
                    ? Guide.primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Guide.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Beli Sekarang",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Guide.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Text(
          plantFeature,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
