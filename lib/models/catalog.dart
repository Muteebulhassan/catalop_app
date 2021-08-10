

class CatalogModel {
  //   static final catModel = CatalogModel()._singaltonClass();
  // CatalogModel._singaltonClass();

  // factory CatalogModel() => catModel;

  static List<Item> products;

  Item getById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  Item getByPosition(int pos) => products[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.name, this.id, this.price, this.desc, this.color, this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
