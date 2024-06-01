import 'package:crit/core/usecase/usecase.dart';
import 'package:crit/domain/domain.dart';

class GetBookingInfoUseCase implements UseCase<BookingInfoEntity, void> {
  final IHotelRepository _hotelRepository;

  GetBookingInfoUseCase(this._hotelRepository);
  @override
  Future<BookingInfoEntity> call({void params}) {
    return _hotelRepository.getBookingInfo();
  }
}
