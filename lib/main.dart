import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_supabase_homework/chat.dart';
import 'package:riverpod_supabase_homework/message_model.dart';
import 'package:riverpod_supabase_homework/provider.dart';
import 'package:shimmer/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
late final  supabaseProvider;
void main() async {
WidgetsFlutterBinding.ensureInitialized();


  await Supabase.initialize(
    url: 'https://iyidecmdyhivdqjjdczx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml5aWRlY21keWhpdmRxampkY3p4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAxNjIyMDIsImV4cCI6MjAxNTczODIwMn0.-SSo8FqwiGpWdaQ0TdCikiQY374vE0BT1EzYk90pYRg',
  );  runApp(ProviderScope(child:  MyApp()));
}


 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
    );
  }
}





