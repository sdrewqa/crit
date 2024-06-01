class HotelInfoEntity {
  int id;
  String name;
  String address;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  AboutTheHotelEntity aboutTheHotel;

  HotelInfoEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });
}

class AboutTheHotelEntity {
  String? description;
  List<String>? peculiarities;

  AboutTheHotelEntity({required this.description, required this.peculiarities});
}
