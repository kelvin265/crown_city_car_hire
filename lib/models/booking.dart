// @dart=2.9
class BookingModel {
  static const ID = "id";
  static const CLIENT_ID = "clientId";
  static const DATE_RANGE = "dateRange";
  static const COST = "cost";
  static const DATE = "date";
  static const CAR_ID = "carId";
  static const STATUS = "status";
  static const DRIVER_ID = "driverId";
  static const DRIVER_OPTION = "driverOptionId";

  String id;
  int dateRange;
  double cost;
  String clientId;
  String carId;
  String driverId = '';
  String driverOption = 'No';
  String status;
  String date;

  BookingModel(
      {this.carId,
      this.driverId,
      this.driverOption,
      this.id,
      this.clientId,
      this.date,
      this.cost,
      this.status,
      this.dateRange});

  BookingModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    dateRange = data[DATE_RANGE];
    cost = data[COST].toDouble();
    carId = data[CAR_ID];
    driverId = data[DRIVER_ID];
    driverOption = data[DRIVER_OPTION];
    date =
        DateTime.fromMillisecondsSinceEpoch(int.parse(data[DATE])).toString();
    clientId = data[CLIENT_ID];
    status = data[STATUS];
  }

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      CAR_ID: carId,
      DRIVER_ID: driverId,
      DRIVER_OPTION: driverOption,
      CLIENT_ID: clientId,
      DATE_RANGE: dateRange,
      COST: cost,
      DATE: date,
      STATUS: status,
    };
  }
}
