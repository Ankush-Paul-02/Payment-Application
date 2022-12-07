import 'package:get/get.dart';
import 'package:payment_app/services/data_services.dart';

class DataController extends GetxController {
  var list = [].obs; // this list is observable
  final service = DataServices(); // instantiate
  var _loading = false.obs;

  get loading => _loading.value;
  // load data
  @override
  void onInit() {
    // data initialization
    _loadData();
    super.onInit();
  }

  get newList => list.where((e) => e["status"]).map((e) => e).toList();

  _loadData() async {
    _loading.value = false;
    try {
      var info = service.getUsers();
      // save info in our list
      list.addAll(await info);
    } catch (e) {
      print("Encounter error");
      print(e);
    } finally {
      _loading.value = true;
    }
  }
}
