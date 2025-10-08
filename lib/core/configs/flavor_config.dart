enum Flavor { production, staging }

class FlavorConfig {
  String title = '';
  Map<String, String> apiEndpoints = {};
  Flavor? flavor;
}
