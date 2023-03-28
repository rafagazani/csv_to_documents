import 'dart:async';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:csv_to_documents/server_appwrite/server_appwrite.dart';

//appwrite functions createDeployment --functionId=csv_to_documents --activate=true --entrypoint="main.dart" --code="."

Future start(final request, final response) async {
  await ServerAppwrite.instance
      .main(request.env['API_ENDPOINT'], request.env['API_PROJECT_ID'], request.env['API_KEY']);

  var payload = request.payload;

  var csv = await ServerAppwrite.instance.storage.getFileDownload(
      bucketId: payload['storageId'], fileId: payload['fileId']);
  final csvString = String.fromCharCodes(csv);

  final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);

  for (final csvRow in csvTable) {
    final document = await ServerAppwrite.instance.databases.createDocument(
      databaseId: payload['databaseId'],
      collectionId: payload['collectionId'],
      documentId: 'unique()',
      data: {
        "churchId": csvRow[0],
        "title": csvRow[1],
        "module": csvRow[2],
      },
    );
  }

  return response.json({"total": "${csvTable.length}"});
}
