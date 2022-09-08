// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        required this.id,
        required this.uid,
        required this.brand,
        required this.name,
        required this.alcohol,
    });

    int id;
    String uid;
    String brand;
    String name;
    String alcohol;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        uid: json["uid"],
        brand: json["brand"],
        name: json["name"],
        alcohol: json["alcohol"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "brand": brand,
        "name": name,
        "alcohol": alcohol,
    };
}
