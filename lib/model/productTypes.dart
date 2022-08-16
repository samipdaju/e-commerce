import 'package:nayakoseli/model/ratings.dart';

class Products {
  dynamic productName;
  dynamic rate;
  dynamic description;
  dynamic imageUrl;
  dynamic id;
  dynamic quantity;
   dynamic ratings;

  Products(
      {required this.imageUrl,
      required this.description,
      required this.productName,
      required this.rate,
      this.id,
      this.quantity,
       this.ratings});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.id,

      "productName": this.productName,
      "description": this.description,
      "imageUrl": this.imageUrl,
      "rate": this.rate,
      "quantity": this.quantity,
      "ratings":this.ratings
    };

    return map;
  }
}
