class Product{

  String _name='';
  int? _price;
  String _brand='';
  String _gender='';
  String _image='';
  String _country='';

  String getname(){
    return _name;
  }
  String getbrand (){
    return  _brand;
  }
  getprice (){
    return _price;
  }
  String getgender (){
    return _gender;
  }
  String getimage(){
    return _image;
  }
  String getcountry(){
    return _country;
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

  Product.initiate();
  Product(String name, String brand, String image, String gender, int price,String country){
    this._name=name;
    this._brand=brand;
    this._price=price;
    this._gender=gender;
    this._image=image;
    this._country=country;
  }
  Map<String,Object> toMap(){
    return {
      'name':getname(),
      'brand':getbrand(),
      'image':getimage(),
      'gender':getgender(),
      'price':getprice(),
      'country':getcountry(),
    };
  }
  Product.fromMap(Map<String,dynamic>map){
    setname(map['name']);
    setbrand(map['brand']);
    setimage(map['image']);
    setgender(map['gender']);
    setprice(map['price']);
    setcountry(map['country']);
  }


}