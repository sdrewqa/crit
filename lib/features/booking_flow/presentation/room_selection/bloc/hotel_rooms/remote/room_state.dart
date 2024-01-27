part of 'room_bloc.dart';

abstract class RemoteRoomsState extends Equatable {
  final List<RoomInfoEntity>? rooms;

  const RemoteRoomsState({this.rooms});

  @override
  List<Object> get props => [rooms!];
}

class RemoteRoomsLoading extends RemoteRoomsState {
  const RemoteRoomsLoading();
}

class RemoteRoomsDone extends RemoteRoomsState {
  const RemoteRoomsDone(List<RoomInfoEntity> rooms) : super(rooms: rooms);
}
