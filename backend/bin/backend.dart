import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  final server = await io.serve((request) {
    print(request);
    return Response(200, body: 'Corpo');
  }, '0.0.0.0', 4466);

  print('Online -  ${server.address.address}:${server.port}');
}
