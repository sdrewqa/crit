import 'package:crit/features/booking_flow/presentation/booking/bloc/booking_hotel_info/remote/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingDataWidget extends StatelessWidget {
  const BookingDataWidget({super.key, required this.isAmountData});
  final bool isAmountData;
  @override
  Widget build(BuildContext context) {
    final RemoteBookingInfoBloc bookingInfoBloc =
        BlocProvider.of<RemoteBookingInfoBloc>(context);
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16, top: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: _buildColumn(isAmountData
            ? bookingInfoBloc.amountDataMap!
            : bookingInfoBloc.infoDataMap!));
  }

  Widget _buildColumn(Map<String, String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data.entries.map((entry) => _buildItem(entry)).toList(),
    );
  }

  Widget _buildItem(MapEntry<String, String> entry) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 136,
            child: Text(
              entry.key,
              style: const TextStyle(
                  fontSize: 16, color: Color.fromRGBO(130, 135, 150, 1)),
            ),
          ),
          isAmountData ? const Spacer() : const SizedBox(width: 39),
          Expanded(
            child: Text(
                entry.key == 'Кол-во ночей'
                    ? '${entry.value} ночей'
                    : entry.value,
                textAlign: isAmountData ? TextAlign.end : null,
                style: entry.key == 'К оплате'
                    ? const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(13, 114, 255, 1),
                        fontWeight: FontWeight.w600)
                    : const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}
