class Rating {
  late int rating;
  late String name;
  late String imageUrl;
  late String review;

  Rating(
      {required this.rating,
      required this.name,
      required this.imageUrl,
      required this.review});

  Rating.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['review'] = this.review;
    return data;
  }
}

List<Rating> ratings = [
  Rating(
      rating: 2,
      name: "Samip",
      imageUrl: "assets/john.png",
      review: "Shit Product!"),
];
