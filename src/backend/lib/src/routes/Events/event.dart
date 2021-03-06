import 'package:backend/src/models/Events/event.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';

HookedService _getEventService(Angel app) {
  const key = 'eventService';

  // If there is already an existing singleton, return it.
  if (app.container.hasNamed(key)) {
    return app.container.findByName<HookedService>(key);
  }


  var mongoIp = app.configuration['mongo_db'].toString();
  var db = Db(mongoIp);
  db.open();
  var dbService = MongoService(db.collection("Events"));
  var service = new HookedService(dbService);

  app.container.registerNamedSingleton(key, service);
  return service;
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
