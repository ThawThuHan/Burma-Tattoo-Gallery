class ShopModal {
  String id;
  String name;
  String address;
  String city;

  ShopModal({this.id, this.name, this.address, this.city});

  factory ShopModal.fromJson(Map<String, dynamic> map) {
    return ShopModal(
      id: map['id'],
      name: map['shop_name'],
      address: map['address'],
      city: map['city'],
    );
  }
}
