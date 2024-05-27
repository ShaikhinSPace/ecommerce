class Cart {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  Cart({
    this.carts,
    this.total,
    this.skip,
    this.limit,
  });

  Map<String, dynamic> toJson() {
    return {
      'carts': carts,
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      carts: (json['carts'] as List<dynamic>?)
          ?.map((e) => Carts.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }

  @override
  String toString() =>
      "Cart(carts: $carts,total: $total,skip: $skip,limit: $limit)";

  @override
  int get hashCode => Object.hash(carts, total, skip, limit);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart &&
          runtimeType == other.runtimeType &&
          carts == other.carts &&
          total == other.total &&
          skip == other.skip &&
          limit == other.limit;
}

class Carts {
  int? id;
  List<CartProduct>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products,
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }

  factory Carts.fromJson(Map<String, dynamic> json) {
    return Carts(
      id: json['id'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as double?,
      discountedTotal: json['discountedTotal'] as double?,
      userId: json['userId'] as int?,
      totalProducts: json['totalProducts'] as int?,
      totalQuantity: json['totalQuantity'] as int?,
    );
  }

  @override
  String toString() =>
      "Carts(id: $id,products: $products,total: $total,discountedTotal: $discountedTotal,userId: $userId,totalProducts: $totalProducts,totalQuantity: $totalQuantity)";

  @override
  int get hashCode => Object.hash(id, products, total, discountedTotal, userId,
      totalProducts, totalQuantity);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Carts &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          products == other.products &&
          total == other.total &&
          discountedTotal == other.discountedTotal &&
          userId == other.userId &&
          totalProducts == other.totalProducts &&
          totalQuantity == other.totalQuantity;
}

class CartProduct {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  CartProduct({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as double?,
      quantity: json['quantity'] as int?,
      total: json['total'] as double?,
      discountPercentage: json['discountPercentage'] as double?,
      discountedTotal: json['discountedTotal'] as double?,
      thumbnail: json['thumbnail'] as String?,
    );
  }

  @override
  String toString() =>
      "CartProduct(id: $id,title: $title,price: $price,quantity: $quantity,total: $total,discountPercentage: $discountPercentage,discountedTotal: $discountedTotal,thumbnail: $thumbnail)";

  @override
  int get hashCode => Object.hash(id, title, price, quantity, total,
      discountPercentage, discountedTotal, thumbnail);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProduct &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price &&
          quantity == other.quantity &&
          total == other.total &&
          discountPercentage == other.discountPercentage &&
          discountedTotal == other.discountedTotal &&
          thumbnail == other.thumbnail;
}
