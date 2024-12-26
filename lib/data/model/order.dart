class ShOrder {
  Item? item;

  String? orderDate;

  String? orderStatus;

  String? orderNumber;

  ShOrder({this.item, this.orderDate, this.orderStatus, this.orderNumber});

  factory ShOrder.fromJson(Map<String, dynamic> json) {
    return ShOrder(
      item: json['item'] != null ? Item.fromJson(json['item']) : null,
      orderDate: json['order_date'],
      orderStatus: json['order_status'],
      orderNumber: json['order_number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_date'] = orderDate;
    data['order_status'] = orderStatus;
    data['order_number'] = orderNumber;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }
}

class Item {
  int? id;
  String? name;
  String? price;
  String? image;

  Item({this.id, this.name, this.price, this.image});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
