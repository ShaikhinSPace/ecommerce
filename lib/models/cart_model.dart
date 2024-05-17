import 'dart:convert';

class Cart {
  final List<CartElement>? carts;
  final int? total;
  final int? skip;
  final int? limit;

  Cart({
    this.carts,
    this.total,
    this.skip,
    this.limit,
  });

  Cart copyWith({
    List<CartElement>? carts,
    int? total,
    int? skip,
    int? limit,
  }) =>
      Cart(
        carts: carts ?? this.carts,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        carts: json["carts"] == null
            ? []
            : List<CartElement>.from(
                json["carts"]!.map((x) => CartElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "carts": carts == null
            ? []
            : List<dynamic>.from(carts!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class CartElement {
  final int? id;
  final List<CartProduct>? products;
  final int? total;
  final int? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  CartElement({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  CartElement copyWith({
    int? id,
    List<CartProduct>? products,
    int? total,
    int? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
  }) =>
      CartElement(
        id: id ?? this.id,
        products: products ?? this.products,
        total: total ?? this.total,
        discountedTotal: discountedTotal ?? this.discountedTotal,
        userId: userId ?? this.userId,
        totalProducts: totalProducts ?? this.totalProducts,
        totalQuantity: totalQuantity ?? this.totalQuantity,
      );

  factory CartElement.fromJson(Map<String, dynamic> json) => CartElement(
        id: json["id"],
        products: json["products"] == null
            ? []
            : List<CartProduct>.from(
                json["products"]!.map((x) => CartProduct.fromJson(x))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
      };
}

class CartProduct {
  final int? id;
  final String? title;
  final int? price;
  final int? quantity;
  final int? total;
  final double? discountPercentage;
  final int? discountedPrice;
  final String? thumbnail;

  CartProduct({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
    this.thumbnail,
  });

  CartProduct copyWith({
    int? id,
    String? title,
    int? price,
    int? quantity,
    int? total,
    double? discountPercentage,
    int? discountedPrice,
    String? thumbnail,
  }) =>
      CartProduct(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedPrice: json["discountedPrice"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedPrice": discountedPrice,
        "thumbnail": thumbnail,
      };
}
