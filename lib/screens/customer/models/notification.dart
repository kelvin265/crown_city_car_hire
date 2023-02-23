class NotificationModel {
  String id;
  String notification;
  String date;
  String clientId;
  String status;

  NotificationModel(
      {this.id, this.notification, this.date, this.clientId, this.status});

  NotificationModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    notification = data['notification'];
    date = data['date'];
    clientId = data['clientId'];
    status = data['status'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'notification': notification,
      'date': date,
      'clientId': clientId,
      'status': status,
    };
  }
}
