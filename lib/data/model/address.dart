class ShAddressModel {
  int? id;

  String? firstName;

  String? lastName;
  String? pinCode;
  String? city;
  String? state;
  String? addressType;
  String? address;

  String? phoneNumber;
  String? country;

  ShAddressModel({this.id, this.firstName, this.lastName, this.pinCode, this.city, this.state, this.addressType, this.address, this.phoneNumber, this.country});

  factory ShAddressModel.fromJson(Map<String, dynamic> json) {
    return ShAddressModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      pinCode: json['pinCode'],
      city: json['city'],
      state: json['state'],
      addressType: json['address_type'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['pinCode'] = pinCode;
    data['city'] = city;
    data['state'] = state;
    data['address_type'] = addressType;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['country'] = country;
    return data;
  }
}
