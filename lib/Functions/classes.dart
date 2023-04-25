class Todo {
  final int? id;
  final String title;
  final String description;
  final String date;

  const Todo({required this.title, required this.description, required this.date, this.id});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    date: json['date']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'date': date
  };
}