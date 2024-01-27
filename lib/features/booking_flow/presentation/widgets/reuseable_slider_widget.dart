import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HotelSliderWidget extends StatefulWidget {
  const HotelSliderWidget({super.key, required this.state});
  final state;
  @override
  State<HotelSliderWidget> createState() => _HotelSliderWidgetState();
}

class _HotelSliderWidgetState extends State<HotelSliderWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 257,
          child: CarouselSlider(
            items: widget.state.imageUrls.map<Widget>((url) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: url,
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      height: 130,
                      width: 130,
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ));
            }).toList(),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              viewportFraction: 1,
              enlargeCenterPage: true,
              disableCenter: true,
              enableInfiniteScroll: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned.fill(
          bottom: 8,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 7.5, right: 7.5, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.state.imageUrls.length,
                  (index) => buildIndicator(index),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildIndicator(int index) {
    double opacity = 1.0 - (0.2 * (_currentIndex - index).abs());
    return Container(
      width: 7.0,
      height: 7.0,
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index
            ? const Color.fromARGB(255, 0, 0, 0).withOpacity(1.0)
            : opacity < 0.2
                ? Colors.grey.withOpacity(0.2)
                : const Color.fromARGB(255, 109, 109, 109).withOpacity(opacity),
      ),
    );
  }
}
