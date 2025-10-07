import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'workout_components.dart';
import '../../../../../quote/presentation/controller/quote/quote_provider.dart';

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
                    final quote = ref.watch(quoteProvider);
                    // ref.listen(getQuoteProvider, (prev, next) {
                    //   next.maybeWhen(
                    //       data: (data) {
                    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //           content: Text('New quote: ${data.quote}'),
                    //         ));
                    //       },
                    //       orElse: () {});
                    // });
                    return quote.maybeWhen(
                      data: (data) {
                        return Column(
                          children: [
                            Text(
                              '"${data?.quote ?? "_"}"',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 19),
                            // ElevatedButton(
                            //     onPressed: () {
                            //       ref.invalidate(getQuoteProvider);
                            //     },
                            //     child: const Text("Refresh"))
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                const WorkoutCalendarGraph(),
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
  Size get preferredSize => const Size.fromHeight(260);
}
