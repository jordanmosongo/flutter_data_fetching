class JsonModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  JsonModel(this.userId, this.id, this.title, this.body);
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    JsonModel jsonModel =
        JsonModel(json['userId'], json['id'], json['title'], json['body']);
    return jsonModel;
  }
}
