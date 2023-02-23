// @dart=2.9
class PaymentsModel {
  static const ID = 'id';
  static const CARID = 'carId';
  static const BOOKINGID = 'bookingId';
  static const AMOUNT = 'amount';
  static const STATUS = 'status';
  static const CREATED_AT = 'createdAt';

  String id;
  String bookingId;
  double amount;
  String status;
  int createdAt;
  String carId;

  PaymentsModel(
      {this.amount,
      this.carId,
      this.bookingId,
      this.createdAt,
      this.id,
      this.status});

  PaymentsModel.fromMap(Map data) {
    id = data[ID];
    createdAt = data[CREATED_AT];
    amount = data[AMOUNT];
    status = data[STATUS];
    carId = data[CARID];
    bookingId = data[BOOKINGID];
  }
}
