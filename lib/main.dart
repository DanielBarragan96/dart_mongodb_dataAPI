import 'dart:convert';
import 'package:http/http.dart' as http;

import 'secrets.dart';

void main(List<String> arguments) async {
  var consultTestKey = CONSULT_TEST_KEY;
  var headers = {
    'Content-Type': 'application/json',
    'Access-Control-Request-Headers': '*',
    'api-key': consultTestKey
  };
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://data.mongodb-api.com/app/data-ptdjz/endpoint/data/v1/action/insertMany'));
  request.body = json.encode({
    "dataSource": "Cluster",
    "database": "generaldb",
    "collection": "obras",
    "documents": [
      {"NombreCliente": "PRUEBA"},
      {"NombreCliente": "PRUEBA"},
      {"NombreCliente": "PRUEBA"}
    ]
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }

  headers = {
    'Content-Type': 'application/json',
    'Access-Control-Request-Headers': '*',
    'api-key': consultTestKey
  };
  request = http.Request(
      'POST',
      Uri.parse(
          'https://data.mongodb-api.com/app/data-ptdjz/endpoint/data/v1/action/updateMany'));
  request.body = json.encode({
    "dataSource": "Cluster",
    "database": "generaldb",
    "collection": "obras",
    "filter": {"NombreCliente": "PRUEBA"},
    "update": {
      "\$set": {"age": 42}
    }
  });
  request.headers.addAll(headers);

  response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }

  headers = {
    'Content-Type': 'application/json',
    'Access-Control-Request-Headers': '*',
    'api-key': consultTestKey
  };
  request = http.Request(
      'POST',
      Uri.parse(
          'https://data.mongodb-api.com/app/data-ptdjz/endpoint/data/v1/action/find'));
  request.body = json.encode({
    "dataSource": "Cluster",
    "database": "generaldb",
    "collection": "obras",
    "filter": {
      "NombreCliente": {
        "\$in": ["2M", "PRUEBA"]
      }
    }
  });
  request.headers.addAll(headers);

  response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }

  headers = {
    'Content-Type': 'application/json',
    'Access-Control-Request-Headers': '*',
    'api-key': consultTestKey
  };
  request = http.Request(
      'POST',
      Uri.parse(
          'https://data.mongodb-api.com/app/data-ptdjz/endpoint/data/v1/action/deleteMany'));
  request.body = json.encode({
    "dataSource": "Cluster",
    "database": "generaldb",
    "collection": "obras",
    "filter": {"NombreCliente": "PRUEBA"}
  });
  request.headers.addAll(headers);

  response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
