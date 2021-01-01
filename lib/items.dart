final List<String> carouselImages = [
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
  'assets/images/4.jpg',
  'assets/images/5.png',
];

List<Catalogue> catalogueImages = [
  Catalogue(
      name: 'TRIBAL (aka Polynesian)', image: 'assets/catalogue/tribal.jpg'),
  Catalogue(
      name: 'JAPANESE (aka Irezumi)',
      image: 'assets/catalogue/japaneseakaIrezumi.jpg'),
  Catalogue(
      name: 'AMERICAN (TRADITIONAL)',
      image: 'assets/catalogue/americantraditional.jpg'),
  Catalogue(
      name: 'BURMESE (TRADITIONAL)',
      image: 'assets/catalogue/burmesetraditional.jpg'),
  Catalogue(name: 'REALISM', image: 'assets/catalogue/realism.jpg'),
  Catalogue(name: 'NEW SCHOOL', image: 'assets/catalogue/newschool.jpeg'),
  Catalogue(name: 'BIOMECHANICAL', image: 'assets/catalogue/biomechanical.jpg'),
  Catalogue(name: 'WATERCOLOR', image: 'assets/catalogue/watercolor.jpg'),
  Catalogue(name: 'TRASH POLKA', image: 'assets/catalogue/trashpolka.jpg'),
];

List<ShopLocation> shopLocation = [
  ShopLocation(
    name: 'BOOM Tattoo And Piercing',
    address:
        'NO.3, 6th Floor, 112 STREET, Bo Min Yaung Road ,Mingalar Taung Nyunt Townships',
    phone: '09-432 056 34',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'Heaven Tattoo Studio',
    address: 'Nga Moe Yeik 6th Street',
    phone: '09-970 907 460',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'KoGyiKyaw Tattoo Home',
    address: 'No.25 Yay, Yae Kyaw Rd',
    phone: '09-505 2788',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'Myanmar-K Tattoo',
    address: 'No. 526/B, Aung Tha Pyay Street, 1st',
    phone: '09-772 555 357',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'New Look MM tattoo studio',
    address: '4th Street Ward 3 South Okkalapa Yangon MM 11901',
    phone: '09-768 906 589',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'REBEL INK Tattoo',
    address: 'No.21 Pyin Ka Doe Street 34 Ward',
    phone: '09-430 884 06',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'Silver Needle Tattoo Studio',
    address: 'No. 1177, Bogyoke Street North Dagon Tsp',
    phone: '09-430 527 10',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'Blood tattoo studio',
    address: '1st floor, No.(780), Nga Moe Yeik 2nd street',
    phone: '09-955 544 244',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'Sixteen Tattoo Studio',
    address:
        'No. 93, 2nd Floor, Corner of Anawrahta Rd, Seikkanthar Street (Middle Block), Kyauktada Tsp',
    phone: '09-250 072 114',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'Ko Kyi Lay Tattoo Studio',
    address: 'No. (531/B), Zayyar street, Hledan Rd',
    phone: '09-799 859 680',
    city: 'Yangon',
  ),
  ShopLocation(
    name: 'Snowflake Tattoo Studio',
    address: 'Mone Tane St, Amarapura',
    phone: '09-964 789 126',
    city: 'Mandalay',
  ),
  ShopLocation(
    name: 'Mandalay Shan Tattoo',
    address: '31st St, Mandalay',
    phone: '09-441 026 797',
    city: 'Mandalay',
  ),
];

List<Shops> shopsCatagories = [
  Shops(name: "Yangon", image: "assets/images/yangon.jpg"),
  Shops(name: "Mandalay", image: "assets/images/mandalay.jpg"),
];

class Catalogue {
  String name;
  String image;

  Catalogue({this.name, this.image});
}

class Shops {
  String name;
  String image;
  Shops({this.name, this.image});
}

class ShopLocation {
  String name;
  String address;
  String phone;
  String city;
  ShopLocation({this.name, this.address, this.phone, this.city});
}
