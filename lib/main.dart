
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/storage/hive_service.dart';

void main() async {
 WidgetsFlutterBinding
     .ensureInitialized();

 await HiveService.init();

 runApp(
  ProviderScope(
   child:
   CreatorMarketplaceApp(),
  ),
 );
}