import 'package:angel_serialize/angel_serialize.dart';
import 'package:backend/src/models/Events/subject.dart';
import 'package:graphql_schema/graphql_schema.dart';

import 'package:backend/src/models/Events/event.dart';
part 'topic.g.dart';

@graphQLClass
@serializable
abstract class _Topic extends Model {
  String get title;

  List<Subject> get Events;

}

