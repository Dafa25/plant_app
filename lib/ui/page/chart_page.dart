import 'package:flutter/material.dart';
import 'package:plant_app/core.dart';
import 'package:plant_app/widget/plant_widget.dart';

class ChartPage extends StatefulWidget {
  final List<Plant> addToChart;
  const ChartPage({super.key, required this.addToChart});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.addToChart.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      child: Image.asset("assets/images/add-cart.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tambahkan tanaman kedalam keranjang",
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
                height: size.height * .8,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: widget.addToChart.length,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return plantWidget(
                                index: index, PlantList: widget.addToChart);
                          }),
                    ),
                    Column(
                      children: [
                        const Divider(
                          thickness: 2.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              r"70K",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Guide.primaryColor),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ));
  }
}
