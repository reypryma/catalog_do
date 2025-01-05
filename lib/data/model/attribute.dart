import 'category.dart';

class DcAttributes {
  List<Brand>? brand;
  List<DcSize>? size;
  List<DcColor>? color;
  List<DcCategory>? categories;

  DcAttributes({this.brand, this.size, this.color, this.categories});

  factory DcAttributes.fromJson(Map<String, dynamic> json) {
    return DcAttributes(
      brand: json['brand'] != null ? (json['brand'] as List).map((i) => Brand.fromJson(i)).toList() : null,
      size: json['size'] != null ? (json['size'] as List).map((i) => DcSize.fromJson(i)).toList() : null,
      color: json['color'] != null ? (json['color'] as List).map((i) => DcColor.fromJson(i)).toList() : null,
      categories: json['categories'] != null ? (json['categories'] as List).map((i) => DcCategory.fromJson(i)).toList() : null,
    );
  }
}

class DcColor {
  int? count;
  String? description;
  int? id;

  
  int? menuOrder;
  String? name;
  String? slug;
  bool isSelected = false;

  DcColor({this.count, this.description, this.id, this.menuOrder, this.name, this.slug});

  factory DcColor.fromJson(Map<String, dynamic> json) {
    return DcColor(
      count: json['count'],
      description: json['description'],
      id: json['id'],
      menuOrder: json['menu_order'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['description'] = description;
    data['id'] = id;
    data['menu_order'] = menuOrder;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class DcSize {
  int? count;
  String? description;
  int? id;

  
  int? menuOrder;
  String? name;
  String? slug;
  bool isSelected = false;

  
  DcSize({this.count, this.description, this.id, this.menuOrder, this.name, this.slug});

  factory DcSize.fromJson(Map<String, dynamic> json) {
    return DcSize(
      count: json['count'],
      description: json['description'],
      id: json['id'],
      menuOrder: json['menu_order'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['description'] = description;
    data['id'] = id;
    data['menu_order'] = menuOrder;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class Brand {
  String? name;
  String? slug;
  bool isSelected = false;

  Brand({this.name, this.slug});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
