import 'package:flutter/material.dart';

class ReuseablePerculiaritiesCardsWidget extends StatelessWidget {
  const ReuseablePerculiaritiesCardsWidget(
      {super.key, this.state, required this.isHotelScreen});
  final bool isHotelScreen;
  final dynamic state;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < state.length; i++)
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(251, 251, 252, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              state[i],
              style: const TextStyle(
                  color: Color.fromRGBO(130, 135, 150, 1),
                  fontWeight: FontWeight.w500),
            ),
          ),
        isHotelScreen
            ? const SizedBox()
            : Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(13, 114, 255, 0.1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Подробнее о номере',
                      style: TextStyle(
                          color: Color.fromRGBO(13, 114, 255, 1),
                          fontWeight: FontWeight.w500),
                    ),
                    RotatedBox(
                      quarterTurns: 2,
                      child: SizedBox(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Color.fromRGBO(13, 114, 255, 1),
                        ),
                      ),
                    )
                  ],
                )),
      ],
    );
  }
}
