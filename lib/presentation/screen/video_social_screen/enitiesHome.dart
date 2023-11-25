import 'dart:async';

class enitiesHome{
  int _numberLike = 0;
  final _numberController =StreamController<int>();
  Stream<int> get numberStream => _numberController.stream;
  enitiesHome(){
    _numberController.sink.add(_numberLike);
  }
  void incrementNumber () {
    _numberLike ++;
    _numberController.sink.add(_numberLike);
  }
  void disposed(){
    _numberController.close();
  }
}