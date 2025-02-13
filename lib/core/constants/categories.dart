class Categories {
  String name;
  String img;
  String id;

    Categories({required this.name, required this.id,
      required  this.img});

    static List<Categories> ct = [
      Categories(name: "Sport", id: "sport", img: ""),
      Categories(name: "Birthday", id: "birthday", img: ""),
      Categories(name: "Book Club", id: "book_club", img: ""),
      Categories(name: "Eating", id: "eating", img: ""),
      Categories(name: "Exhibition", id: "exhibition", img: ""),
      Categories(name: "Gaming", id: "gaming", img: ""),
      Categories(name: "Holiday", id: "holiday", img: ""),
      Categories(name: "Meeting", id: "meeting", img: ""),
      Categories(name: "WorkShop", id: "work_shop", img: ""),



    ];
}