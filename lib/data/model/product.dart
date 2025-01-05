import 'category.dart';

class Product {
  int? id;
  String? name;

  
  String? dateCreated;

  
  String? dateCreatedGMT;

  
  String? dateModified;

  
  String? dateModifiedGMT;
  String? type;
  String? status;
  bool? featured;

  
  String? catalogVisibility;
  String? description;

  
  String? shortDescription;
  String? sku;
  String? price;

  
  String? regularPrice;

  
  String? salePrice;

  
  String? priceHtml;

  
  bool? onSale;
  bool? purchasable;

  
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;

  
  int? downloadLimit;

  
  int? downloadExpiry;

  
  String? externalUrl;

  
  String? buttonText;

  
  String? taxStatus;

  
  String? taxClass;

  
  bool? manageStock;

  
  int? stockQuantity;

  
  String? stockStatus;
  String? backorders;

  
  bool? backordersAllowed;
  bool? backOrdered;

  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;

  bool? shippingRequired;

  bool? shippingTaxable;

  String? shippingClass;

  int? shippingClassId;

  bool? reviewsAllowed;

  String? averageRating;

  int? ratingCount;

  List<dynamic>? relatedIds;

  List<dynamic>? upsellIds;

  List<dynamic>? crossSellIds;

  int? parentId;

  String? purchaseNote;
  List<DcCategory>? categories;
  List<dynamic>? tags;
  List<DcImage>? images;
  List<Attribute>? attributes;

  List<dynamic>? defaultAttributes;

  Product({this.id,
    this.name,
    this.dateCreated,
    this.dateCreatedGMT,
    this.dateModified,
    this.dateModifiedGMT,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceHtml,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    
    this.externalUrl,
    
    this.buttonText,
    
    this.taxStatus,
    
    this.taxClass,
    
    this.manageStock,
    
    this.stockQuantity,
    
    this.stockStatus,
    this.backorders,
    
    this.backordersAllowed,
    this.backOrdered,
    
    this.soldIndividually,
    this.weight,
    this.dimensions,
    
    this.shippingRequired,
    
    this.shippingTaxable,
    
    this.shippingClass,
    
    this.shippingClassId,
    
    this.reviewsAllowed,
    
    this.averageRating,

    this.ratingCount,
    
    this.relatedIds,
    
    this.upsellIds,
    
    this.crossSellIds,
    
    this.parentId,
    
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    
    this.defaultAttributes});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      dateCreated: json['date_created'],
      dateCreatedGMT: json['date_created_gmt'],
      dateModified: json['date_modified'],
      dateModifiedGMT: json['date_modified_gmt'],
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      catalogVisibility: json['catalog_visibility'],
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      priceHtml: json['price_html'],
      onSale: json['on_sale'],
      purchasable: json['purchasable'],
      totalSales: json['total_sales'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      downloadLimit: json['download_limit'],
      downloadExpiry: json['download_expiry'],
      externalUrl: json['external_url'],
      buttonText: json['button_text'],
      taxStatus: json['tax_status'],
      taxClass: json['tax_class'],
      manageStock: json['manage_stock'],
      stockQuantity: json['stock_quantity'],
      stockStatus: json['stock_status'],
      backorders: json['backorders'],
      backordersAllowed: json['backorders_allowed'],
      backOrdered: json['backordered'],
      soldIndividually: json['sold_individually'],
      weight: json['weight'],
      dimensions: json['dimensions'] != null ? Dimensions.fromJson(
          json['dimensions']) : null,
      shippingRequired: json['shipping_required'],
      shippingTaxable: json['shipping_taxable'],
      shippingClass: json['shipping_class'],
      shippingClassId: json['shipping_class_id'],
      reviewsAllowed: json['reviews_allowed'],
      averageRating: json['average_rating'],
      ratingCount: json['rating_count'],
      parentId: json['parent_id'],
      purchaseNote: json['purchase_note'],
      categories: json['categories'] != null ? (json['categories'] as List)
          .map((i) => DcCategory.fromJson(i))
          .toList() : null,
      images: json['images'] != null ? (json['images'] as List).map((i) =>
          DcImage.fromJson(i)).toList() : null,
      attributes: json['attributes'] != null ? (json['attributes'] as List)
          .map((i) => Attribute.fromJson(i))
          .toList() : null,
    );
  }
}

class DcImage {
  int? id;

  String? dateCreated;

  String? dateCreatedGMT;

  String? dateModified;

  String? dateModifiedGMT;
  String? src;
  String? name;
  String? alt;

  DcImage(
      {this.id, this.dateCreated, this.dateCreatedGMT, this.dateModified, this.dateModifiedGMT, this.src, this.name, this.alt});

  factory DcImage.fromJson(Map<String, dynamic> json) {
    return DcImage(
      id: json['id'],
      dateCreated: json['date_created'],
      dateCreatedGMT: json['date_created_gmt'],
      dateModified: json['date_modified'],
      dateModifiedGMT: json['date_modified_gmt'],
      src: json['src'],
      name: json['name'],
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGMT;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGMT;
    data['src'] = src;
    data['name'] = name;
    data['alt'] = alt;
    return data;
  }
}

class Attribute {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attribute(
      {this.id, this.name, this.position, this.visible, this.variation, this.options});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      visible: json['visible'],
      variation: json['variation'],
      options: json['options'] != null
          ? List<String>.from(json['options'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    data['visible'] = visible;
    data['variation'] = variation;
    if (options != null) {
      data['options'] = options;
    }
    return data;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      length: json['length'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
