import 'dart:ffi';

class DataModel {
  String? title;
  String? address;
  String? ref;
  String? price;
  double? rating;
  String? image;
  String? location;

  DataModel(
      {
        this.title,
        this.address,
        this.ref,
        this.price,
        this.rating,
        this.image,
        this.location});

  DataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    address = json['address'];
    ref = json['ref'];
    price = json['price'];
    rating = json['rating'];
    image = json['image'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['address'] = this.address;
    data['ref'] = this.ref;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['image'] = this.image;
    data['location'] = this.location;
    return data;
  }
}
