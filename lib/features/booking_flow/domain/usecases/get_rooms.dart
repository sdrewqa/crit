import 'package:crit/core/usecase/usecase.dart';
import 'package:crit/features/booking_flow/domain/entities/room_info.dart';
import 'package:crit/features/booking_flow/domain/repository/hotel_repository.dart';

class GetRoomsUseCase implements UseCase<List<RoomInfoEntity>, void> {
  final IHotelRepository _hotelRepository;

  GetRoomsUseCase(this._hotelRepository);
  @override
  Future<List<RoomInfoEntity>> call({void params}) {
    return _hotelRepository.getRooms();
  }
}
