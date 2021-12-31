class PhoneData {
  bool valid;
  String number;
  String localFormat;
  String internationalFormat;
  String countryPrefix;
  String countryCode;
  String countryName;
  String location;
  String carrier;
  String lineType;

  PhoneData(
      {this.valid,
      this.number,
      this.localFormat,
      this.internationalFormat,
      this.countryPrefix,
      this.countryCode,
      this.countryName,
      this.location,
      this.carrier,
      this.lineType});

  PhoneData.fromJson(Map<String, dynamic> json) {
    valid = json['valid'];
    number = json['number'];
    localFormat = json['local_format'];
    internationalFormat = json['international_format'];
    countryPrefix = json['country_prefix'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
    location = json['location'];
    carrier = json['carrier'];
    lineType = json['line_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valid'] = this.valid;
    data['number'] = this.number;
    data['local_format'] = this.localFormat;
    data['international_format'] = this.internationalFormat;
    data['country_prefix'] = this.countryPrefix;
    data['country_code'] = this.countryCode;
    data['country_name'] = this.countryName;
    data['location'] = this.location;
    data['carrier'] = this.carrier;
    data['line_type'] = this.lineType;
    return data;
  }
}
