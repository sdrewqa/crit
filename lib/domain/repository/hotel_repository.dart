import 'package:crit/domain/domain.dart';

abstract class IHotelRepository {
  Future<HotelInfoEntity> getHotelInfo();
  Future<List<RoomInfoEntity>> getRooms();
  Future<BookingInfoEntity> getBookingInfo();
}
