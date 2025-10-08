import 'main_common.dart';
import 'core/configs/flavor_config.dart';

void main() {
  final flavorConfig = FlavorConfig()
    ..title = 'Fitness Tracker(Staging)'
    ..flavor = Flavor.staging
    ..apiEndpoints = {'baseUrl': 'https://your-staging-api.com/api'};
  mainCommon(flavorConfig);
}
