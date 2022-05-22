




class Product{
  int id;
  String productName;
  int quantity;
  double price;
  String remarks;
  String images;
  String imagesUri;
  int categoryId;

//<editor-fold desc="Data Methods">

  Product({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.remarks,
    required this.images,
    required this.imagesUri,
    required this.categoryId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Product &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              productName == other.productName &&
              quantity == other.quantity &&
              price == other.price &&
              remarks == other.remarks &&
              images == other.images &&
              imagesUri == other.imagesUri &&
              categoryId == other.categoryId);

  @override
  int get hashCode =>
      id.hashCode ^
      productName.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      remarks.hashCode ^
      images.hashCode ^
      imagesUri.hashCode ^
      categoryId.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' id: $id,' +
        ' productName: $productName,' +
        ' quantity: $quantity,' +
        ' price: $price,' +
        ' remarks: $remarks,' +
        ' images: $images,' +
        ' imagesUri: $imagesUri,' +
        ' categoryId: $categoryId,' +
        '}';
  }

  Product copyWith({
    int? id,
    String? productName,
    int? quantity,
    double? price,
    String? remarks,
    String? images,
    String? imagesUri,
    int? categoryId,
  }) {
    return Product(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      remarks: remarks ?? this.remarks,
      images: images ?? this.images,
      imagesUri: imagesUri ?? this.imagesUri,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'productName': this.productName,
      'quantity': this.quantity,
      'price': this.price,
      'remarks': this.remarks,
      'images': this.images,
      'imagesUri': this.imagesUri,
      'categoryId': this.categoryId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      productName: map['productName'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      remarks: map['remarks'] as String,
      images: map['images'] as String,
      imagesUri: map['imagesUri'] as String,
      categoryId: map['categoryId'] as int,
    );
  }

//</editor-fold>
}