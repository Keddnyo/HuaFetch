import '../../domain/model/wearable.dart';
import '../api/mapper/wearable_mapper.dart';
import '../api/wearable_api.dart';

class WearableRepository {
  const WearableRepository({required this.api});

  final WearableApi api;

  Future<List<Wearable>> getWearables() => api.getWearables().then(
        (wearableDtoList) => wearableDtoList
            .map(
              (wearableDto) => WearableMapper.toWearable(wearableDto),
            )
            .toList(),
      );
}
