library httpstub;

import 'dart:io';

class FakeHeaders implements HttpHeaders {
  Date date = null;
  Date expires = null;
  Date ifModifiedSince = null;
  String host = '';
  int port = 80;
  ContentType contentType = null;
  List<String> operator [](String name) => [];
  String value(String name) => null;
  add(String name, String value) => null;
  set(String name, Object value) => null;
  remove(String name, Object value) => null;
  removeAll(String name) => null;
  forEach(void f(String name, List<String> values)) => null;
  noFolding(String name) => null;
}



class FakeHttpRequest implements HttpRequest {

  int contentLength = 0;
  String protocolVersion = '1.1';
  String method = 'GET';
  InputStream inputStream;
  String uri = 'http://example.org';
  String path = '/';
  bool persistentConnection = true;
  Map<String, String> queryParameters = <String>{};
  String queryString = '';
  HttpHeaders headers = null;
  HttpConnectionInfo connectionInfo = null;
  List<Cookie> cookies = <Cookie>[];
  HttpSession session([init(HttpSession session)]) => null;

  set body(String value) {
    var s = new ListInputStream();
    var codes = value.charCodes;
    s.write(codes);
    s.markEndOfStream();
    inputStream = s;
    contentLength = codes.length;
  }
}


class FakeHttpResponse implements HttpResponse {

  int statusCode = 200;
  String reasonPhrase;
  List<Cookie> cookies = <Cookie>[];
  bool persistentConnection = true;

  DetachedSocket detachSocket() => null;
  HttpHeaders headers = new FakeHeaders();
  ListOutputStream outputStream = new ListOutputStream();
  HttpConnectionInfo connectionInfo = null;
  int get contentLength => outputStream.read().length;

}
