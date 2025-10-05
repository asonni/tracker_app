import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/quote/quote_provider.dart';

import 'workout_components.dart';

class WorkoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WorkoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SizedBox.shrink(),
      toolbarHeight: 224,
      flexibleSpace: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 56.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final quote = ref.watch(fetchQuoteProvider);
                    // ref.listen(fetchQuoteProvider, (previous, next) {
                    //   next.maybeWhen(
                    //     data: (data) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(content: Text('"${data.quote}"')),
                    //       );
                    //     },
                    //     orElse: () {},
                    //   );
                    // });
                    return quote.map(
                      data: (data) {
                        return Column(
                          children: [
                            Text(
                              '"${data.value.quote}"',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // final _ = ref.refresh(
                                //   fetchQuoteProvider,
                                // );
                                ref.invalidate(fetchQuoteProvider);
                              },
                              child: const Text('Refresh Quote'),
                            ),
                          ],
                        );
                      },
                      error: (error) {
                        return Text(
                          'Failed to load quote',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        );
                      },
                      loading: (_) {
                        return const CircularProgressIndicator();
                      },
                    );
                  },
                ),
                WorkoutCalendarGraph(),
              ],
            ),
          ),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: TabBar(
          tabs: [
            Tab(text: 'Upper Body'),
            Tab(text: 'Lower Body'),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 224);
}
