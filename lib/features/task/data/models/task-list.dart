const String taskTable = 'task';

class TaskFields {
  static final List<String> values = [
    id, title, description,empName
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String empName ='empName';
}

class Task {
  final int? id;
  final String title;
  final String description;
  final String empName;

  const Task({
    this.id,
    required this.title,
    required this.description,
    required this.empName,
  });

  Task copy({
    int? id,
    String? title,
    String? description,
    String? empName,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        empName:empName??this.empName
      );

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int?,
        title: json[TaskFields.title] as String,
        description: json[TaskFields.description] as String,
        empName:json[TaskFields.empName] as String
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.description: description,
        TaskFields.empName:empName
      };
}