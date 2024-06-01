import 'package:crit/core/usecase/usecase.dart';
import 'package:crit/domain/domain.dart';

class GetHotelInfoUseCase implements UseCase<HotelInfoEntity, void> {
  final IHotelRepository _hotelRepository;

  GetHotelInfoUseCase(this._hotelRepository);
  @override
  Future<HotelInfoEntity> call({void params}) {
    return _hotelRepository.getHotelInfo();
  }
}
