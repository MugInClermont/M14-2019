// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Topic extends _Topic {
  Topic(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.title,
      List<Subject> Events})
      : this.Events = List.unmodifiable(Events ?? []);

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  final String title;

  @override
  final List<Subject> Events;

  Topic copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String title,
      List<Subject> Events}) {
    return Topic(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        title: title ?? this.title,
        Events: Events ?? this.Events);
  }

  bool operator ==(other) {
    return other is _Topic &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.title == title &&
        ListEquality<Subject>(DefaultEquality<Subject>())
            .equals(other.Events, Events);
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, title, Events]);
  }

  @override
  String toString() {
    return "Topic(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, title=$title, Events=$Events)";
  }

  Map<String, dynamic> toJson() {
    return TopicSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const TopicSerializer topicSerializer = TopicSerializer();

class TopicEncoder extends Converter<Topic, Map> {
  const TopicEncoder();

  @override
  Map convert(Topic model) => TopicSerializer.toMap(model);
}

class TopicDecoder extends Converter<Map, Topic> {
  const TopicDecoder();

  @override
  Topic convert(Map map) => TopicSerializer.fromMap(map);
}

class TopicSerializer extends Codec<Topic, Map> {
  const TopicSerializer();

  @override
  get encoder => const TopicEncoder();
  @override
  get decoder => const TopicDecoder();
  static Topic fromMap(Map map) {
    return Topic(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        title: map['title'] as String,
        Events: map['events'] is Iterable
            ? (map['events'] as Iterable).cast<Subject>().toList()
            : null);
  }

  static Map<String, dynamic> toMap(_Topic model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'title': model.title,
      'events': model.Events
    };
  }
}

abstract class TopicFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    title,
    Events
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String title = 'title';

  static const String Events = 'events';
}

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Topic].
final GraphQLObjectType topicGraphQLType =
    objectType('Topic', isInterface: false, interfaces: [], fields: [
  field('id', graphQLString),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('title', graphQLString),
  field('events', listOf(subjectGraphQLType)),
  field('idAsInt', graphQLInt)
]);
