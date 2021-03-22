import 'package:dio/dio.dart';
import 'package:dumka/data/api/api.dart';
import 'package:dumka/data/model/models.dart';

// Dio Docs: https://github.com/flutterchina/dio/blob/master/README.md

// Open Endpoints
const postSchools = '/v1/schools';
const postStatus = '/v1/status';
const postReportCategories = '/v1/report_categories';
const postAuth = '/v1/auth';

// Token Endpoints
const postUser = '/v1/u/user';
const postSchoolInfo = '/v1/u/school';
const postProposals = '/v1/u/proposals';
const postAddProposal = '/v1/u/proposals_add';

class Requests {
  Future<List<School>> fetchSchools() async {
    // final response = await Api.instance.dio.get(postSchools);
    // var schoolList = <School>[];
    //
    // if (response.statusCode == 200) {
    //   print(response.data['data']);
    //   schoolList = School.builder().listFromJson(response.data['data'] as List);
    // }
    //
    // return schoolList;

    await Future.delayed(Duration(seconds: 1));
    return [
      School(id: 1, name: 'School 1'),
      School(id: 2, name: 'School 2 '),
      School(id: 3, name: 'School 3 '),
      School(id: 4, name: 'School 4 '),
      School(id: 5, name: 'School 5 '),
      School(id: 6, name: 'School 6 '),
    ];
  }

  Future<Response> fetchStatus() async {
    final response = await Api.instance.dio.get(postStatus);
    return response;
  }

  Future<Response> fetchReportCategories() async {
    final response = await Api.instance.dio.get(postReportCategories);
    return response;
  }

  Future<Response> auth() async {
    final response = await Api.instance.dio.post(postAuth);
    return response;
  }

  Future<Response> fetchUserInfo(String token) async {
    final response = await Api.instance.dio
        .get(postUser, options: Options(headers: {'Authorization': token}));
    return response;
  }

  Future<Response> fetchSchoolInfo(String token) async {
    final response = await Api.instance.dio.get(postSchoolInfo,
        options: Options(headers: {'Authorization': token}));
    return response;
  }

  Future<Response> fetchProposalsList(String token) async {
    final response = await Api.instance.dio.get(postProposals,
        options: Options(headers: {'Authorization': token}));
    return response;
  }

  Future<Response> addProposal(String token) async {
    final response = await Api.instance.dio.post(postAddProposal,
        options: Options(headers: {'Authorization': token}));
    return response;
  }
}
