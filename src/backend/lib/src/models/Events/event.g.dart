// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Event extends _Event {
  Event({this.id, this.createdAt, this.updatedAt, this.text, this.isComplete});

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
  final String text;

  @override
  final bool isComplete;

  Event copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String text,
      bool isComplete}) {
    return Event(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        text: text ?? this.text,
        isComplete: isComplete ?? this.isComplete);
  }

  bool operator ==(other) {
    return other is _Event &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.text == text &&
        other.isComplete == isComplete;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, text, isComplete]);
  }

  @override
  String toString() {
    return "Event(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, text=$text, isComplete=$isComplete)";
  }

  Map<String, dynamic> toJson() {
    return EventSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const EventSerializer eventSerializer = EventSerializer();

class EventEncoder extends Converter<Event, Map> {
  const EventEncoder();

  @override
  Map convert(Event model) => EventSerializer.toMap(model);
}

class EventDecoder extends Converter<Map, Event> {
  const EventDecoder();

  @override
  Event convert(Map map) => EventSerializer.fromMap(map);
}

class EventSerializer extends Codec<Event, Map> {
  const EventSerializer();

  @override
  get encoder => const EventEncoder();
  @override
  get decoder => const EventDecoder();
  static Event fromMap(Map map) {
    return Event(
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
        text: map['text'] as String,
        isComplete: map['is_complete'] as bool);
  }

  static Map<String, dynamic> toMap(_Event model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'text': model.text,
      'is_complete': model.isComplete
    };
  }
}

abstract class EventFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    text,
    isComplete
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String text = 'text';

  static const String isComplete = 'is_complete';
}

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Event].
final GraphQLObjectType eventGraphQLType =
    objectType('Event', isInterface: false, interfaces: [], fields: [
  field('id', graphQLString),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('text', graphQLString),
  field('is_complete', graphQLBoolean),
  field('idAsInt', graphQLInt)
]);
