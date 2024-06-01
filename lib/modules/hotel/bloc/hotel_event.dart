part of 'hotel_bloc.dart';
abstract class RemoteHotelInfoEvent {
  const RemoteHotelInfoEvent();
}

class GetHotelInfo extends RemoteHotelInfoEvent {
  const GetHotelInfo();
}

