import 'package:get/get.dart';
import 'package:lekra/data/repositories/basic_repo.dart';

class BasicController extends GetxController implements GetxService {
  final BasicRepo basicRepo;
  BasicController({required this.basicRepo});

  int _demoPage = 0;
  int get demoPage => _demoPage;

  set demoPageSet(int page) {
    _demoPage = page;
    update();
  }

  void nextPage(int totalPages) {
    if (_demoPage < totalPages - 1) {
      _demoPage++;
      update();
    } else {
      // optional: go to main app screen or dashboard
      print("🎉 Onboarding complete!");
    }
  }
}
