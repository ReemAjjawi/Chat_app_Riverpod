import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseProvider = Provider((ref) => Supabase.instance.client);

final chatStreamProvider = StreamProvider.autoDispose((ref) {
  final supabase = ref.watch(supabaseProvider);
  return supabase.from('Chat').stream(primaryKey: ['*']);
});
