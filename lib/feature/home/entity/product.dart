import 'package:equatable/equatable.dart';
class Product extends Equatable {
  const Product(
      {this.id,
        this.SKU,
        this.name,
        this.brandName,
        this.mainImage,
        this.price,
        this.sizes,
        this.stockStatus,
        this.colour,
        this.description});

  final String? id;
  final String? SKU;
  final String? name;
  final String? brandName;
  final String? mainImage;
  final Price? price;
  final List? sizes;
  final String? stockStatus;
  final String? colour;
  final String? description;

  factory Product.initial() {
    return const Product(
        id: "",
        SKU: "",
        name: "",
        brandName: "",
        mainImage: "",
        price:Price(),
        sizes:[],
        stockStatus:"",
        colour:"",
        description:""
    );
  }

  Product copyWith(
      {
         String? id,
         String? title,
         String? SKU,
         String? name,
         String? brandName,
         String? mainImage,
         Price? price,
         List? sizes,
         String? stockStatus,
         String? colour,
         String? description,
      }) {
    return Product(
        id: id ?? this.id,
        SKU: SKU ?? this.SKU,
        name: name ?? this.name,
        brandName: brandName ?? this.brandName,
        mainImage: mainImage ?? this.mainImage,
        price: price ?? this.price,
        sizes: sizes?? this.sizes,
        stockStatus: stockStatus?? this.stockStatus,
        colour: colour?? this.colour,
        description: description?? this.description
    );
  }

  factory Product.fromJson(json) {
    if (json != null) {
      return Product(
          id: json["id"],
          SKU: json["SKU"],
          name: json["name"],
          brandName: json["brandName"],
          mainImage: json["mainImage"],
          price:Price.fromJson(json["price"]),
          sizes: json["sizes"],
          stockStatus: json["stockStatus"],
          colour: json["colour"],
          description: json["description"]
      );
    } else {
      return const Product();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "SKU": SKU,
      "name": name,
      "brandName": brandName,
      "mainImage": mainImage,
      "price": price?.toJson(),
      "sizes":sizes,
      "stockStatus":stockStatus,
      "colour":colour,
      "description":description,
    };
  }

  @override
  List<Object?> get props => [
    id,
    SKU,
    name,
    brandName,
    mainImage,
    price,
    sizes,
    stockStatus,
    colour,
    description
  ];

  @override
  String toString() {
    return ''' ''';
  }
}

class Price{
  final String? amount;
  final String? currency;
  const Price({this.amount, this.currency});

  factory Price.fromJson(Map<String,dynamic>json)=>
      Price(
        amount: json['amount'],
        currency: json['currency'],

      );
  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "currency": currency,
    };
  }
}