import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:graphql_server/graphql_server.dart';
import "package:angel_websocket/server.dart";

import 'topicschema.dart';


@Expose("/topics")
class TopicsController extends WebSocketController {

  TopicsController(AngelWebSocket ws) : super(ws);

 @override
 Future<void> configureServer(Angel app) async {

   await super.configureServer(app);
// Create a [GraphQL] service instance, using our schema.
   var schema = createTopicSchema(app);
   var graphQL = GraphQL(schema);

   var dbService = app.container.findByName<HookedService>("topicService");

   dbService.afterCreated.listen(publish);
   dbService.afterUpdated.listen(publish);
   // Mount a handler that responds to GraphQL queries.
   app.all('/topicsGraph', graphQLHttp(graphQL));

   // In development, serve the GraphiQL IDE/editor.
   // More info: https://github.com/graphql/graphiqlopicS
     app.get('/topicsGraphi', graphiQL(graphQLEndpoint: "/topicsGraph"));
   }


 FutureOr publish(HookedServiceEvent e) async {
   this.broadcast("topics", e.data);
 }

}
