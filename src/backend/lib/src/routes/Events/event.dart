import 'package:backend/src/models/Events/event.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';

MongoService _getEventService(Angel app) {
  const key = 'eventService';

  // If there is already an existing singleton, return it.
  if (app.container.hasNamed(key)) {
    return app.container.findByName<MongoService>(key);
  }


  var db = Db('mongodb://localhost:27017/local');
  db.open();
  var dbService = MongoService(db.collection("Events"));
  app.container.registerNamedSingleton(key, dbService);
  return dbService;
}

/// Returns fields to be inserted into the query type.
Iterable<GraphQLObjectField> eventQueryFields(Angel app) {
  var eventService = _getEventService(app);

  // Here, we use special resolvers to read data from our store.
  return [
    field(
      'events',
      listOf(eventGraphQLType),
      resolve: resolveViaServiceIndex(eventService),
    ),
    field(
      'event',
      eventGraphQLType,
      resolve: resolveViaServiceRead(eventService),
      inputs: [
        GraphQLFieldInput('id', graphQLString.nonNullable()),
      ],
    ),
  ];
}

/// Returns fields to be inserted into the query type.
Iterable<GraphQLObjectField> eventMutationFields(Angel app) {
  var eventService = _getEventService(app);
  var eventInputType = eventGraphQLType.toInputObject('EventInput');

  // This time, we use resolvers to modify the data in the store.
  return [
    field(
      'createEvent',
      eventGraphQLType,
      resolve: resolveViaServiceCreate(eventService),
      inputs: [
        GraphQLFieldInput('data', eventInputType.nonNullable()),
      ],
    ),
    field(
      'modifyEvent',
      eventGraphQLType,
      resolve: resolveViaServiceModify(eventService),
      inputs: [
        GraphQLFieldInput('id', graphQLString.nonNullable()),
        GraphQLFieldInput('data', eventInputType.nonNullable()),
      ],
    ),
  ];
}
