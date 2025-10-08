.PHONY: build_runner icon_generator run_app_prod run_app_dev build_apk_prod build_apk_dev
build_runner:
	dart run build_runner build --delete-conflicting-outputs
icon_generator:
	dart run flutter_launcher_icons
run_app_prod:
	flutter run --flavor production -t lib/main_production.dart
run_app_dev:
	flutter run --flavor staging -t lib/main_staging.dart
build_apk_prod:
	flutter build apk --no-tree-shake-icons --flavor production -t lib/main_production.dart
build_apk_dev:
	flutter build apk --no-tree-shake-icons --flavor staging -t lib/main_staging.dart