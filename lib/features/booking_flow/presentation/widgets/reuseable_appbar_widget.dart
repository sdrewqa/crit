import 'package:flutter/material.dart';

class ReuseableAppBarWidget extends StatelessWidget {
  const ReuseableAppBarWidget({super.key, required this.appTitle});
  final String appTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 32,
      surfaceTintColor: Colors.transparent,
      title: Text(appTitle),
      leading: IconButton(
        icon: Icon(
          appTitle == 'Отель' ? null : Icons.arrow_back_ios_new,
          size: 17.5,
        ),
        onPressed: () => {Navigator.pop(context)},
      ),
    );
  }
}
