// @dart=2.9
class Car {
  String id;
  String brand;
  String model;
  String price;
  String condition;
  List images;
  String status;

  Car(
      {this.id,
      this.brand,
      this.model,
      this.price,
      this.condition,
      this.images,
      this.status});

  Car.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    brand = data['brand'];
    model = data['model'];
    price = data['price'];
    condition = data['condition'];
    images = data['images'];
    status = data['status'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'price': price,
      'condition': condition,
      'images': images,
      'status': status,
    };
  }
}
