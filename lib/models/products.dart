class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final catalogProducts = [
  Item(
      id: "MyCodeWorks1",
      name: "Realme7",
      desc: "Realme 7 having high capability in terms of photo",
      price: 14500,
      color: "#33505a",
      image:
          "https://rukminim1.flixcart.com/image/416/416/kekadu80/mobile/y/9/m/realme-7-rmx2151-original-imafv73g5kwrbqrp.jpeg?q=70"),
  Item(
      id: "MyCodeWorks2",
      name: "Redmi10",
      desc:
          "Let go of the inhibitions and enjoy speed operation and flawless user experience with Redmi 10. ",
      price: 10499,
      color: "#33504a",
      image:
          "https://rukminim1.flixcart.com/image/416/416/l0tweq80/mobile/x/f/u/-original-imagcgtghym8theg.jpeg?q=70"),
];
