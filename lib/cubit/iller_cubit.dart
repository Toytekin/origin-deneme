import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sil/repo/listeleme.dart';

class IllerCubit extends Cubit<List<String>> {
  IllerCubit() : super(<String>[]);

  var ilRepo = IllerRepo();

  Future<void> illerGetir() async {
    var liste = ilRepo.iller;
    emit(liste);
  }

  Future<void> ilAra(String girilenHarf) async {
    var liste = await ilRepo.ilArama(girilenHarf);
    emit(liste);
  }
}
