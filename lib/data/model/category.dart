class DcCategory {
  int? count;
  String? description;
  int? id;
  bool? isSelected;

  int? menuOrder;
  String? name;
  int? parent;
  String? slug;
  String? image;

  
  DcCategory({this.count, this.description, this.id, this.isSelected, this.menuOrder, this.name, this.parent, this.slug, this.image});

  factory DcCategory.fromJson(Map<String, dynamic> json) {
    return DcCategory(
        count: json['count'],
        description: json['description'],
        id: json['id'],
        isSelected: json['isSelected'],
        menuOrder: json['menu_order'],
        name: json['name'],
        parent: json['parent'],
        slug: json['slug'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['description'] = description;
    data['id'] = id;
    data['isSelected'] = isSelected;
    data['menu_order'] = menuOrder;
    data['name'] = name;
    data['parent'] = parent;
    data['slug'] = slug;
    return data;
  }
}
