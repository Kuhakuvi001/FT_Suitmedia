import 'package:suitmedia/configs/config_image.dart';

class UserModel {
  String name;
  String email;
  String image;
  String website;

  UserModel({
    this.name = "",
    this.email = "",
    this.image = AppImage.user2,
    this.website = "https://suitmedia.com/",
  });

  void convert(List datares, List<UserModel> listdata) {
    for (var item in datares) {
      listdata.add(UserModel(
        name: item['first_name'] + " " + item['last_name'],
        email: item['email'],
        image: item['avatar'],
      ));
    }
  }
}
