import 'package:angel_serialize/angel_serialize.dart';
import 'package:graphql_schema/graphql_schema.dart';

part 'subject.g.dart';

@graphQLClass
abstract class Subject {
  String get text;
}
