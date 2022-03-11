class Post {
  String? id;
  String? card_number;
  String? date;
  String? name;
  String? surname;
  String? cvv_number;

  Post({
    required this.card_number,
    required this.date,
    required this.name,
    required this.surname,
    required this.cvv_number
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    card_number: json["card_number"],
    date: json["date"],
    name: json["name"],
    surname: json["surname"],
    cvv_number: json["cvv_number"],
  );

  Map<String, dynamic> toJson() => {
    "card_number": card_number,
    "date": date,
    "name": name,
    "surname": surname,
    "cvv_number": cvv_number,
  };
}
