class User{
  final Info _info;
  final List<Document> docs;

  User(this._info, this.docs);
}
class Info{
  final String name;
  final String email;
  final String img;

  Info(this.name, this.email, this.img);
}
class Document{

}