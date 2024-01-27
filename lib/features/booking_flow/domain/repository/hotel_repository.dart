import 'package:crit/features/booking_flow/domain/entities/booking_info.dart';
import 'package:crit/features/booking_flow/domain/entities/hotel_info.dart';
import 'package:crit/features/booking_flow/domain/entities/room_info.dart';

abstract class IHotelRepository {
  Future<HotelInfoEntity> getHotelInfo();
  Future<List<RoomInfoEntity>> getRooms();
  Future<BookingInfoEntity> getBookingInfo();
}
