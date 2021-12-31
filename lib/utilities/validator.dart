class Validator {
  


  static String mobileNumber(String value) {
    //value.trim();
    if (value.isEmpty ==true || value==null)
    {
      return 'Please enter Phone number';}
    else
    { return null;}
  }


  }