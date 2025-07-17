class ProfileModel{
  int? id;
  String? name;
  String? email;
  String? avatar;
  ProfileModel(this.name , this.email , this.avatar , this.id);
  ProfileModel.fromJson(Map<String, dynamic> data){
    id = data['id'];
    name = data['name'];
    email = data['email'];
    avatar = data['avatar'];
  }
  Map<String , dynamic> toMap(){
    return{
      'id' : id,
      'name': name,
      'email' : email,
      'role': "customer",
      'avatar' : avatar,
    };
  }
}