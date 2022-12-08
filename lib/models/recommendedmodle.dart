class RecommendedModle{
  int? _id;
  String _name='';
  int? _price;
  String _brand='';
  String _gender='';
  String _image='';
  String _country='';
  int? _isLike;


   getid(){
    return _id;
  }
   getisLike(){
    return _isLike;
  }
   getname(){
    return _name;
  }
  getbrand (){
    return  _brand;
  }
  getprice (){
    return _price;
  }
   getgender (){
    return _gender;
  }
   getimage(){
    return _image;
  }
  getcountry(){
    return _country;
  }

  setid(int id) {
    _id = id;
  }
  setname(String name) {
    _name = name;
  }
  setbrand(String brand) {
    _brand = brand;
  }
  setprice(int price) {
    _price = price;
  }
  setgender(String gender) {
    _gender = gender;
  }
  setimage(String image) {
    _image = image;
  }
  setcountry(String country) {
    _country = country;
  }
  setisLike(int isLike) {
    _isLike = isLike;
  }


  RecommendedModle.initiate();
  RecommendedModle(int id,String name, String brand, String image, String gender, int price,String country,int isLike){
    this._id=id;
    this._name=name;
    this._brand=brand;
    this._price=price;
    this._gender=gender;
    this._image=image;
    this._country=country;
    this._isLike=isLike;

  }
  Map<String,Object> toMap(){
    return {
      'id':getid(),
      'name':getname(),
      'brand':getbrand(),
      'image':getimage(),
      'gender':getgender(),
      'price':getprice(),
      'country':getcountry(),
      'isLike':getisLike(),
    };
  }
  RecommendedModle.fromMap(Map<String,dynamic>map){
    setid(map['id']);
    setname(map['name']);
    setbrand(map['brand']);
    setimage(map['image']);
    setgender(map['gender']);
    setprice(map['price']);
    setcountry(map['country']);
    setisLike(map['isLike']);
  }


}