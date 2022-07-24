import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  var pipeline = Pipeline()..addMiddleware(log());
  final server = await io.serve(pipeline.addHandler(_handle), '0.0.0.0', 4466);

  print('Online -  ${server.address.address}:${server.port}');
}

Middleware log() {
  return (handle) {
    return (request) async {
      // antes de executar
      print('solicitado: ${request.url}');
      final response = await handle(request);
      //depois de executar
      print('[${response.statusCode}] - Response');

      return response;
    };
  };
}

FutureOr<Response> _handle(Request request) {
  print(request);

  return Response(200, body: 'Corpo');
}
