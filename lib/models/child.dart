class DaycareChild {
  String firstName;
  String lastName;
  String parentPhoneNumber;

  DaycareChild({
    required this.firstName,
    required this.lastName,
    required this.parentPhoneNumber,
  });

  //implement copyWith
  DaycareChild copyWith({
    String? firstName,
    String? lastName,
    String? parentPhoneNumber,
  }) {
    return DaycareChild(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
    );
  }
}
