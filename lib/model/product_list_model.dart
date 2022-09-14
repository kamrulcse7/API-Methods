// class ProductListModel {
//   int? id;
//   String? name;
//   String? image;
//   int? isVisible;
//   int? isAvailable;
//   List<Null>? foodItemCategory;
//   List<Price>? price;
//   List<StockItems>? stockItems;

//   ProductListModel(
//       {this.id,
//       this.name,
//       this.image,
//       this.isVisible,
//       this.isAvailable,
//       this.foodItemCategory,
//       this.price,
//       this.stockItems});

//   ProductListModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     isVisible = json['is_visible'];
//     isAvailable = json['is_available'];
//     if (json['food_item_category'] != null) {
//       foodItemCategory = <Null>[];
//       json['food_item_category'].forEach((v) {
//         foodItemCategory!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['price'] != null) {
//       price = <Price>[];
//       json['price'].forEach((v) {
//         price!.add(new Price.fromJson(v));
//       });
//     }
//     if (json['stock_items'] != null) {
//       stockItems = <StockItems>[];
//       json['stock_items'].forEach((v) {
//         stockItems!.add(new StockItems.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['is_visible'] = this.isVisible;
//     data['is_available'] = this.isAvailable;
//     if (this.foodItemCategory != null) {
//       data['food_item_category'] =
//           this.foodItemCategory!.map((v) => v.toJson()).toList();
//     }
//     if (this.price != null) {
//       data['price'] = this.price!.map((v) => v.toJson()).toList();
//     }
//     if (this.stockItems != null) {
//       data['stock_items'] = this.stockItems!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Price {
//   int? originalPrice;
//   int? discountedPrice;
//   String? discountType;
//   int? fixedValue;
//   Null? percentOf;

//   Price(
//       {this.originalPrice,
//       this.discountedPrice,
//       this.discountType,
//       this.fixedValue,
//       this.percentOf});

//   Price.fromJson(Map<String, dynamic> json) {
//     originalPrice = json['original_price'];
//     discountedPrice = json['discounted_price'];
//     discountType = json['discount_type'];
//     fixedValue = json['fixed_value'];
//     percentOf = json['percent_of'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['original_price'] = this.originalPrice;
//     data['discounted_price'] = this.discountedPrice;
//     data['discount_type'] = this.discountType;
//     data['fixed_value'] = this.fixedValue;
//     data['percent_of'] = this.percentOf;
//     return data;
//   }
// }

// class StockItems {
//   int? quantity;

//   StockItems({this.quantity});

//   StockItems.fromJson(Map<String, dynamic> json) {
//     quantity = json['quantity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['quantity'] = this.quantity;
//     return data;
//   }
// }