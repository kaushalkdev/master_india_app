class GstModel {
  String gstin;
  bool active;
  Address address;
  String stateJuridiction;
  String centerJuridiction;
  String taxpayerType;
  String constitutionOfBusiness;
  Date date;

  GstModel(
      {this.gstin,
      this.active,
      this.address,
      this.stateJuridiction,
      this.centerJuridiction,
      this.taxpayerType,
      this.constitutionOfBusiness,
      this.date});

  GstModel.fromJson(Map<String, dynamic> json) {
    gstin = json['gstin'];
    active = json['active'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    stateJuridiction = json['state_juridiction'];
    centerJuridiction = json['center_juridiction'];
    taxpayerType = json['taxpayer_type'];
    constitutionOfBusiness = json['constitution_of_business'];
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gstin'] = this.gstin;
    data['active'] = this.active;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['state_juridiction'] = this.stateJuridiction;
    data['center_juridiction'] = this.centerJuridiction;
    data['taxpayer_type'] = this.taxpayerType;
    data['constitution_of_business'] = this.constitutionOfBusiness;
    if (this.date != null) {
      data['date'] = this.date.toJson();
    }
    return data;
  }
}

class Address {
  String principlePlace;
  String additionalPlace;

  Address({this.principlePlace, this.additionalPlace});

  Address.fromJson(Map<String, dynamic> json) {
    principlePlace = json['principle_place'];
    additionalPlace = json['additional_place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['principle_place'] = this.principlePlace;
    data['additional_place'] = this.additionalPlace;
    return data;
  }
}

class Date {
  String registration;
  String coordination;

  Date({this.registration, this.coordination});

  Date.fromJson(Map<String, dynamic> json) {
    registration = json['registration'];
    coordination = json['coordination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registration'] = this.registration;
    data['coordination'] = this.coordination;
    return data;
  }
}
