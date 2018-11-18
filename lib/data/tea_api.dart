import 'package:gongfu_timer/beans/tea.dart';

class TeaApi {

  Future<List<Tea>> fetchTeas({int page = 1, String type = 'all'}) async {
    if(page > 1) {
      return [];
    }
    return [
      new Tea('Dragon Pearl Jasmine', 'Mo Li Long Zhu', 80, 0.06, 20, 5, 5),
    ];
  }

}
