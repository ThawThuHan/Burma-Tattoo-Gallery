class CategoryModel {
  int id;
  String name;
  String imgUrl;

  CategoryModel({this.id, this.name, this.imgUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      id: map['id'],
      imgUrl: map['description'],
    );
  }
}
