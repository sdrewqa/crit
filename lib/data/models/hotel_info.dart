import 'package:crit/domain/domain.dart';

class HotelInfoModel extends HotelInfoEntity {
  HotelInfoModel(
      {required super.id,
      required super.name,
      required super.address,
      required super.minimalPrice,
      required super.priceForIt,
      required super.rating,
      required super.ratingName,
      required super.imageUrls,
      required super.aboutTheHotel});

  factory HotelInfoModel.fromJson(Map<String, dynamic> json) {
    return HotelInfoModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['adress'] ?? '',
      minimalPrice: json['minimal_price'] ?? '',
      priceForIt: json['price_for_it'] ?? '',
      rating: json['rating'] ?? '',
      ratingName: json['rating_name'] ?? '',
      imageUrls: List<String>.from(json['image_urls'] ?? ''),
      aboutTheHotel: AboutTheHotelModel.fromJson(json['about_the_hotel'] ?? ''),
    );
  }
}

class AboutTheHotelModel extends AboutTheHotelEntity {
  AboutTheHotelModel(
      {required super.description, required super.peculiarities});

  factory AboutTheHotelModel.fromJson(Map<String, dynamic> json) {
    return AboutTheHotelModel(
      description: json['description'],
      peculiarities: List<String>.from(json['peculiarities']),
    );
  }
}
