import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipes/provider/ad_provider.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class AdsWidget extends StatefulWidget {
  const AdsWidget({super.key});

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();

  @override
  void initState() {
    super.initState();
    Provider.of<AdProvider>(context, listen: false).loadAds();
  }

  @override
  Widget build(BuildContext context) {
    final adProvider = Provider.of<AdProvider>(context);
    final ads = adProvider.adsList;

    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              carouselController: carouselControllerEx,
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                viewportFraction: 0.75,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, _) {
                  sliderIndex = index;

                  setState(() {});
                },
              ),
              items: ads.map((ad) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(ad.image!))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            ad.title.toString(),
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            Center(
              heightFactor: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselControllerEx.previousPage();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselControllerEx.nextPage();
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
        DotsIndicator(
          dotsCount: ads.length,
          position: sliderIndex,
          onTap: (position) async {
            await carouselControllerEx.animateToPage(position);
            sliderIndex = position;
            setState(() {});
          },
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}
