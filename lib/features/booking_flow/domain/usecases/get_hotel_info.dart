import 'package:crit/core/usecase/usecase.dart';
import 'package:crit/features/booking_flow/domain/entities/hotel_info.dart';
import 'package:crit/features/booking_flow/domain/repository/hotel_repository.dart';

class GetHotelInfoUseCase implements UseCase<HotelInfoEntity, void> {
  final IHotelRepository _hotelRepository;

  GetHotelInfoUseCase(this._hotelRepository);
  @override
  Future<HotelInfoEntity> call({void params}) {
    return _hotelRepository.getHotelInfo();
  }
}
