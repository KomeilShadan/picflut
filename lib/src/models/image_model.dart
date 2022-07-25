class ImageModel {
  late int id;
  late String url, title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}