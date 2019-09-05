import 'package:vue/vue.dart';

import 'package:frontend/my_component.dart';

@VueApp(el: '#app', components: [MyComponent])
class App extends VueAppBase {
}

App app;

void main() {
  app = App();
  app.create();
}
