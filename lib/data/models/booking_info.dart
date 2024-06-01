import 'package:crit/domain/domain.dart';

class BookingInfoModel extends BookingInfoEntity {
  BookingInfoModel(
      {required super.id,
      required super.hotelName,
      required super.hotelAddress,
      required super.hotelRating,
      required super.ratingName,
      required super.departure,
      required super.arrivalCountry,
      required super.tourDateStart,
      required super.tourDateStop,
      required super.numberOfNights,
      required super.room,
      required super.nutrition,
      required super.tourPrice,
      required super.fuelCharge,
      required super.serviceCharge});

  factory BookingInfoModel.fromJson(Map<String, dynamic> json) {
    return BookingInfoModel(
      id: json['id'],
      hotelName: json['hotel_name'] ?? '',
      hotelAddress: json['hotel_adress'] ?? '',
      hotelRating: json['horating'] ?? '',
      ratingName: json['rating_name'] ?? '',
      departure: json['departure'] ?? '',
      arrivalCountry: json['arrival_country'] ?? '',
      tourDateStart: json['tour_date_start'] ?? '',
      tourDateStop: json['tour_date_stop'] ?? '',
      numberOfNights: json['number_of_nights'] ?? '',
      room: json['room'] ?? '',
      nutrition: json['nutrition'] ?? '',
      tourPrice: json['tour_price'] ?? '',
      fuelCharge: json['fuel_charge'] ?? '',
      serviceCharge: json['service_charge'] ?? '',
    );
  }
}
