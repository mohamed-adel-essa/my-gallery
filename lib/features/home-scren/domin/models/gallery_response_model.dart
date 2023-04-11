class GalleryResponseModel {
  String? status;
  Images? images;
  String? message;

  GalleryResponseModel({this.status, this.images, this.message});

  GalleryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    images = json['data'] != null ? Images.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (images != null) {
      data['data'] = images!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Images {
  List<String>? images;

  Images({this.images});

  Images.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = images;
    return data;
  }
}
