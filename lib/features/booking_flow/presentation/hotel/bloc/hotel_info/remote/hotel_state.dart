part of 'hotel_bloc.dart';

abstract class RemoteHotelInfoState extends Equatable {
  final HotelInfoEntity? hotel;

  const RemoteHotelInfoState({this.hotel});

  @override
  List<Object> get props => [hotel!];
}

class RemoteHotelInfoLoading extends RemoteHotelInfoState {
  const RemoteHotelInfoLoading();
}

class RemoteHotelInfoDone extends RemoteHotelInfoState {
  const RemoteHotelInfoDone(HotelInfoEntity hotel) : super(hotel: hotel);
}
