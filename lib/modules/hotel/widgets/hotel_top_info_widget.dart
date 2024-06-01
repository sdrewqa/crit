import 'package:crit/core/widgets/reuseable_rating_card_widget.dart';
import 'package:crit/core/widgets/reuseable_slider_widget.dart';
import 'package:crit/core/widgets/reuseable_min_price_widget.dart';
import 'package:flutter/material.dart';

class HotelTopInfoWidget extends StatelessWidget {
  final state;
  const HotelTopInfoWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SLIDER
          HotelSliderWidget(state: state.hotel),
          // Rating
          ReuseableRatingCardWidget(
            state: state!.hotel,
            isHotelScreen: true,
          ),
          Text(
            state!.hotel!.name,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            state!.hotel!.address,
            style: const TextStyle(
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(13, 114, 255, 1)),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          ReuseableMinPriceWidget(state: state!.hotel, isHotel: true),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
