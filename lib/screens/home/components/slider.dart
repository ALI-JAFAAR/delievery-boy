import 'package:alamal_center/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/provider/app.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: app.slidercount,
        itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
            ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: app.sliderwaiting == false
              ? CachedNetworkImage(
                  imageUrl: app.sliders[i].img,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  placeholder: (context, url) => Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : CircularProgressIndicator(
                  color: kPrimarycolor,
                ),
        ),
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          pageSnapping: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOut,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
