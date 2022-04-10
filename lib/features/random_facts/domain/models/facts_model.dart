class Fact {
  final String factText;

  const Fact({
    required this.factText
  });

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      factText: json['value'],
    );
  }

}
