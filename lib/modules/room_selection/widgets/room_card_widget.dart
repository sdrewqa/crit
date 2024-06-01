import 'package:crit/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RoomCardWidget extends StatelessWidget {
  const RoomCardWidget({super.key, this.state, required this.index});
  final dynamic state;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelSliderWidget(state: state.rooms![index]),
          const SizedBox(
            height: 8,
          ),
          Text(
            state.rooms![index].name,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          ReuseablePerculiaritiesCardsWidget(
              isHotelScreen: false, state: state.rooms![index].peculiarities),
          const SizedBox(
            height: 10,
          ),
          ReuseableMinPriceWidget(state: state.rooms![index], isHotel: false),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ReuseableButtonWidget(
                text: 'Выбрать номер',
                onPressed: () => _onRoomSelected(context)),
          )
        ],
      ),
    );
  }

  void _onRoomSelected(BuildContext context) {
    Navigator.pushNamed(context, '/Booking');
  }
}
