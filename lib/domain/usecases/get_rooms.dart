import 'package:crit/core/usecase/usecase.dart';
import 'package:crit/domain/domain.dart';

class GetRoomsUseCase implements UseCase<List<RoomInfoEntity>, void> {
  final IHotelRepository _hotelRepository;

  GetRoomsUseCase(this._hotelRepository);
  @override
  Future<List<RoomInfoEntity>> call({void params}) {
    return _hotelRepository.getRooms();
  }
}
