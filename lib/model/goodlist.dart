//Converter:https://javiercbk.github.io/json_to_dart/

class GoodListModel {
  bool success;
  List<GoodListData> data;

  GoodListModel({this.success, this.data});

  GoodListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<GoodListData>();
      json['data'].forEach((v) {
        data.add(new GoodListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodListData {
  String productId;
  String name;
  String price;
  String finalprice;
  String image;

  GoodListData({this.productId, this.name, this.price, this.finalprice, this.image});

  GoodListData.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    price = json['price'];
    finalprice = json['finalprice'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['finalprice'] = this.finalprice;
    data['image'] = this.image;
    return data;
  }
}
