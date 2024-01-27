import 'package:crit/features/booking_flow/presentation/booking/payment_conf_screen.dart';
import 'package:crit/features/booking_flow/presentation/hotel/hotel_screen.dart';
import 'package:crit/features/booking_flow/presentation/room_selection/room_selection_screen.dart';
import 'package:flutter/material.dart';
import '../../features/booking_flow/presentation/booking/booking_screen.dart';

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
        return _materialRoute(PaymentConfScreen());
      default:
        return _materialRoute(const HotelScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
