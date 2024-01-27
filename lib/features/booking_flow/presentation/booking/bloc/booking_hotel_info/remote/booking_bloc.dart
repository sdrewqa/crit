import 'package:crit/features/booking_flow/domain/usecases/get_booking_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/entities/booking_info.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class RemoteBookingInfoBloc
    extends Bloc<RemoteBookingInfoEvent, RemoteBookingInfoState> {
  // Fetch Data
  final GetBookingInfoUseCase _getBookingInfoUseCase;
  RemoteBookingInfoBloc(this._getBookingInfoUseCase)
      : super(const RemoteBookingInfoLoading()) {
    on<GetBookingInfo>(onGetBookingInfo);
  }
  late BookingInfoEntity dataState;
  Future<void> onGetBookingInfo(
      GetBookingInfo event, Emitter<RemoteBookingInfoState> emit) async {
    try {
      dataState = await _getBookingInfoUseCase();
      getMapData();
      if (dataState.hotelName.isNotEmpty) {
        emit(RemoteBookingInfoDone(dataState));
      } else {}
    } catch (e) {
      print(e);
    }
  }

  Map<String, String>? infoDataMap;
  int? total;
  Map<String, String>? amountDataMap;
  getMapData() {
    clearTouristList();
    infoDataMap = {
      'Вылет из': dataState.departure,
      'Страна, город': dataState.arrivalCountry,
      'Даты': '${dataState.tourDateStart}-${dataState!.tourDateStop}',
      'Кол-во ночей': dataState.numberOfNights.toString(),
      'Отель': dataState.hotelName,
      'Номер': dataState.room,
      'Питание': dataState.nutrition,
    };

    total =
        dataState!.tourPrice + dataState!.fuelCharge + dataState!.serviceCharge;

    amountDataMap = {
      'Тур': '${dataState.tourPrice} ₽',
      'Топливный сбор': '${dataState.fuelCharge} ₽',
      'Сервисный сбор': '${dataState.serviceCharge} ₽',
      'К оплате': '$total ₽',
    };
  }

  // Незнаю как сделать иначе, поставлю ограничение на макс 10 туристов
  final List<String> touristsCount = [
    'Первый',
    'Второй',
    'Третий',
    'Четвертый',
    'Пятый',
    'Шестой',
    'Седьмой',
    'Восьмой',
    'Девятый',
    'Десятый',
  ];

  final List<String> textFieldsLabels = [
    'Имя',
    'Фамилия',
    'Дата рождения',
    'Гражданство',
    'Номер загранпаспорта',
    'Срок действия загранпаспорта',
  ];

  List<TouristModel> touristList = [TouristModel.empty()];
  List<List<TextEditingController>> textControllersList = [];
  void addTourist() {
    touristList.add(TouristModel.empty());
  }

  void clearTouristList() {
    if (touristList.length > 1) {
      touristList.removeRange(1, touristList.length);
    }
  }

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
}

class TouristModel {
  final String? name;
  final String? lastName;
  final String? date;
  final String? nation;
  final String? numberP;
  final String? timeP;
  bool isOpened;

  TouristModel(
      {required this.name,
      required this.lastName,
      required this.date,
      required this.nation,
      required this.numberP,
      required this.timeP,
      required this.isOpened});
  factory TouristModel.empty() {
    return TouristModel(
      name: '',
      lastName: '',
      date: '',
      nation: '',
      numberP: '',
      timeP: '',
      isOpened: true,
    );
  }
}
