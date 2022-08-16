class TrackOrderModel {
 late  bool visible ;
  late String orderId;
  late String name;
   late bool isShipped;
  late bool isPlaced;
  late bool isDelivered;
  late bool isPicked;

  TrackOrderModel(
      {required this.visible,
        required this.orderId,
        required this.name,
        required this.isShipped,
        required this.isPlaced,
        required this.isDelivered,
        required this.isPicked});

  TrackOrderModel.fromJson(Map<String, dynamic> json) {
    visible = json['visible'];
    orderId = json['orderId'];
    name = json['name'];
    isShipped = json['isShipped'];
    isPlaced = json['isPlaced'];
    isDelivered = json['isDelivered'];
    isPicked = json['isPicked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visible'] = this.visible;
    data['orderId'] = this.orderId;
    data['name'] = this.name;
    data['isShipped'] = this.isShipped;
    data['isPlaced'] = this.isPlaced;
    data['isDelivered'] = this.isDelivered;
    data['isPicked'] = this.isPicked;
    return data;
  }
}

List<TrackOrderModel> orderedList =[
  TrackOrderModel(
      visible: true,
      orderId: "123-45uji-9008",
      name: "Bag", isShipped: true,
      isPlaced: true,
      isDelivered: true,
      isPicked: true)
];


