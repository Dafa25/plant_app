import 'package:flutter/material.dart';
import 'package:plant_app/guide.dart';
import 'package:plant_app/ui/page/root_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const RootPage()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              CreatePage(
                image: "assets/images/plant-one.png",
                title: Guide.titleOne,
                descriptions: Guide.descriptionOne,
              ),
              CreatePage(
                image: "assets/images/plant-two.png",
                title: Guide.titleTwo,
                descriptions: Guide.descriptionTwo,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 1) {
                      currentIndex++;
                      if (currentIndex < 2) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const RootPage()));
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Guide.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Guide.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicator = [];

    for (int i = 0; i < 2; i++) {
      if (currentIndex == i) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String descriptions;
  const CreatePage({
    Key? key,
    required this.image,
    required this.title,
    required this.descriptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: Guide.primaryColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Text(
            descriptions,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Guide.secondColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
