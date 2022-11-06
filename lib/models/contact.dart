class Contact{

 late String _username;
 late String _password;
 int _id=0;

 String getusername() {
  return _username;
  }
 String  getpassword(){
    return _password;
   }
  int getid(){
   return _id;
  }

  setusername(String username) {
  _username = username;
 }
  setpassword(String password) {
    _password = password;
  }
  setid(int id) {
    _id = id;
  }
  Contact();

Contact.fromMap(Map<String,dynamic>map){
 _username=map['username'];
_password=map['password'];
}


 Map<String,Object>toMap() {
 return{
   'username':getusername(),
   'password':getpassword(),
 };
}
}