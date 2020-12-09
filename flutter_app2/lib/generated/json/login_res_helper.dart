import 'package:flutter_app2/login_res.dart';

loginResFromJson(LoginRes data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['result'] != null) {
		data.result = new LoginResResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> loginResToJson(LoginRes entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

loginResResultFromJson(LoginResResult data, Map<String, dynamic> json) {
	if (json['za_itid'] != null) {
		data.zaItid = json['za_itid']?.toString();
	}
	if (json['za_ciid'] != null) {
		data.zaCiid = json['za_ciid']?.toString();
	}
	if (json['za_orgCustId'] != null) {
		data.zaOrgcustid = json['za_orgCustId']?.toString();
	}
	if (json['encryId'] != null) {
		data.encryId = json['encryId']?.toString();
	}
	if (json['parentEncryId'] != null) {
		data.parentEncryId = json['parentEncryId']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['u'] != null) {
		data.u = json['u']?.toString();
	}
	if (json['companyCustId'] != null) {
		data.companyCustId = json['companyCustId']?.toString();
	}
	if (json['phoneIsLoginName'] != null) {
		data.phoneIsLoginName = json['phoneIsLoginName'];
	}
	return data;
}

Map<String, dynamic> loginResResultToJson(LoginResResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['za_itid'] = entity.zaItid;
	data['za_ciid'] = entity.zaCiid;
	data['za_orgCustId'] = entity.zaOrgcustid;
	data['encryId'] = entity.encryId;
	data['parentEncryId'] = entity.parentEncryId;
	data['name'] = entity.name;
	data['u'] = entity.u;
	data['companyCustId'] = entity.companyCustId;
	data['phoneIsLoginName'] = entity.phoneIsLoginName;
	return data;
}