import 'package:flutter/material.dart';
import 'package:plant_app/core.dart';
import 'package:plant_app/widget/profil_widget.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: const CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Guide.primaryColor.withOpacity(.5),
                  width: 7.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      "Monkey D Luffy",
                      style: TextStyle(color: Guide.secondColor, fontSize: 20),
                    ),
                    Text(
                      "mokey.d.luffy@gmail.com",
                      style: TextStyle(color: Guide.secondColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
