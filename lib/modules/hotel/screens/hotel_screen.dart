
import 'dart:io';
import 'package:crit/core/widgets/widgets.dart';
import 'package:crit/modules/hotel/bloc/hotel_bloc.dart';
import 'package:crit/modules/hotel/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RemoteHotelInfoBloc, RemoteHotelInfoState>(
      builder: (context, state) {
        if (state is RemoteHotelInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteHotelInfoDone) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Stack(children: [
                Positioned(
                  top: 200,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 100,
                    color: const Color.fromRGBO(246, 246, 249, 1),
                  ),
                ),
                Column(
                  children: [
                    const PreferredSize(
                        preferredSize: Size.fromHeight(44),
                        child: ReuseableAppBarWidget(
                          appTitle: 'Отель',
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    HotelTopInfoWidget(
                      state: state,
                    ),
                    HotelBottomInfoWidget(
                      state: state,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 12, bottom: 0),
                      child: SizedBox(
                        height: 48,
                        child: ReuseableButtonWidget(
                            text: 'К выбору номера',
                            onPressed: () =>
                                _onButtonPressed(context, state.hotel!.name)),
                      ),
                    ),
                    SizedBox(
                      height: Platform.isAndroid ? 15 : 0,
                    )
                  ],
                ),
              ]),
            ),
          );
        }
        return const SizedBox();
      },
    ));
  }

  void _onButtonPressed(BuildContext context, String hotelName) {
    Navigator.pushNamed(context, '/SelectRoom', arguments: hotelName);
  }
}
