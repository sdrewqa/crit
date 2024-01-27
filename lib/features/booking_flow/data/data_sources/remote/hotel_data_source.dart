import 'package:crit/core/constants/constants.dart';
import 'package:crit/features/booking_flow/data/models/booking_info.dart';
import 'package:crit/features/booking_flow/data/models/hotel_info.dart';
import 'package:crit/features/booking_flow/data/models/room_info.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'hotel_data_source.g.dart';

@RestApi(baseUrl: hotelApiBaseUrl)
abstract class HotelDataSource {
  factory HotelDataSource(Dio dio) = _HotelDataSource;

  // Get hotel screen info
  @GET(
      '/75000507-da9a-43f8-a618-df698ea7176d') //путь до данных на экране «Отель»
  Future<HotelInfoModel> getHotelInfo();

  // Get rooms for room selection screen
  @GET(
      '/157ea342-a8a3-4e00-a8e6-a87d170aa0a2') //путь до данных на экране «Номер»
  Future<List<RoomInfoModel>> getRooms();

  // Get info for booking screen
  @GET(
      '/63866c74-d593-432c-af8e-f279d1a8d2ff') //путь до данных на экране Бронирование
  Future<BookingInfoModel> getBookingInfo();
}

// Retrofit fix
  // Future<List<RoomInfoModel>> getRooms() async {
  //   const _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{};
  //   final _headers = <String, dynamic>{};
  //   final Map<String, dynamic>? _data = null;
  //   final _result = await _dio
  //       .fetch<Map<String, dynamic>>(_setStreamType<List<RoomInfoModel>>(Options(
  //     method: 'GET',
  //     headers: _headers,
  //     extra: _extra,
  //   )
  //           .compose(
  //             _dio.options,
  //             '/157ea342-a8a3-4e00-a8e6-a87d170aa0a2',
  //             queryParameters: queryParameters,
  //             data: _data,
  //           )
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   List<RoomInfoModel> value = _result.data!['rooms']
  //       .map<RoomInfoModel>((dynamic i) => RoomInfoModel.fromJson(i as Map<String, dynamic>))
  //       .toList();
  //   return value;
  // }