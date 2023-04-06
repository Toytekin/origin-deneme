import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sil/cubit/iller_cubit.dart';
import 'package:sil/cubit/toplama_cubit.dart';
import 'package:sil/page/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HesaplaCubit(0)),
        BlocProvider(create: (context) => IllerCubit()),
      ],
      child: MaterialApp(title: 'Material App', home: AnaSayfa()),
    );
  }
}
