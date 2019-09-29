import 'package:backend/src/models/Events/event.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:backend/src/models/Events/topic.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';

HookedService _getTopicService(Angel app) {
  const key = 'topicService';

  // If there is already an existing singleton, return it.
  if (app.container.hasNamed(key)) {
    return app.container.findByName<HookedService>(key);
  }
  var mongoIp = app.configuration['mongo_db'].toString();
  var db = Db(mongoIp);
  db.open();
  var dbService = MongoService(db.collection("Topics"));
  var service = new HookedService(dbService);

  app.container.registerNamedSingleton(key, service);
  return service;
}

/// Returns fields to be inserted into the query type.
Iterable<GraphQLObjectField> topicQueryFields(Angel app) {
  var topicService = _getTopicService(app);

  // Here, we use special resolvers to read data from our store.
  return [
    field(
      'topics',
      listOf(topicGraphQLType),
      resolve: resolveViaServiceIndex(topicService),
    ),
    field(
      'topic',
      topicGraphQLType,
      resolve: resolveViaServiceRead(topicService),
      inputs: [
        GraphQLFieldInput('id', graphQLString.nonNullable()),
      ],
    ),
  ];
}

/// Returns fields to be inserted into the query type.
Iterable<GraphQLObjectField> topicMutationFields(Angel app) {
  var topicService = _getTopicService(app);
  var topicInputType = topicGraphQLType.toInputObject('EventInput');

  // This time, we use resolvers to modify the data in the store.
  return [
    field(
      'createTopic',
      topicGraphQLType,
      resolve: resolveViaServiceCreate(topicService),
      inputs: [
        GraphQLFieldInput('data', topicInputType.nonNullable()),
      ],
    ),
    field(
      'modifyTopic',
      eventGraphQLType,
      resolve: resolveViaServiceModify(topicService),
      inputs: [
        GraphQLFieldInput('id', graphQLString.nonNullable()),
        GraphQLFieldInput('data', topicInputType.nonNullable()),
      ],
    ),
  ];
}
