import 'package:crit/domain/domain.dart';

class RoomInfoModel extends RoomInfoEntity {
  RoomInfoModel(
      {required super.id,
      required super.name,
      required super.price,
      required super.pricePer,
      required super.peculiarities,
      required super.imageUrls});
  factory RoomInfoModel.fromJson(Map<String, dynamic> json) {
    return RoomInfoModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      pricePer: json['price_per'],
      peculiarities: List<String>.from(json['peculiarities']),
      imageUrls: List<String>.from(json['image_urls']),
    );
  }
}
