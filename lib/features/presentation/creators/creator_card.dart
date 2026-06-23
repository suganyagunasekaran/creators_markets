import 'package:flutter/material.dart';

import '../../data/model/creator_model.dart';

class CreatorCard extends StatelessWidget {
  final CreatorModel creator;
  final VoidCallback onTap;

  const CreatorCard({
    super.key,
    required this.creator,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage:
          NetworkImage(
            creator.image,
          ),
        ),
        title: Text(
          creator.name,
        ),
        subtitle: Text(
          "${creator.followers} Followers",
        ),
        trailing: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              creator.rating.toString(),
            ),
          ],
        ),
      ),
    );
  }
}