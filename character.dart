class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late Origin origin;
  late Location location;
  late String image;

  Character.mapfrom(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    gender = json['gender'];
    origin = Origin.mapfrom(json['origin']);
    location = Location.mapfrom(json['location']);
    image = json['image'];
  }
}

//Origin Map
class Origin {
  late String name;
  late String url;
  Origin.mapfrom(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

//Location
class Location {
  late String name;
  late String url;

  Location.mapfrom(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
