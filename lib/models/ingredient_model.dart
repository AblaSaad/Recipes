class Ingredient {
  String? docId;
  String? name;
  List<String>? user_ids;

  Ingredient();

  Ingredient.fromJson(Map<String, dynamic> data, [String? id]) {
    docId = id;
    name = data['name'];
    user_ids = data['user_ids'] != null
        ? List<String>.from(data['user_ids'].map((e) => e.toString()))
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "user_ids": user_ids,
    };
  }
}
