// ignore_for_file: duplicate_ignore

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'todo.g.dart';

@immutable
@JsonSerializable()
class Todo extends Equatable {
  // ignore: public_member_api_docs
  Todo({
    required this.title,
    this.id,
    this.description = '',
    this.isCompleted = false,
  }) : assert(id == null || id.isNotEmpty, 'id cannot be empty');
  // ignore: flutter_style_todos
  /// The unique identifier of the todo.
  ///
  /// Cannot be empty.
  final String? id;

  // ignore: flutter_style_todos
  /// The title of the todo.
  ///
  /// Note that the title may be empty.
  final String title;

  // ignore: flutter_style_todos
  /// The description of the todo.
  ///
  /// Defaults to an empty string.
  final String description;

  // ignore: flutter_style_todos
  /// Whether the todo is completed.
  ///
  /// Defaults to `false`.
  final bool isCompleted;

  // ignore: flutter_style_todos, flutter_style_todos
  /// Returns a copy of this todo with the given values updated.
  ///
  /// {@macro todo}
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  /// Deserializes the given `Map<String, dynamic>` into a [Todo].
  static Todo fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  /// Converts this [Todo] into a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() => _$TodoToJson(this);

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
