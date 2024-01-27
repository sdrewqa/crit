import 'package:crit/features/booking_flow/presentation/booking/bloc/booking_hotel_info/remote/booking_bloc.dart';
import 'package:crit/features/booking_flow/presentation/booking/widgets/booking_tourist_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingTouristsListWidget extends StatefulWidget {
  const BookingTouristsListWidget({
    super.key,
  });
  @override
  State<BookingTouristsListWidget> createState() =>
      _BookingTouristsListWidgetState();
}

class _BookingTouristsListWidgetState extends State<BookingTouristsListWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RemoteBookingInfoBloc>(context).clearTouristList();
  }
  
  @override
  Widget build(BuildContext context) {
    final RemoteBookingInfoBloc bookingInfoBloc =
        BlocProvider.of<RemoteBookingInfoBloc>(context);
    return Column(
      children: [
        ListView.builder(
            itemCount: bookingInfoBloc.touristList.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              bookingInfoBloc.textControllersList.add(List.generate(
                6,
                (_) => TextEditingController(),
              ));
              return BookingTouristInfoWidget(
                index: index,
                dropDownfun: () {
                  setState(() {
                    bookingInfoBloc.touristList[index].isOpened =
                        !bookingInfoBloc.touristList[index].isOpened;
                  });
                },
                textControllersList: bookingInfoBloc.textControllersList[index],
              );
            })),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Text(
                'Добавить туриста',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(13, 114, 255, 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: InkWell(
                  onTap: () {
                    if (bookingInfoBloc.touristList.length > 9) return;
                    FocusScope.of(context).unfocus();
                    setState(() {
                      bookingInfoBloc.addTourist();
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 20,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
