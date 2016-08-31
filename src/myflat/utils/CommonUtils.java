package myflat.utils;

import java.util.UUID;

import org.json.JSONArray;

public class CommonUtils {

	public static String[] transformJSONArray2StringArray(JSONArray jObject) {
		return jObject.toString().replace("[", "").replace("]", "").replace("\"", "").split(",");
	}

	public static boolean validateUUID(String StrUid) {
		UUID uuid = null;
		try {
			uuid = UUID.fromString(StrUid);
			return true;
		} catch (IllegalArgumentException exception) {
			return false;
		} finally {
			uuid = null;
		}
	}
}
