import 'package:crit/data/data.dart';
import 'package:crit/domain/domain.dart';

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
