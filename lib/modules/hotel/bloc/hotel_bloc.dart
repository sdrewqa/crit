import 'package:crit/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'hotel_event.dart';
part 'hotel_state.dart';

class RemoteHotelInfoBloc
    extends Bloc<RemoteHotelInfoEvent, RemoteHotelInfoState> {
  final GetHotelInfoUseCase _getHotelInfoUseCase;
  RemoteHotelInfoBloc(this._getHotelInfoUseCase)
      : super(const RemoteHotelInfoLoading()) {
    on<GetHotelInfo>(onGetHotelInfo);
  }

  Future<void> onGetHotelInfo(
      GetHotelInfo event, Emitter<RemoteHotelInfoState> emit) async {
    try {
      final dataState = await _getHotelInfoUseCase();
      if (dataState.name.isNotEmpty) {
        emit(RemoteHotelInfoDone(dataState));
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
