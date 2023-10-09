import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/guide.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/ui/page/detail_produk_plant.dart';

class plantWidget extends StatelessWidget {
  const plantWidget({
    Key? key,
    required this.index,
    required this.PlantList,
  }) : super(key: key);

  final int index;
  final List<Plant> PlantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailProduk(
                  idPlant: PlantList[index].plantId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Guide.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Guide.primaryColor.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 80,
                      child: Image.asset(PlantList[index].imageURL),
                    )),
                Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(PlantList[index].category),
                        Text(
                          PlantList[index].plantName,
                          style: TextStyle(
                            color: Guide.secondColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                PlantList[index].price.toString() + r"K",
                style: TextStyle(
                  color: Guide.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
