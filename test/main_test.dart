import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import '../main.dart';

class Response {
  void json(Map<String, dynamic> ret) {
    print(ret);
  }
}

Response response = Response();

class Request {
  Map<String, dynamic> variables;
  String payload;
  Request({required this.variables, required this.payload});
}

void main() async {
  var dotenv = DotEnv(includePlatformEnvironment: true)..load();

  Request request = Request(
    payload: jsonEncode(
      {
        "fileId": "64230a2594e30fb2ed20",
        "storageId": "worksheets",
        "collectionId": "chats",
        "databaseId": "congregai-me"
      },
    ),
    variables: {
      "API_ENDPOINT": dotenv['API_ENDPOINT'],
      "API_PROJECT_ID": dotenv['API_PROJECT_ID'],
      "API_KEY": dotenv['API_KEY'],
      "APPWRITE_FUNCTION_EVENT_DATA": ""
    },
  );

  await start(request, response);
}
