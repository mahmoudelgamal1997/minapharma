import 'dart:convert';

class HomeResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  HomeResponse(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    // rating =
    // json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson(HomeResponse music) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = music.id;
    data['title'] = music.title;
    data['price'] = music.price;
    data['description'] = music.description;
    data['category'] = music.category;
    data['image'] = music.image;
    if (this.rating != null) {
      data['rating'] = music.rating!.toJson();
    }
    return data;
  }

  static String encode(List<HomeResponse> musics) => json.encode(musics
        .map<Map<String, dynamic>>((music) => HomeResponse().toJson(music))
        .toList(),
  );

  static List<HomeResponse> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<HomeResponse>((item) => HomeResponse.fromJson(item))
          .toList();
}

class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
