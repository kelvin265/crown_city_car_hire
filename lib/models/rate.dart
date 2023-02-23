class Rate {
  String id;
  double rate;
  String driverId;

  Rate({this.id, this.rate, driverId});

  Rate.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    rate = data['rate'];
    driverId = data['driverId'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'driverId': driverId,
        'rate ': rate,
      };
}
