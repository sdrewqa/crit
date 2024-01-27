import 'package:crit/features/booking_flow/presentation/hotel/widgets/hotel_about_buttons_widget.dart';
import 'package:crit/features/booking_flow/presentation/widgets/reuseable_peculiarities_cards_widget.dart';
import 'package:flutter/material.dart';

class HotelBottomInfoWidget extends StatelessWidget {
  const HotelBottomInfoWidget({super.key, required this.state});
  final state;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 8,bottom: 12),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Об отеле',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          ReuseablePerculiaritiesCardsWidget(
              isHotelScreen: true,
              state: state!.hotel!.aboutTheHotel.peculiarities),
          const SizedBox(
            height: 12,
          ),
          Text(state!.hotel!.aboutTheHotel.description),
          const SizedBox(
            height: 16,
          ),
          HotelAboutButtonsWidget()
        ],
      ),
    );
  }
}
