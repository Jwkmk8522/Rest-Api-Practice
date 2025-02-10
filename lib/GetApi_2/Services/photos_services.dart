import 'dart:convert';
import 'package:api_practice/GetApi_2/Models/photos_modal.dart';
import 'package:http/http.dart' as http;

class PhotosServices {
  static final PhotosServices _instance = PhotosServices._internal();
  PhotosServices._internal();
  factory PhotosServices() {
    return _instance;
  }

  int page = 1;

  Future<PhotosModels> getPhotos() async {
    var response = await http.get(
      Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
      headers: {
        'Authorization':
            '4zjj6dG1Zz3ay2HsQMGGYzCA1OT3H8FSBeCqNY4ZVXQeDFbk0FxQftWj'
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return PhotosModels.fromJson(data);
    } else {
      return PhotosModels.fromJson(data);
    }
  }
//If we add load more button then we create empty list in which all images store then
//on reload the next images store in that
//   Future<PhotosModels> loadImage() async {
//     page++;
//     String url = 'https://api.pexels.com/v1/curated?per_page=5&page=$page';

//     var response = await http.get(
//       Uri.parse(url),
//       headers: {
//         'Authorization':
//             '4zjj6dG1Zz3ay2HsQMGGYzCA1OT3H8FSBeCqNY4ZVXQeDFbk0FxQftWj'
//       },
//     );
//     var data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       return PhotosModels.fromJson(data);
//     } else {
//       return PhotosModels.fromJson(data);
//     }
//   }
}
