import 'dart:async';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
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

   // Mount a handler that responds to GraphQL queries.
   app.all('/eventsGraph', graphQLHttp(graphQL));

   // In development, serve the GraphiQL IDE/editor.
   // More info: https://github.com/graphql/graphiql
   if (!app.environment.isProduction) {
     app.get('/eventsGraphi', graphiQL(graphQLEndpoint: "/eventsGraph"));
   }
 }

  @Expose("/")
  Future getIndex(ResponseContext res) async {
    this.broadcast("test", {"menu": {
      "id": "file",
      "value": "File",
      "popup": {
        "menuitem": [
          {"value": "New", "onclick": "CreateNewDoc()"},
          {"value": "Open", "onclick": "OpenDoc()"},
          {"value": "Close", "onclick": "CloseDoc()"}
        ]
      }
    }});
  }



}
