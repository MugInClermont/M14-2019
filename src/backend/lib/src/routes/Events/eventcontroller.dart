import 'dart:async';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:graphql_server/graphql_server.dart';
import 'eventschema.dart';
import "package:angel_websocket/server.dart";


@Expose("/events")
class EventsController extends WebSocketController {

  EventsController(AngelWebSocket ws) : super(ws);

 @override
 Future<void> configureServer(Angel app) async {

   await super.configureServer(app);
// Create a [GraphQL] service instance, using our schema.
   var schema = createEventSchema(app);
   var graphQL = GraphQL(schema);

   var dbService = app.container.findByName<HookedService>("eventService");

   //dbService.afterAll(publish);
   dbService.afterCreated.listen(publish);
   dbService.afterUpdated.listen(publish);
   // Mount a handler that responds to GraphQL queries.
   app.all('/eventsGraph', graphQLHttp(graphQL));

   // In development, serve the GraphiQL IDE/editor.
   // More info: https://github.com/graphql/graphiql
   if (!app.environment.isProduction) {
     app.get('/eventsGraphi', graphiQL(graphQLEndpoint: "/eventsGraph"));
   }
 }

 FutureOr publish(HookedServiceEvent e) async {
   this.broadcast("events", e.data);
 }

  /*@Expose("/")
  Future getIndex(ResponseContext res) async {
    t
  }*/



}
