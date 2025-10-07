import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/domain/entities/user.dart';
import '../../features/auth/presentation/controller/auth/auth_provider.dart';
import '../../features/auth/presentation/controller/auth/state/auth_state.dart';

// Extension for Ref
extension UserRefExtension on Ref {
  User? get watchCurrentUser =>
      watch(authProvider).mapOrNull(success: (success) => success.user);

  User? get readCurrentUser =>
      read(authProvider).mapOrNull(success: (success) => success.user);
}

// Extension for WidgetRef
extension UserWidgetRefExtension on WidgetRef {
  User? get watchCurrentUser =>
      watch(authProvider).mapOrNull(success: (success) => success.user);

  User? get readCurrentUser =>
      read(authProvider).mapOrNull(success: (success) => success.user);
}
