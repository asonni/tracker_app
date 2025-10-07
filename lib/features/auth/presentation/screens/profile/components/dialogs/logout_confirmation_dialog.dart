import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controller/auth/auth_provider.dart';

Future<void> showLogoutConfirmationDialog(
  BuildContext context,
  WidgetRef ref,
) async {
  Future<void> signOut(BuildContext context, WidgetRef ref) async {
    await ref.read(authProvider.notifier).signOut();
  }

  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () => context.pop(),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text("Logout"),
            onPressed: () {
              context.pop();
              signOut(context, ref);
            },
          ),
        ],
      ),
    );
  }

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(child: const Text("Cancel"), onPressed: () => context.pop()),
        TextButton(
          child: const Text("Logout", style: TextStyle(color: Colors.red)),
          onPressed: () {
            context.pop();
            signOut(context, ref);
          },
        ),
      ],
    ),
  );
}
