import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:graphql_server/graphql_server.dart';
import 'eventschema.dart';

void configureServer(Angel app) async {
// Create a [GraphQL] service instance, using our schema.
  var schema = createEventSchema(app);
  var graphQL = GraphQL(schema);

  // Mount a handler that responds to GraphQL queries.
  app.all('/events', graphQLHttp(graphQL));

  // In development, serve the GraphiQL IDE/editor.
  // More info: https://github.com/graphql/graphiql
  if (!app.environment.isProduction) {
    app.get('/eventsGraphi', graphiQL());
  }

}
