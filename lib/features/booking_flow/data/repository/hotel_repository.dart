import 'package:crit/features/booking_flow/data/data_sources/remote/hotel_data_source.dart';
import 'package:crit/features/booking_flow/data/models/hotel_info.dart';
import '../../domain/repository/hotel_repository.dart';
import '../models/booking_info.dart';
import '../models/room_info.dart';

class HotelRepositoryImpl implements IHotelRepository {
  final HotelDataSource _api;
  HotelRepositoryImpl(this._api);

  @override
  Future<HotelInfoModel> getHotelInfo() async {
    try {
      final response = await _api.getHotelInfo();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RoomInfoModel>> getRooms() async {
    try {
      final response = await _api.getRooms();
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookingInfoModel> getBookingInfo() async {
    try {
      final response = await _api.getBookingInfo();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
