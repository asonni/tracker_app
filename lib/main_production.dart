import 'main_common.dart';
import 'core/configs/config.dart';
import 'core/configs/flavor_config.dart';

void main() {
  final flavorConfig = FlavorConfig()
    ..title = 'Fitness Tracker'
    ..flavor = Flavor.production
    ..apiEndpoints = Config.productionApiEndpoints;
  mainCommon(flavorConfig);
}
