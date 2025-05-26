class SwingCapture {
  final String id;
  final List<double> flexionExtension;
  final List<double> ulnarRadial;

  SwingCapture({
    required this.id,
    required this.flexionExtension,
    required this.ulnarRadial,
  });

  factory SwingCapture.fromJson(String id, Map<String, dynamic> json) {
    final parameters = json['parameters'];
    return SwingCapture(
      id: id,
      flexionExtension: List<double>.from(
        parameters['HFA_crWrFlexEx']['values'],
      ),
      ulnarRadial: List<double>.from(parameters['HFA_crWrRadUln']['values']),
    );
  }
}
