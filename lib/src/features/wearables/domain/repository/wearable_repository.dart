import '../model/wearable.dart';

abstract class WearableRepository {
  Future<List<Wearable>> getWearables();
}
