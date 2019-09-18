import 'package:angel_framework/angel_framework.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'event.dart';


GraphQLSchema createEventSchema(Angel app) {
  var queryType = objectType(
    'EventQuery',
    fields: eventQueryFields(app),
  );

  var mutationType = objectType(
    'EventMutation',
    fields: eventMutationFields(app),
  );

  return graphQLSchema(
    queryType: queryType,
    mutationType: mutationType,
  );
}
