class BannerModel {
  int id;
  String imageUrl;

  BannerModel({
    required this.id,
    required this.imageUrl,
  });

  BannerModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image_url'];
}
