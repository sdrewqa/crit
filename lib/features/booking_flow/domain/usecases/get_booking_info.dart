import 'package:crit/core/usecase/usecase.dart';
import 'package:crit/features/booking_flow/domain/entities/booking_info.dart';
import 'package:crit/features/booking_flow/domain/repository/hotel_repository.dart';

class GetBookingInfoUseCase implements UseCase<BookingInfoEntity, void> {
  final IHotelRepository _hotelRepository;

  GetBookingInfoUseCase(this._hotelRepository);
  @override
  Future<BookingInfoEntity> call({void params}) {
    return _hotelRepository.getBookingInfo();
  }
}
