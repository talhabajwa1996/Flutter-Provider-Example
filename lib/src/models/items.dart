class Items {
  String name;
  String brand;
  String price;
  String creationDate;
  String image;
  String discount;

  Items({
    this.name,
    this.brand,
    this.price,
    this.image,
    this.creationDate,
    this.discount,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      name: json['Name'] ?? '',
      brand: json['Brand'] ?? '',
      price: json['Price'] ?? '0',
      creationDate: json['Creation_Date'] ?? '',
      image: json['Image'] ?? '',
      discount: json['Discount'] ?? '',
    );
  }
}
