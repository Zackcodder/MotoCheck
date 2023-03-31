class DriverModel {
  bool? userdataresponse;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? countryDriver;
  String? stateDriver;
  String? carAvailability;
  String? carOwnership;
  String? carType;
  String? carModel;
  String? plateNumber;
  String? colour;
  String? carID;
  String? category;
  String? adminApprovalStatus;
  String? dateEntered;
  String? imageUrl;

  DriverModel({
    this.userdataresponse,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.countryDriver,
    this.stateDriver,
    this.carAvailability,
    this.carOwnership,
    this.carType,
    this.carModel,
    this.plateNumber,
    this.colour,
    this.carID,
    this.category,
    this.adminApprovalStatus,
    this.dateEntered,
    this.imageUrl,
  });

  DriverModel.fromJson(Map<String, dynamic> json) {
    userdataresponse = json['userdataresponse'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    phone = json['Phone'];
    countryDriver = json['CountryDriver'];
    stateDriver = json['StateDriver'];
    carAvailability = json['CarAvailability'];
    carOwnership = json['CarOwnership'];
    carType = json['CarType'];
    carModel = json['CarModel'];
    plateNumber = json['PlateNumber'];
    colour = json['Colour'];
    carID = json['CarID'];
    category = json['Category'];
    adminApprovalStatus = json['AdminApprovalStatus'];
    dateEntered = json['DateEntered'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userdataresponse'] = userdataresponse;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['Phone'] = phone;
    data['CountryDriver'] = countryDriver;
    data['StateDriver'] = stateDriver;
    data['CarAvailability'] = carAvailability;
    data['CarOwnership'] = carOwnership;
    data['CarType'] = carType;
    data['CarModel'] = carModel;
    data['PlateNumber'] = plateNumber;
    data['Colour'] = colour;
    data['CarID'] = carID;
    data['Category'] = category;
    data['AdminApprovalStatus'] = adminApprovalStatus;
    data['DateEntered'] = dateEntered;
    data['ImageUrl'] = imageUrl;
    return data;
  }
}
