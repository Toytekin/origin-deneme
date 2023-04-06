class HesaplaRepo {
  int topla(String rakam1, String rakam2) {
    int r1 = int.parse(rakam1);
    int r2 = int.parse(rakam2);
    int toplam = r1 + r2;
    return toplam;
  }

  int carp(String rakam1, String rakam2) {
    int r1 = int.parse(rakam1);
    int r2 = int.parse(rakam2);
    int carp = r1 * r2;
    return carp;
  }
}
