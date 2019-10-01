# 2019 M14
---
# Backend
---
install dart
---
install angel
---
pub global activate angel_cli
angel init backend
choose graphQL project
---
run angel
dart --observe backend\bin\dev.dart
---
pub.bat get
---
dependencies:
  angel_mongo: ^2.0.0
  angel_websocket: ^2.0.0
---
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart'; 
---
var db = new Db('mongodb://localhost:27017/local');
  db.open();
  var dbService = new MongoService(db.collection("Todos"));
  app.container.registerNamedSingleton(key, dbService);
---
query
{
  todos {
    id,text,is_complete
  }
} 
---
mutation
{
  createTodo(
    data: {
      text:"Pierre"
    }){text}
}
---
Le backend en quelques chiffres
1 merge-request
---

---
generate models
pub run build_runner build
---

++++
vuejs 
https://refi64.com/vuedart/
---
pub global activate vue_cli 
vuedart create frontend 
pub get
---
pub global activate webdev 
webdev serve
<<<<<<< HEAD
---


+++
GCP 
---
Creation d'un projet dans GCP
....
And python
---
Installation du google cloud SDK
---
=======
>>>>>>> 0242f80321d13b5213d2034e96971852ef2efe18
