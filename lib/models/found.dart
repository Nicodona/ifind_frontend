import 'dart:convert';



List<Found> foundFromJson(String str) => List<Found>.from(json.decode(str).map((x) => Found.fromJson(x)));

class Found{
  final int? item_id;
  final int?  author;
  final String?  category;
  final String? description;
  final String? mention;
  final String? place_found;
  final String? updated;
  final String? image;

  Found({ this.item_id,  this.author,  this.description,  this.mention,  this.updated, this.category, this.image, this.place_found});

  factory Found.fromJson( Map<String, dynamic>json){
    return Found(
        item_id: json['item_id'],
        author: json['author'],
        mention: json['mention'],
        description: json['description'],
        category: json['category'],
        updated: json['updated'],
        image: json['image'],
      place_found: json['place_found']
    );
  }

}
