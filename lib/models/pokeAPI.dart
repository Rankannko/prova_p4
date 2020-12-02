// ignore: camel_case_types
class PokeAPI {
  int id;
  bool isDefault;
  String name;
  Sprites sprites;

  PokeAPI({this.id, this.isDefault, this.name, this.sprites});

  PokeAPI.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDefault = json['is_default'];
    name = json['name'];
    sprites = json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['name'] = this.name;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    return data;
  }
}

class Sprites {
  String frontDefault;

  Sprites({this.frontDefault});

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}