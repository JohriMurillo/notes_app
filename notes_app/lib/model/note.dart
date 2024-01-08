class Note {
  int? id;
  String title;
  String body;
  DateTime date;

  Note({
    this.id,
    required this.title,
    required this.body,
    required this.date,
  });

  Note copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? date,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      date: date ?? this.date,
    );
  }


Map<String, dynamic> toMap() {
  return {'id': id, 'title': title, 'body': body, 'date': date.toIso8601String()};
}
factory Note.fromMap(Map<String, dynamic> map) {
  return Note(
    id: map['id'],
    title: map['title'],
    body: map['body'],
    date: DateTime.parse(map['date']),
  );
}

}