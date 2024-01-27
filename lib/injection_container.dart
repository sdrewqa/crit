import 'package:crit/features/booking_flow/data/data_sources/remote/hotel_data_source.dart';
import 'package:crit/features/booking_flow/data/repository/hotel_repository.dart';
import 'package:crit/features/booking_flow/domain/repository/hotel_repository.dart';
import 'package:crit/features/booking_flow/domain/usecases/get_rooms.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/booking_flow/domain/usecases/get_booking_info.dart';
import 'features/booking_flow/domain/usecases/get_hotel_info.dart';
import 'features/booking_flow/presentation/booking/bloc/booking_hotel_info/remote/booking_bloc.dart';
import 'features/booking_flow/presentation/hotel/bloc/hotel_info/remote/hotel_bloc.dart';
import 'features/booking_flow/presentation/room_selection/bloc/hotel_rooms/remote/room_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<HotelDataSource>(HotelDataSource(sl()));
  sl.registerSingleton<IHotelRepository>(HotelRepositoryImpl(sl()));
  sl.registerSingleton<GetHotelInfoUseCase>(GetHotelInfoUseCase(sl()));
  sl.registerSingleton<RemoteHotelInfoBloc>(RemoteHotelInfoBloc(sl()));
  sl.registerSingleton<GetRoomsUseCase>(GetRoomsUseCase(sl()));
  sl.registerSingleton<RemoteRoomBloc>(RemoteRoomBloc(sl()));
  sl.registerSingleton<GetBookingInfoUseCase>(GetBookingInfoUseCase(sl()));
  sl.registerSingleton<RemoteBookingInfoBloc>(RemoteBookingInfoBloc(sl()));
}
