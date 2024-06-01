import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HotelAboutButtonsWidget extends StatelessWidget {
  HotelAboutButtonsWidget({super.key});
  final List<AboutButtonModel> _buttons = <AboutButtonModel>[
    AboutButtonModel(
        icon: SvgPicture.asset('assets/icons/emoji-happy.svg'),
        title: 'Удобства',
        onClick: () {}),
    AboutButtonModel(
        icon: SvgPicture.asset('assets/icons/tick-square.svg'),
        title: 'Что включено',
        onClick: () {}),
    AboutButtonModel(
        icon: SvgPicture.asset('assets/icons/close-square.svg'),
        title: 'Что не включено',
        onClick: () {})
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(251, 251, 252, 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: double.infinity,
      height: 184,
      child: Container(
        padding: const EdgeInsets.all(0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _buttons.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 38,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      _buttons[index].icon,
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _buttons[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Самое необходимое',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    height: 1.15,
                                    color:
                                        const Color.fromRGBO(130, 135, 150, 1)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 24,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: IconButton(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 10),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 18,
                            ),
                            onPressed: _buttons[index].onClick,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(130, 135, 150, 0.15),
                  height: 1,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class AboutButtonModel {
  final String title;
  final SvgPicture icon;
  final VoidCallback onClick;

  AboutButtonModel(
      {required this.title, required this.icon, required this.onClick});
}
