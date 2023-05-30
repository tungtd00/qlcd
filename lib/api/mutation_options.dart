// ignore_for_file: non_constant_identifier_names

import 'package:graphql_flutter/graphql_flutter.dart';

class Options {
  static Future<MutationOptions> signInMutation(
      String email, String password) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
            mutation (\$email:String,\$password:String){
              response: test_mobile_signin (email: \$email,password: \$password ) {
                  code
                  message
                  data
              }
          }
        
          '''), variables: {"email": email, "password": password});
    return mutationOptions;
  }

  static Future<MutationOptions> signInPhone(
      String phone_number, String password) async {
    MutationOptions mutationOptions = MutationOptions(
        document: gql('''
              mutation (\$phone_number:String,\$password:String){
          response: test_mobile_signin_phone (phone_number: \$phone_number,password: \$password ) {
              code
              message
              data
          }
      }
  
          '''),
        variables: {"phone_number": phone_number, "password": password});
    return mutationOptions;
  }

  static Future<MutationOptions> sendOTPMutation(
      String email, String phone, String name) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
            mutation (\$phone:String,\$email:String,\$name:String){
            response: test_mobile_signup_ac (phone: \$phone,email: \$email,name: \$name ) {
                code
                message
                data
            }
        }
          '''), variables: {"email": email, "phone": phone, "name": name});
    return mutationOptions;
  }

  static Future<MutationOptions> checkOTPmutation(
      String email, String otp) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
        mutation (\$email:String,\$otp:String){
        response: test_mobile_verify_ac (email: \$email,otp: \$otp ) {
                    code
                    message
                    data
                }
            }

          '''), variables: {"email": email, "otp": otp});
    return mutationOptions;
  }

  static Future<MutationOptions> saveAcc(
      String email, String password, String phone, String name) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
        mutation (\$email:String,\$password:String,\$name:String,\$phone:String){
              response: test_mobile_sendOTPOnlyEmail (email: \$email,password: \$password,name: \$name,phone: \$phone ) {
                  code
                  message
                  data
              }
          }
        
          '''), variables: {
      "email": email,
      "password": password,
      "phone": phone,
      "name": name
    });
    return mutationOptions;
  }

  static Future<MutationOptions> changePass(String email, String pass) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
                    mutation (\$password:String,\$email:String){
                response: test_mobile_changePass (password: \$password,email: \$email ) {
                    code
                    message
                    data
                }
            }
          '''), variables: {
      "email": email,
      "password": pass,
    });
    return mutationOptions;
  }

  static Future<MutationOptions> sendOTPmutationEmail(String email) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
         mutation (\$email:String){
              response: test_sendOTP (email: \$email ) {
                  code
                  message
                  data
              }
          }
          
          '''), variables: {
      "email": email,
    });
    return mutationOptions;
  }

  static Future<MutationOptions> getMember() async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
           mutation {
            response: test_mobile_test_count1  {
                code
                message
                data
            }
            }
          '''));
    return mutationOptions;
  }

  static Future<MutationOptions> getRelationship() async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
                   mutation {
                response: test_mobile_addRelationship  {
                    code
                    message
                    data
                }
            }
          '''));
    return mutationOptions;
  }

  static Future<MutationOptions> addResident(
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
    MutationOptions mutationOptions = MutationOptions(document: gql('''
                mutation (\$info_name:String,\$sex:String,\$date_birth:DateTime,
                \$nationnalId:String,\$phone_required:String,\$email:String,
                \$facebok:String,\$instagram:String,\$linkedin:String,
                \$tiktok:String,\$identity_card_required:String,
                \$residence_type:String,\$code:String){
          response: test_mobile_addResidene (info_name: \$info_name,sex: \$sex,date_birth: \$date_birth,
          nationnalId: \$nationnalId,phone_required: \$phone_required,email: \$email,facebok: \$facebok,
          instagram: \$instagram,linkedin: \$linkedin,tiktok: \$tiktok,
          identity_card_required: \$identity_card_required,residence_type: \$residence_type,code: \$code ) {
              code
              message
              data
          }
      }              
          '''), variables: {
      "info_name": info_name,
      "sex": sex,
      "date_birth": date_birth,
      "nationnalId": nationnalId,
      "phone_required": phone_required,
      "email": email,
      "facebok": facebok,
      "linkedin": linkedin,
      "instagram": instagram,
      "tiktok": tiktok,
      "identity_card_required": identity_card_required,
      "residence_type": residence_type,
      "code": code,
    });
    return mutationOptions;
  }

  static Future<MutationOptions> addOwnInfo(
      String apartmentId,
      String dependentId,
      String buildingId,
      String floorId,
      String relationshipId,
      String phone_required) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
               mutation (\$apartmentId:String,\$dependentId:String,\$buildingId:String,\$floorId:String,\$relationshipId:String,\$phone_required:String){
                response: test_mobile_addOwnInfo (apartmentId: \$apartmentId,dependentId: \$dependentId,buildingId: \$buildingId,floorId: \$floorId,relationshipId: \$relationshipId,phone_required: \$phone_required ) {
                    code
                    message
                    data
                }
            }
          '''), variables: {
      "apartmentId": apartmentId,
      "dependentId": dependentId,
      "buildingId": buildingId,
      "floorId": floorId,
      "relationshipId": relationshipId,
      "phone_required": phone_required
    });
    return mutationOptions;
  }

  static Future<MutationOptions> deleteMember(
      String residentId, String owninfoId) async {
    MutationOptions mutationOptions = MutationOptions(document: gql('''
            mutation (\$residentId:String,\$owninfoId:String){
                response: test_mobile_deleteMember (residentId: \$residentId,owninfoId: \$owninfoId ) {
                    code
                    message
                    data
                }
            }
          '''), variables: {
      "residentId": residentId,
      "owninfoId": owninfoId,
    });
    return mutationOptions;
  }
}
