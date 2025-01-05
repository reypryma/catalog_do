class DcReview {
  String? dateCreated;

  String? dateCreatedGMT;
  String? email;
  int? id;
  String? name;
  int? productId;
  int? rating;
  String? review;
  bool? verified;

  DcReview({this.dateCreated, this.dateCreatedGMT, this.email, this.id, this.name, this.productId, this.rating, this.review, this.verified});

  factory DcReview.fromJson(Map<String, dynamic> json) {
    return DcReview(
      dateCreated: json['date_created'],
      dateCreatedGMT: json['date_created_gmt'],
      email: json['email'],
      id: json['id'],
      name: json['name'],
      productId: json['product_id'],
      rating: json['rating'],
      review: json['review'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGMT;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    data['product_id'] = productId;
    data['rating'] = rating;
    data['review'] = review;
    data['verified'] = verified;
    return data;
  }
}
