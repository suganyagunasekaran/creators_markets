import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() =>
      _HomeScreenState();
}
class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeProvider) ==
                  ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              final current =
              ref.read(themeProvider);

              ref
                  .read(themeProvider.notifier)
                  .state =
              current == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
          ),
        ],
      ),

      body: ListView(
        padding:
        const EdgeInsets.all(
            16),
        children: [
          TextField(
            decoration:
            InputDecoration(
              prefixIcon:
              const Icon(
                  Icons.search),
              hintText:
              "Search Creators",
              border:
              OutlineInputBorder(
                borderRadius:
                BorderRadius
                    .circular(
                    12),
              ),
            ),
          ),

          const SizedBox(
              height: 20),

          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
              height: 10),

          Wrap(
            spacing: 10,
            children: const [
              Chip(
                label:
                Text("Food"),
              ),
              Chip(
                label:
                Text("Travel"),
              ),
              Chip(
                label:
                Text("Fashion"),
              ),
              Chip(
                label:
                Text("Tech"),
              ),
            ],
          ),

          const SizedBox(
              height: 30),

          const Text(
            "Top Creators",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
              height: 10),
          ElevatedButton(
            onPressed: () {
              context.push('/creators');
            },
            child: const Text(
              "Browse Creators",
            ),
          ),
          // Card(
          //   child: ListTile(
          //     leading:
          //     CircleAvatar(),
          //     title:
          //     Text("John"),
          //     subtitle:
          //     Text("120K Followers"),
          //     trailing:
          //     Icon(Icons.arrow_forward),
          // ),
          // ),

          // Card(
          //   child: ListTile(
          //     leading:
          //     CircleAvatar(),
          //     title:
          //     Text("Alex"),
          //     subtitle:
          //     Text("95K Followers"),
//),
          // ),

          const SizedBox(
              height: 30),

          const Text(
            "Ongoing Projects",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.bold,
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                "View Ongoing Projects",
              ),
              trailing:
              const Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                context.push('/ongoing-projects');
              },
            ),

          ),
        ],
      ),
    );
  }
}