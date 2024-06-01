import 'package:crit/core/widgets/widgets.dart';
import 'package:crit/modules/booking/bloc/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingHotelInfoWidget extends StatelessWidget {
  const BookingHotelInfoWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    final RemoteBookingInfoBloc bookingInfoBloc =
        BlocProvider.of<RemoteBookingInfoBloc>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ReuseableRatingCardWidget(
            state: bookingInfoBloc.dataState, isHotelScreen: false),
        Text(
          bookingInfoBloc.dataState.hotelName,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          bookingInfoBloc.dataState.hotelAddress,
          style: const TextStyle(
              fontSize: 14,
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(13, 114, 255, 1)),
          textAlign: TextAlign.start,
        ),
      ]),
    );
  }
}
