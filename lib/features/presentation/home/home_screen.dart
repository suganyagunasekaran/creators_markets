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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Creator Hub",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              final current = ref.read(themeProvider);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// Welcome Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff6C63FF),
                      Color(0xff8E7BFF),
                    ],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back 👋",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Discover Amazing Creators",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Creators",
                  prefixIcon:
                  const Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// Categories
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _categoryCard(
                      Icons.restaurant,
                      "Food",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _categoryCard(
                      Icons.flight,
                      "Travel",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _categoryCard(
                      Icons.checkroom,
                      "Fashion",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _categoryCard(
                      Icons.computer,
                      "Tech",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// Top Creators
              const Text(
                "Top Creators",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(20),
                  color: Theme
                      .of(context)
                      .cardColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      child: Icon(
                        Icons.person,
                        size: 35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Explore Top Influencers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push(
                            '/creators',
                          );
                        },
                        child: const Text(
                          "Browse Creators",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Ongoing Projects
              const Text(
                "Ongoing Projects",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),
                child: ListTile(
                  contentPadding:
                  const EdgeInsets.all(16),
                  leading: Container(
                    padding:
                    const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue
                          .withOpacity(0.1),
                      borderRadius:
                      BorderRadius.circular(
                          12),
                    ),
                    child: const Icon(
                      Icons.work,
                      color: Colors.blue,
                    ),
                  ),
                  title: const Text(
                    "View Ongoing Projects",
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    "Track current creator collaborations",
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                  onTap: () {
                    context.push(
                      '/ongoing-projects',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryCard(IconData icon,
      String title,) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(16),
        color: Colors.blue.withOpacity(
          0.08,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

}