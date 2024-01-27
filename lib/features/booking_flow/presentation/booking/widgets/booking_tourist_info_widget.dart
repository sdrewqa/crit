import 'package:crit/features/booking_flow/presentation/booking/bloc/booking_hotel_info/remote/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking_text_field_widget.dart';

class BookingTouristInfoWidget extends StatelessWidget {
  BookingTouristInfoWidget({
    super.key,
    required this.index,
    required this.dropDownfun,
    required this.textControllersList,
  });
  final int index;
  final VoidCallback dropDownfun;
  final List textControllersList;

  @override
  Widget build(BuildContext context) {
    final RemoteBookingInfoBloc bookingInfoBloc =
        BlocProvider.of<RemoteBookingInfoBloc>(context);
    return Column(
      children: [
        Container(
          height: 58,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(
                '${bookingInfoBloc.touristsCount[index]} турист',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(13, 114, 255, 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: InkWell(
                  onTap: () {
                    dropDownfun();
                  },
                  child: RotatedBox(
                      quarterTurns:
                          bookingInfoBloc.touristList[index].isOpened == true
                              ? 1
                              : 3,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Color.fromRGBO(13, 114, 255, 1),
                      )),
                ),
              )
            ],
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          child: Container(
            height: bookingInfoBloc.touristList[index].isOpened ? null : 0,
            color: const Color.fromARGB(255, 255, 255, 255),
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 4),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bookingInfoBloc.textFieldsLabels.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: BookingTextFieldWidget(
                      isPhoneTextField: false,
                      controller: textControllersList[index],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      label: bookingInfoBloc.textFieldsLabels[index],
                      keyboardType: TextInputType.text,
                    ),
                  );
                }),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
