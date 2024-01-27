import 'dart:io';

import 'package:crit/features/booking_flow/presentation/widgets/reuseable_button_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/reuseable_appbar_widget.dart';

class PaymentConfScreen extends StatelessWidget {
  const PaymentConfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(44),
            child: ReuseableAppBarWidget(
              appTitle: 'Заказ оплачен',
            )),
        bottomNavigationBar: SafeArea(
          // bottom: false,
          child: Container(
            margin: EdgeInsets.only(bottom: Platform.isAndroid ? 16 : 0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 48,
            child: ReuseableButtonWidget(
              onPressed: () {
                _onButtonPressed(context);
              },
              text: 'Супер!',
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Container(
                    width: 94,
                    height: 94,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(246, 246, 249, 1)),
                    child: Image.asset('assets/images/Party Popper.png'),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Ваш заказ принят в работу',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 88,
                  ),
                  const Spacer(),
                ]),
          ),
        ));
  }

  void _onButtonPressed(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }
}
