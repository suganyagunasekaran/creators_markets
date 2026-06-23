import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/creator_model.dart';


class CreatorDetailScreen extends StatelessWidget {
  final CreatorModel creator;

  const CreatorDetailScreen({
    super.key,
    required this.creator,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Creator Profile",
        ),
      ),
      body: ListView(
        padding:
        const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage:
              NetworkImage(
                creator.image,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Center(
            child: Text(
              creator.name,
              style:
              const TextStyle(
                fontSize: 22,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: Text(
              creator.category,
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: ListTile(
              title:
              const Text("Followers"),
              trailing: Text(
                creator.followers
                    .toString(),
              ),
            ),
          ),

          Card(
            child: ListTile(
              title:
              const Text("Rating"),
              trailing: Text(
                creator.rating
                    .toString(),
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Packages",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          packageTile(
            context,
            "Basic",
            5000,
            creator,
          ),

          packageTile(
            context,
            "Premium",
            15000,
            creator,
          ),
        ],
      ),
    );
  }

  Widget packageTile(
      BuildContext context,
      String package,
      double amount,
      CreatorModel creator,
      ) {
    return Card(
      child: ListTile(
        title: Text(package),
        subtitle:
        Text("₹$amount"),
        trailing:
        ElevatedButton(
          onPressed: () {

            context.push('/book-creator',
              extra: {
                "creator":
                creator,
                "package":
                package,
                "amount":
                amount,
              },
            );
          },
          child:
          const Text("Book"),
        ),
      ),
    );
  }
}