import 'package:crit/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'room_event.dart';
part 'room_state.dart';

class RemoteRoomBloc extends Bloc<RemoteRoomsEvent, RemoteRoomsState> {
  final GetRoomsUseCase _getRoomsUseCase;
  RemoteRoomBloc(this._getRoomsUseCase) : super(const RemoteRoomsLoading()) {
    on<GetRooms>(onGetHotelRooms);
  }

  Future<void> onGetHotelRooms(
      GetRooms event, Emitter<RemoteRoomsState> emit) async {
    try {
      final dataState = await _getRoomsUseCase();
      if (dataState.isNotEmpty) {
        emit(RemoteRoomsDone(dataState));
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
