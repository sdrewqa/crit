import 'package:crit/features/booking_flow/presentation/booking/bloc/booking_hotel_info/remote/booking_bloc.dart';
import 'package:crit/features/booking_flow/presentation/booking/widgets/booking_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCustomerInfoWidget extends StatelessWidget {
  const BookingCustomerInfoWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final RemoteBookingInfoBloc bookingInfoBloc =
        BlocProvider.of<RemoteBookingInfoBloc>(context);
    return Container(
        padding:
            const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Информация о покупателе',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                BookingTextFieldWidget(
                  isPhoneTextField: true,
                  controller: bookingInfoBloc.phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  label: 'Номер телефона',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 8,
                ),
                BookingTextFieldWidget(
                  isPhoneTextField: false,
                  controller: bookingInfoBloc.emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return '';
                    }

                    return null;
                  },
                  label: 'Почта',
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 14),
            )
          ],
        ));
  }
}
