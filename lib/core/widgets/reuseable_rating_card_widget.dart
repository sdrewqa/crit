import 'package:flutter/material.dart';

class ReuseableRatingCardWidget extends StatelessWidget {
  const ReuseableRatingCardWidget(
      {super.key, required this.state, required this.isHotelScreen});
  final dynamic state;
  final bool isHotelScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 199, 0, 0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: 15,
            color: Color.fromRGBO(255, 168, 0, 1),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '${isHotelScreen ? state!.rating : state!.hotelRating} ${state!.ratingName}',
            style: const TextStyle(
                fontSize: 16,
                wordSpacing: -1,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 168, 0, 1)),
          )
        ],
      ),
    );
  }
}
