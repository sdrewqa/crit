import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'modules/modules.dart';

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
