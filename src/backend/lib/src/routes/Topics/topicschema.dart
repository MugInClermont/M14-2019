import 'package:angel_framework/angel_framework.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'topic.dart';


GraphQLSchema createTopicSchema(Angel app) {
  var queryType = objectType(
    'TopicQuery',
    fields: topicQueryFields(app),
  );

  var mutationType = objectType(
    'TopicMutation',
    fields: topicMutationFields(app),
  );

  return graphQLSchema(
    queryType: queryType,
    mutationType: mutationType,
  );
}
