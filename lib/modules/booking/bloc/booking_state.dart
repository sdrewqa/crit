part of 'booking_bloc.dart';

abstract class RemoteBookingInfoState extends Equatable {
  final BookingInfoEntity? bookingInfo;

  const RemoteBookingInfoState({this.bookingInfo});

  @override
  List<Object> get props => [bookingInfo!];
}

class RemoteBookingInfoLoading extends RemoteBookingInfoState {
  const RemoteBookingInfoLoading();
}

class RemoteBookingInfoDone extends RemoteBookingInfoState {
  const RemoteBookingInfoDone(BookingInfoEntity bookingInfo)
      : super(bookingInfo: bookingInfo);
}
