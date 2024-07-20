import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_supabase_homework/provider.dart';
import 'package:riverpod_supabase_homework/shimmer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          final chatStream = ref.watch(chatStreamProvider);
          return chatStream.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.label),
                      title: Text(data[index]['message']),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // Handle item tap
                        print('Tapped on ${data[index]}');
                      },
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return Text('There is an issue: $error');
            },
            loading: () => ShimmerLoading(),
          );
        }),
      ),
    );
  }
}
