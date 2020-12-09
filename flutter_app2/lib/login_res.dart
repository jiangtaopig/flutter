import 'package:flutter_app2/generated/json/base/json_convert_content.dart';
import 'package:flutter_app2/generated/json/base/json_field.dart';

class LoginRes with JsonConvert<LoginRes> {
	String code;
	LoginResResult result;
}

class LoginResResult with JsonConvert<LoginResResult> {
	@JSONField(name: "za_itid")
	String zaItid;
	@JSONField(name: "za_ciid")
	String zaCiid;
	@JSONField(name: "za_orgCustId")
	String zaOrgcustid;
	String encryId;
	String parentEncryId;
	String name;
	String u;
	String companyCustId;
	bool phoneIsLoginName;
}
