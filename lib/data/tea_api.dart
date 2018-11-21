import 'package:gongfu_timer/beans/tea.dart';

class TeaApi {

  final List<Tea> _teas = [
    new Tea(0, '0 Dragon Pearl Jasmine', 'Mo Li Long Zhu', 80, 0.06, 20, 5, 5),
    new Tea(1, '1 Dragon Pearl Jasmine', 'Mo Li Long Zhu', 80, 0.06, 20, 5, 5),
    new Tea(2, '2 Dragon Pearl Jasmine', 'Mo Li Long Zhu', 80, 0.06, 20, 5, 5),
  ];

  Future<List<Tea>> fetchTeas({int page = 1, String type = 'all'}) async {
    if(page > 1) {
      return [];
    }
    return this._teas;
  }

  Future<Tea> findTeaById(int id) async {
    Tea t = _teas[id];
    return t;
  }

}
