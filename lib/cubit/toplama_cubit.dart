import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sil/repo/hesapla.dart';

class HesaplaCubit extends Cubit<int> {
  HesaplaCubit(super.initialState);
  var hRepo = HesaplaRepo();

  void toplama(String sayi1, String sayi2) {
    var toplam = hRepo.topla(sayi1, sayi2);
    emit(toplam);
  }

  void carp(String sayi1, String sayi2) {
    var carp = hRepo.carp(sayi1, sayi2);
    emit(carp);
  }
}
