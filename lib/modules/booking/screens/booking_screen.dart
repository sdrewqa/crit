import 'dart:async';
import 'dart:io';
import 'package:crit/core/widgets/widgets.dart';
import 'package:crit/modules/booking/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/booking_bloc.dart';

class BookingScreen extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  BookingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final RemoteBookingInfoBloc bookingInfoBloc =
        BlocProvider.of<RemoteBookingInfoBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToTop());
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(44),
          child: ReuseableAppBarWidget(
            appTitle: 'Бронирование',
          )),
      body: SafeArea(
        child: BlocBuilder<RemoteBookingInfoBloc, RemoteBookingInfoState>(
            builder: (context, state) {
          if (state is RemoteBookingInfoLoading) {}
          if (state is RemoteBookingInfoDone) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromRGBO(246, 246, 249, 1),
              child: SingleChildScrollView(
                reverse: true,
                controller: _controller,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const BookingHotelInfoWidget(),
                    const SizedBox(
                      height: 8,
                    ),
                    const BookingDataWidget(
                      isAmountData: false,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: const Column(
                        children: [
                          BookingCustomerInfoWidget(),
                          SizedBox(
                            height: 8,
                          ),
                          BookingTouristsListWidget()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const BookingDataWidget(
                      isAmountData: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 12, bottom: 0),
                      child: SizedBox(
                        height: 48,
                        child: ReuseableButtonWidget(
                            text: 'Оплатить ${bookingInfoBloc.total} ₽',
                            onPressed: () => _submit(context)),
                      ),
                    ),
                    SizedBox(
                      height: Platform.isAndroid ? 15 : 0,
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }

  void _submit(context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushNamed(context, '/Payment');
  }

  void _scrollToTop() {
    if (_controller.hasClients) {
      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: const Duration(microseconds: 1), curve: Curves.easeIn);
    } else {
      Timer(const Duration(microseconds: 2), () => _scrollToTop());
    }
  }
}
