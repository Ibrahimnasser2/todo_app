

import 'package:shared_preferences/shared_preferences.dart';

class cash_helper{

  static SharedPreferences? shared_preferences;
  static init()async{
    shared_preferences= await SharedPreferences.getInstance();

  }




  static Future<bool> setbool({
   required  key,
    required value
})async{
    return await shared_preferences!.setBool(key, value);

  }

  static bool?  getbool ({required String key}){
    return shared_preferences!.getBool(key);


  }




  }