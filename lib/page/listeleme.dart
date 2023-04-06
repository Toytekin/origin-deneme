import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sil/cubit/iller_cubit.dart';

class ListelemeSayfasi extends StatefulWidget {
  const ListelemeSayfasi({super.key});

  @override
  State<ListelemeSayfasi> createState() => _ListelemeSayfasiState();
}

class _ListelemeSayfasiState extends State<ListelemeSayfasi> {
  @override
  void initState() {
    super.initState();
    //! Sayfa yüklenirken listeyi getirir
    context.read<IllerCubit>().illerGetir();
  }

  // Controller
  var araController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
        controller: araController,
        onChanged: (value) {
          //! Girilen harfin büyük olmasını sağlar
          String myValue = value.toUpperCase();
          bool isDigit = int.tryParse(value) != null;
          if (isDigit == false) {
            // ignore: unrelated_type_equality_checks
            if (araController == '') {
              context.read<IllerCubit>().illerGetir();
            } else {
              context.read<IllerCubit>().ilAra(myValue);
            }
          } else {
            context.read<IllerCubit>().illerGetir();
          }
        },
      )),
      body: BlocBuilder<IllerCubit, List<String>>(
        builder: (context, iller) {
          return ListView.builder(
            itemCount: iller.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(iller[index]),
                  leading: Text((index + 1).toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
