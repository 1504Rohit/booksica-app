class Product {
  dynamic dimensions;
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic discount;
  dynamic thumbnail;
  dynamic photos;
  dynamic specifications;
  dynamic weight;
  dynamic mrp;
  dynamic stock;
  dynamic sold;
  dynamic conditionalPrices;
  dynamic subCategory;
  dynamic metaTags;
  dynamic author;
  dynamic disabled;
  dynamic returnable;
  dynamic cancellation;
  dynamic bestSeller;
  dynamic returnableDays;
  dynamic price;
  dynamic createdAt;
  dynamic updatedAt;

  Product({
    this.dimensions,
    this.id,
    this.title,
    this.description,
    this.discount,
    this.thumbnail,
    this.photos,
    this.specifications,
    this.weight,
    this.mrp,
    this.stock,
    this.sold,
    this.conditionalPrices,
    this.subCategory,
    this.metaTags,
    this.author,
    this.disabled,
    this.returnable,
    this.cancellation,
    this.bestSeller,
    this.returnableDays,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      dimensions: json['dimensions'] ?? 'Unknown Dimensions',
      id: json['_id'] ?? 'Unknown ID',
      title: json['title'] ?? 'Unknown Title',
      description: json['description'] ?? 'No Description',
      discount: json['discount'] ?? 0,
      thumbnail: json['thumbnail'] ?? 'No Thumbnail',
      photos: json['photos'] ?? [],
      specifications: json['specifications'] ?? [],
      weight: json['weight'] ?? 0.0,
      mrp: json['mrp'] ?? 0,
      stock: json['stock'] ?? 0,
      sold: json['sold'] ?? 0,
      conditionalPrices: json['conditionalPrices'] ?? [],
      subCategory: json['subCategory'] ?? 'No Subcategory',
      metaTags: json['metaTags'] ?? [],
      author: json['author'] ?? {},
      disabled: json['disabled'] ?? false,
      returnable: json['returnable'] ?? false,
      cancellation: json['cancellation'] ?? false,
      bestSeller: json['bestSeller'] ?? false,
      returnableDays: json['returnableDays'] ?? 0,
      price: json['price'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dimensions': dimensions ?? 'Unknown Dimensions',
      '_id': id ?? 'Unknown ID',
      'title': title ?? 'Unknown Title',
      'description': description ?? 'No Description',
      'discount': discount ?? 0,
      'thumbnail': thumbnail ?? 'No Thumbnail',
      'photos': photos ?? [],
      'specifications': specifications ?? [],
      'weight': weight ?? 0.0,
      'mrp': mrp ?? 0,
      'stock': stock ?? 0,
      'sold': sold ?? 0,
      'conditionalPrices': conditionalPrices ?? [],
      'subCategory': subCategory ?? 'No Subcategory',
      'metaTags': metaTags ?? [],
      'author': author ?? 'Unknown Author',
      'disabled': disabled ?? false,
      'returnable': returnable ?? false,
      'cancellation': cancellation ?? false,
      'bestSeller': bestSeller ?? false,
      'returnableDays': returnableDays ?? 0,
      'price': price ?? 0,
      'createdAt':
          createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      'updatedAt':
          updatedAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }
}
