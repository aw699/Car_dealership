import 'package:cardealership/models/item.dart';

class SparePartItem extends Item {
  SparePartItem(
      {required super.id,
      required super.image,
      required super.title,
      required super.price,
      required super.isFavoirte});
}

List<SparePartItem> sparePartsItems = [
  SparePartItem(
      id: 1,
      image: "assets/images/sparePart1.png",
      title: "Title",
      price: 350,
      isFavoirte: false),
  SparePartItem(
      id: 2,
      image: "assets/images/sparePart2.png",
      title: "Title",
      price: 350,
      isFavoirte: false),
  SparePartItem(
      id: 3,
      image: "assets/images/sparePart3.png",
      title: "Title",
      price: 350,
      isFavoirte: false),
  SparePartItem(
      id: 4,
      image: "assets/images/sparePart1.png",
      title: "Title",
      price: 350,
      isFavoirte: false)
];
