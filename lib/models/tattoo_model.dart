class TattooModel {
  String id;
  String categoryId;
  String categoryName;
  String imgUrl;
  String title;
  String thumbnail;

  TattooModel({
    this.id,
    this.imgUrl,
    this.title,
    this.thumbnail,
  });

  factory TattooModel.fromJson(Map<String, dynamic> map) {
    return TattooModel(
      id: map['name'],
      imgUrl: map['featured_image']['large'] is bool
          ? null
          : map['featured_image']['large'],
      title: map['title'],
      thumbnail: map['featured_image']['thumbnail'] is bool
          ? null
          : map['featured_image']['thumbnail'],
    );
  }
}
