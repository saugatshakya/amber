class Emergency {
  final String name, age, bloodgroup, sex, guardianContact, emergency;
  Emergency(
      {this.name,
      this.age,
      this.bloodgroup,
      this.sex,
      this.guardianContact,
      this.emergency});

  Emergency.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        bloodgroup = json['bloodgroup'],
        sex = json['sex'],
        guardianContact = json['guardiancontact'],
        emergency = json['emergency'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'bloodgroup': bloodgroup,
        'sex': sex,
        'guardianContact': guardianContact,
        'emergency': emergency
      };
}
