// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qlcd/api/mutation_options.dart';
import 'package:qlcd/api/response_module.dart';

import 'package:qlcd/model/user_model.dart';

import '../generated/l10n.dart';
import 'graphQLConfig.dart';

class GraphQLServer {
  Future<Map<String, dynamic>> mutationhqlQuery(
    MutationOptions options,
  ) async {
    try {
      GraphConfig _graphConfig = GraphConfig();
      GraphQLClient _client = await _graphConfig.getClient();
      final result = await _client.mutate(options);

      if (result.data == null) {
        print("lỗi data null");
        // throw ("network_connection_err");
        return {
          "response": {"code": 1, "message": S.current.network_err}
        };
      }
      if (result.data?['response']['code'] != 0) {
        throw (result.data?['response']['message']);
      }
      return result.data!;
    } catch (e) {
      print(e);
      return {
        "response": {"code": 1, "message": e.toString()}
      };
    }
  }

  Future<UserModel?> SignIn(String email, String password) async {
    MutationOptions mutationOptions =
        await Options.signInMutation(email, password);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    // if(result.)
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      print("có data");
      String id = responseModule.response.data['_id'];
      print("id : ${id}");
      String name = responseModule.response.data['userName'];
      String phone = responseModule.response.data['phone_number'];
      String pass = responseModule.response.data['password'];
      String creatTime = responseModule.response.data['createdTime'];
      String updateTime = responseModule.response.data['updatedTime'];
      return UserModel(
          id: id,
          email: email,
          username: name,
          phone: phone,
          createTime: creatTime,
          updateTime: updateTime,
          password: pass);
    } else {
      return null;
    }
  }

  Future<UserModel?> SignInPhone(String phone_number, String password) async {
    MutationOptions mutationOptions =
        await Options.signInPhone(phone_number, password);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    // if(result.)
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      print("có data");
      String id = responseModule.response.data['_id'];
      print("id : ${id}");
      String name = responseModule.response.data['userName'];
      String phone = responseModule.response.data['phone_number'];
      String pass = responseModule.response.data['password'];
      String creatTime = responseModule.response.data['createdTime'];
      String updateTime = responseModule.response.data['updatedTime'];
      return UserModel(
          id: id,
          email: phone,
          username: name,
          phone: phone,
          createTime: creatTime,
          updateTime: updateTime,
          password: pass);
    } else {
      return null;
    }
  }

  Future<String?> sendOTP(String email, String phone, String name) async {
    MutationOptions mutationOptions =
        await Options.sendOTPMutation(email, phone, name);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return null;
    } else {
      return responseModule.response.message;
    }
  }

  Future<String?> checkOtp(String email, String otp) async {
    MutationOptions mutationOptions =
        await Options.checkOTPmutation(email, otp);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      print("done : ");
      return null;
    } else {
      print("lỗi : ${responseModule.response.message}");
      return responseModule.response.message;
    }
  }

  Future<String?> saveAcc(
      String email, String password, String name, String phone) async {
    MutationOptions mutationOptions =
        await Options.saveAcc(email, password, phone, name);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return null;
    } else {
      print("lỗi : ${responseModule.response.message}");
      return responseModule.response.message;
    }
  }

  Future<String?> resendOtp(String email) async {
    MutationOptions mutationOptions = await Options.sendOTPmutationEmail(email);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return null;
    } else {
      print("lỗi : ${responseModule.response.message}");
      return responseModule.response.message;
    }
  }

  Future<String?> changePass(String email, String pass) async {
    MutationOptions mutationOptions = await Options.changePass(email, pass);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      print("done : ");
      return null;
    } else {
      print("lỗi : ${responseModule.response.message}");
      return responseModule.response.message;
    }
  }

  Future<dynamic> getMember() async {
    MutationOptions mutationOptions = await Options.getMember();
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return responseModule.response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getRelationship() async {
    MutationOptions mutationOptions = await Options.getRelationship();
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return responseModule.response.data;
    } else {
      print("lỗi : ${responseModule.response.message}");
      return null;
    }
  }

  Future<String?> addResident(
      String info_name,
      String sex,
      String date_birth,
      String nationnalId,
      String phone_required,
      String email,
      String facebok,
      String instagram,
      String linkedin,
      String tiktok,
      String identity_card_required,
      String residence_type,
      String code) async {
    MutationOptions mutationOptions = await Options.addResident(
        info_name,
        sex,
        date_birth,
        nationnalId,
        phone_required,
        email,
        facebok,
        instagram,
        linkedin,
        tiktok,
        identity_card_required,
        residence_type,
        code);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return null;
    } else {
      print("lỗi : ${responseModule.response.message}");
      return responseModule.response.message;
    }
  }

  Future<String?> addOwnInfo(
      String apartmentId,
      String dependentId,
      String buildingId,
      String floorId,
      String relationshipId,
      String phone_required) async {
    MutationOptions mutationOptions = await Options.addOwnInfo(apartmentId,
        dependentId, buildingId, floorId, relationshipId, phone_required);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return null;
    } else {
      return responseModule.response.message;
    }
  }

  Future<String?> deleteMember(String residentId, String owninfoId) async {
    MutationOptions mutationOptions =
        await Options.deleteMember(residentId, owninfoId);
    Map<String, dynamic>? result = await mutationhqlQuery(mutationOptions);
    var responseModule = ResponseModule.fromJson(result);
    if (responseModule.response.code == 0) {
      return null;
    } else {
      print("lỗi : ${responseModule.response.message}");
      return responseModule.response.message;
    }
  }
}
