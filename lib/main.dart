import 'package:flutter/material.dart';
import 'package:flutter_dropdownfield_bug/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: MaterialApp(home: RiverpodDropDown()));
  }
}

class RiverpodDropDown extends ConsumerWidget {
  const RiverpodDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final term = ref.watch(futureProvider).value;
    if (term == null) {
      return Container();
    }
    final state = ref.watch(provider(term));
    return Column(
      children: [
        Form(
            child: DropdownButtonFormField<int>(
          value: state.value,
          items: [1, 2, 3]
              .map(
                (int item) => DropdownMenuItem<int>(
                  child: Text(item.toString()),
                  value: item,
                ),
              )
              .toList(),
          onChanged: (int? value) {},
        )),
      ],
    );
  }
}

final provider = StateNotifierProvider.family<Selected, MyState, int>(
    (ref, v) => Selected(MyState(value: v)));

class Selected extends StateNotifier<MyState> {
  Selected(state) : super(state);
}

final futureProvider = FutureProvider((ref) async {
  return Future.delayed(const Duration(milliseconds: 500), () => 1);
});
