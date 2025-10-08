import 'main_common.dart';
import 'core/configs/flavor_config.dart';

void main() {
  final flavorConfig = FlavorConfig()
    ..title = 'Fitness Tracker(Production)'
    ..flavor = Flavor.production
    ..apiEndpoints = {'baseUrl': 'https://your-production-api.com/api'};
  mainCommon(flavorConfig);
}
