import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sil/cubit/toplama_cubit.dart';
import 'package:sil/page/listeleme.dart';

// ignore: must_be_immutable
class AnaSayfa extends StatelessWidget {
  AnaSayfa({super.key});
//Controller

  var sayi1Controller = TextEditingController();
  var sayi2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(controller: sayi1Controller),
            const SizedBox(height: 25),
            TextField(controller: sayi2Controller),
            toplama(context),
            carpma(context),
            topSonuc(),
            carpSonuc(),
            ElevatedButton(
              child: const Text('Listeleme Sayfasi'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ListelemeSayfasi(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }

  BlocBuilder<HesaplaCubit, int> carpSonuc() {
    return BlocBuilder<HesaplaCubit, int>(
      builder: (context, carp) => Text(carp.toString()),
    );
  }

  BlocBuilder<HesaplaCubit, int> topSonuc() {
    return BlocBuilder<HesaplaCubit, int>(
      builder: (context, topla) => Text(topla.toString()),
    );
  }

  ElevatedButton carpma(BuildContext context) {
    return ElevatedButton(
      child: const Text('Carp'),
      onPressed: () {
        String sayi1 = sayi1Controller.text;
        String sayi2 = sayi2Controller.text;
        context.read<HesaplaCubit>().carp(sayi1, sayi2);
      },
    );
  }

  ElevatedButton toplama(BuildContext context) {
    return ElevatedButton(
      child: const Text('Topla'),
      onPressed: () {
        String sayi1 = sayi1Controller.text;
        String sayi2 = sayi2Controller.text;
        context.read<HesaplaCubit>().toplama(sayi1, sayi2);
      },
    );
  }
}
