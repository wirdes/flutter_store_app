// import 'dart:convert';
// import 'package:api_cache_manager/api_cache_manager.dart';
// import 'package:api_cache_manager/models/cache_db_model.dart';
// import 'package:flutter/material.dart';
// import 'package:kazandirio/main.dart';
// import 'package:kazandirio/models/user_login_val2_res.dart';

// class SharedService {
//   static Future<bool> isLoggedIn() async {
//     var isKeyExist =
//         await APICacheManager().isAPICacheKeyExist('login_details');

//     return isKeyExist;
//   }

//   static Future<LoginVal2Res?> loginDetails() async {
//     var isKeyExist =
//         await APICacheManager().isAPICacheKeyExist('login_details');

//     if (isKeyExist) {
//       var cachedData = await APICacheManager().getCacheData('login_details');
//       return userLoginVal2Json(cachedData.syncData);
//     }
//   }

//   static Future<void> setLoginDetails(LoginVal2Res model) async {
//     APICacheDBModel cacheDBModel = APICacheDBModel(
//         key: 'login_details', syncData: jsonEncode(model.toJson()));

//     await APICacheManager().addCacheData(cacheDBModel);
//   }

//   static Future<void> logout(BuildContext context) async {
//     await APICacheManager().deleteCache('login_details');
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => const MyApp()),
//         (route) => false);
//   }
// }
