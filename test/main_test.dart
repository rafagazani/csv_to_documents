import 'package:dotenv/dotenv.dart';

import '../main.dart';

class Response {
  void json(Map<String, dynamic> ret) {
    print(ret);
  }
}

Response response = Response();

class Request {
  Map<String, dynamic> env;
  Map<String, dynamic> payload;
  Request({required this.env, required this.payload});
}

void main() async {
  var dotenv = DotEnv(includePlatformEnvironment: true)..load();

  Request request = Request(
    payload: {
      "fileId": "64230a2594e30fb2ed20",
      "storageId": "worksheets",
      "collectionId": "chats",
      "databaseId": "congregai-me"
    },
    env: {
      "API_ENDPOINT": dotenv['API_ENDPOINT'],
      "API_PROJECT_ID": dotenv['API_PROJECT_ID'],
      "API_KEY": dotenv['API_KEY'],
      "APPWRITE_FUNCTION_EVENT_DATA": ""
    },
  );

  await start(request, response);
}
