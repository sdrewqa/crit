import 'package:flutter/material.dart';

class ReuseableMinPriceWidget extends StatelessWidget {
  const ReuseableMinPriceWidget(
      {super.key, required this.state, required this.isHotel});
  final bool isHotel;
  final state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${isHotel ? 'от ${addSpaceEveryNCharacters(state!.minimalPrice.toString(), 3)}' : addSpaceEveryNCharacters(state!.price.toString(), 3)} ₽',
            style: const TextStyle(
              fontSize: 30,
              wordSpacing: -2,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            isHotel
                ? state!.priceForIt.toLowerCase()
                : state!.pricePer.toLowerCase(),
            style: const TextStyle(
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(130, 135, 150, 1)),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

String addSpaceEveryNCharacters(String text, int n) {
  String spacedText = '';

  for (int i = 0; i < text.length; i++) {
    spacedText += text[i];
    if ((i + 1) % n == 0 && i != text.length - 1) {
      spacedText += ' ';
    }
  }

  return spacedText;
}
