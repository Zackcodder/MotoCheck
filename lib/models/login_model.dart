// ignore_for_file: unnecessary_this

class LoginModel {
  bool? loginresponse;
  String? loginID;
  String? loginMessage;
  String? sTKN;
  bool? isADriver;
  String? driverApproval;

  LoginModel({
    this.loginresponse,
    this.loginID,
    this.loginMessage,
    this.sTKN,
    this.isADriver,
    this.driverApproval,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    loginresponse = json['Loginresponse'];
    loginID = json['LoginID'];
    loginMessage = json['LoginMessage'];
    sTKN = json['STKN'];
    isADriver = json['IsADriver'];
    driverApproval = json['DriverApproval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Loginresponse'] = this.loginresponse;
    data['LoginID'] = this.loginID;
    data['LoginMessage'] = this.loginMessage;
    data['STKN'] = this.sTKN;
    data['IsADriver'] = this.isADriver;
    data['DriverApproval'] = this.driverApproval;
    return data;
  }
}
