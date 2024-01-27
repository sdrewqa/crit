import 'package:crit/config/routes/app_routes.dart';
import 'package:crit/features/booking_flow/presentation/booking/bloc/booking_hotel_info/remote/booking_bloc.dart';
import 'package:crit/features/booking_flow/presentation/hotel/bloc/hotel_info/remote/hotel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_themes.dart';
import 'features/booking_flow/presentation/hotel/hotel_screen.dart';
import 'features/booking_flow/presentation/room_selection/bloc/hotel_rooms/remote/room_bloc.dart';
import 'injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteHotelInfoBloc>(
          create: (context) => sl()..add(const GetHotelInfo()),
        ),
        BlocProvider<RemoteRoomBloc>(
          create: (context) => sl()..add(GetRooms()),
        ),
        BlocProvider<RemoteBookingInfoBloc>(
          create: (BuildContext context) => sl()..add(const GetBookingInfo()),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HotelScreen()),
    );
  }
}
