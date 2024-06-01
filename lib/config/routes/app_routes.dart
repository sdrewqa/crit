import 'package:crit/modules/modules.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HotelScreen());
      case '/SelectRoom':
        return _materialRoute(RoomSelectionScreen(
          hotelName: settings.arguments as String,
        ));
      case '/Booking':
        return _materialRoute(BookingScreen());
      case '/Payment':
        return _materialRoute(const PaymentConfScreen());
      default:
        return _materialRoute(const HotelScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
