import 'package:dart_appwrite/dart_appwrite.dart';

class ServerAppwrite {
  ServerAppwrite._();

  static ServerAppwrite? _instance;
   Client client = Client();
   Account account = Account(Client());
   Users users = Users(Client());
   Databases databases = Databases(Client());
  Storage storage = Storage(Client());
  Functions functions = Functions(Client());
  Teams teams = Teams(Client());


  static ServerAppwrite get instance {
    return _instance ??= ServerAppwrite._();
  }

  Future<void> main(String host, String project, String key)async{
    client = Client()
        .setEndpoint(host) // Make sure your endpoint is accessible
        .setProject(project) // Your project ID
        .setKey(key)
      .setSelfSigned(status: true);


    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
    functions = Functions(client);
    teams = Teams(client);
    users = Users(client);
  }
}

