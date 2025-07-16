import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork{
  static late SharedPreferences sharedPref;
    static Future cacheInitial()async {
      sharedPref = await SharedPreferences.getInstance();
    }
    static Future<bool>  insertToCache({required String key , required String value})async
    {
       return await sharedPref.setString(key , value);
    }
    static String getCache({required String key}){
        return sharedPref.getString(key)?? "";
    }
    static Future<bool> deleteCacheItem({required String key})async{
         return await sharedPref.remove(key);
    }
}