part of 'booking_bloc.dart';
abstract class RemoteBookingInfoEvent {
  const RemoteBookingInfoEvent();
}

class GetBookingInfo extends RemoteBookingInfoEvent {
  const GetBookingInfo();
}


class AddTourist extends RemoteBookingInfoEvent {
  const AddTourist();
}
