
class CatagoryMainModel{
  String catagoryId;
  String catagoryName;
  List<dynamic> childCatagory;
  //Null comments;
  String image;
  int productTotal;

  CatagoryMainModel({
    this.catagoryId,
    this.catagoryName,
    this.childCatagory,
    this.image,
    this.productTotal
  });

  factory CatagoryMainModel.fromJson(Map<String, dynamic> json){
    return CatagoryMainModel(
      catagoryId: json['catagoryId'],
      catagoryName: json['catagoryName'],
      childCatagory: json['childCatagory'],
      image: json['image'],
      productTotal: json['productTotal']
    );
  }
}


class CatagoryListModel{
  List<dynamic> data;
  CatagoryListModel(this.data);

  factory CatagoryListModel.fromJson(dynamic json){
    
    return CatagoryListModel(
      json.map((i)=>CatagoryMainModel.fromJson(i)).toList()
    );
  }
}


////
// class CatagoryMainModel {
//   bool success;
//   List<CatagoryListModel> data;

//   CatagoryMainModel({this.success, this.data});

//   CatagoryMainModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = new List<CatagoryListModel>();
//       json['data'].forEach((v) {
//         data.add(new CatagoryListModel.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class CatagoryListModel {
//   String catagoryId;
//   String catagoryName;
//   bool childCatagory;
//   int productTotal;
//   String image;

//   CatagoryListModel(
//       {this.catagoryId,
//       this.catagoryName,
//       this.childCatagory,
//       this.productTotal,
//       this.image});

//   CatagoryListModel.fromJson(Map<String, dynamic> json) {
//     catagoryId = json['catagoryId'];
//     catagoryName = json['catagoryName'];
//     childCatagory = json['childCatagory'];
//     productTotal = json['productTotal'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['catagoryId'] = this.catagoryId;
//     data['catagoryName'] = this.catagoryName;
//     data['childCatagory'] = this.childCatagory;
//     data['productTotal'] = this.productTotal;
//     data['image'] = this.image;
//     return data;
//   }
// }
