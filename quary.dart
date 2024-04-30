class Quary {
  late String next;
  Quary({required this.next});

  Quary.mapFrom(Map<String, dynamic> json) {
    next = json['next'];
  }
}
