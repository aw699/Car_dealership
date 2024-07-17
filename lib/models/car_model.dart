import 'package:cardealership/models/item.dart';

class CarModel extends Item {
  final int rentPrice;

  CarModel({
    required this.rentPrice,
    required super.isFavoirte,
    required super.id,
    required super.image,
    required super.title,
    required super.price,
  });
}

List<CarModel> cars = [
  CarModel(
      price: 100000,
      rentPrice: 1000,
      id: 1,
      image: 'assets/images/mer_s.png',
      title: 'Mercedes S Class',
      isFavoirte: false),
  CarModel(
      id: 2,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
  CarModel(
      price: 100000,
      rentPrice: 1000,
      id: 3,
      image: 'assets/images/mer_gle.png',
      title: 'Mercedes GLE',
      isFavoirte: false),
  CarModel(
      id: 2,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
  CarModel(
      id: 2,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
  CarModel(
      id: 2,
      price: 100000,
      rentPrice: 1000,
      image: 'assets/images/mer_gls.png',
      title: ' Mercedes GLS',
      isFavoirte: false),
];
