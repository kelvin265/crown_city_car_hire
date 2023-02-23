// @dart=2.9
import '../core.dart';

class FilterService {
  List<Filter> getFilterList() {
    return <Filter>[
      Filter(name: "Highest Price"),
      Filter(name: "Lowest Price"),
    ];
  }
}
