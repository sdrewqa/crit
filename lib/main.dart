import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crit/config/routes/app_routes.dart';
import 'config/theme/app_themes.dart';
import 'injection_container.dart';
import 'modules/modules.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});//

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
          title: 'Crit',
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HotelScreen()),
    );
  }
}
