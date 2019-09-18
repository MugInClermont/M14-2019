import 'package:angel_serialize/angel_serialize.dart';
import 'package:graphql_schema/graphql_schema.dart';
part 'event.g.dart';

@graphQLClass
@serializable
abstract class _Event extends Model {
  String get text;

  bool get isComplete;
}
