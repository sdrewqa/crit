part of 'room_bloc.dart';
abstract class RemoteRoomsEvent {
  const RemoteRoomsEvent();
}

class GetRooms extends RemoteRoomsEvent {
  GetRooms();
}
