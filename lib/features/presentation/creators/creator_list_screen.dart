import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'creator_card.dart';
import 'creator_provider.dart';


class CreatorListingScreen
    extends ConsumerStatefulWidget {
  const CreatorListingScreen({
    super.key,
  });

  @override
  ConsumerState<
      CreatorListingScreen> createState() =>
      _CreatorListingScreenState();
}

class _CreatorListingScreenState
    extends ConsumerState<
        CreatorListingScreen> {
  final scrollController =
  ScrollController();

  final searchController =
  TextEditingController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        ref.read(creatorProvider.notifier).loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final creators =
    ref.watch(creatorProvider);

    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Creators"),
      ),
      body: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.all(
                16),
            child: TextField(
              controller:
              searchController,
              decoration:
              const InputDecoration(
                prefixIcon:
                Icon(Icons.search),
                hintText:
                "Search Creator",
                border:
                OutlineInputBorder(),
              ),
            ),
          ),

          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection:
              Axis.horizontal,
              children: const [
                SizedBox(width: 10),

                Chip(
                  label:
                  Text("Travel"),
                ),

                SizedBox(width: 10),

                Chip(
                  label:
                  Text("Food"),
                ),

                SizedBox(width: 10),

                Chip(
                  label:
                  Text("Fashion"),
                ),

                SizedBox(width: 10),

                Chip(
                  label:
                  Text("Tech"),
                ),
              ],
            ),
          ),

          Expanded(
            child:
            creators.when(
              data: (data) {
                return RefreshIndicator(
                  onRefresh: () {
                    return ref
                        .read(
                      creatorProvider
                          .notifier,
                    )
                        .refreshData();
                  },
                  child:
                  ListView.builder(
                    controller:
                    scrollController,
                    itemCount:
                    data.length,
                    itemBuilder:
                        (_, index) {
                      return CreatorCard(
                        creator:
                        data[index],
                        onTap: () {
                          context.push('/creator-details',
                            extra: data[index],
                          );
                        },
                      );
                    },
                  ),
                );
              },

              loading: () {
                return Center(
                  child:
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor:
                    Colors.grey.shade100,
                    child: Container(
                      height: 100,
                      color: Colors.white,
                    ),
                  ),
                );
              },

              error:
                  (e, stack) {
                return Center(
                  child:
                  Text(e.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}