/**
 * 
 */
package com.trs.util;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.util.Map;

import com.trs.idm.util.StringHelper;
import com.trs.model.AppUser;

/**
 * Description: <BR>
 * Title: TRS 杭州办事处互动系统（TRSAPP）<BR>
 * @author liu.zhuan
 * @ClassName: AppAuthUtil
 * @Copyright: Copyright (c) TRS北京拓尔思信息技术股份有限公司<BR>
 * @Company: TRS北京拓尔思信息技术股份有限公司杭州办事处(www.trs.com.cn)<BR>
 * @date 2015-3-26 下午03:07:44
 * @version 1.0
 */
public class AppAuthUtil {
	private static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(AppAuthUtil.class);

	private static final String PARAM_NAME_ENCODE = "RandomInfo";
	
	private static final String SERVICE_NAME = "wechatAuth.do";
	
	public final static String KEY_PRIVATE_PLATFORM_LOGIN = "private_platform_log.key";
	
	public final static String KEY_PUBLIC_PLATFORM_LOGIN = "public_platform_log.key";
	
	/**
	 * @param sPublicKey
	 * @return
	 */
	public static AppUser checkEncodeInfoFromKey(String randomInfo) {
		if (CMyString.isEmpty(randomInfo))
			return null;
		String url = AppAuthUtil.class.getClassLoader()
				.getResource(KEY_PUBLIC_PLATFORM_LOGIN).getPath();
		return checkEncodeInfo(url, randomInfo);
	}

	/**
	 * @param sPublicKey
	 * @param sEncodeInfo
	 * @return
	 */
	public static AppUser checkEncodeInfo(String sPublicKey, String sEncodeInfo) {
		if (logger.isDebugEnabled()) {
			logger.debug("sPublicKey:" + sPublicKey);
		}

		String sParam = "";
		AppUser user = new AppUser();
		try {
			byte buff[] = sEncodeInfo.getBytes();
			CMySign verify = CMySign.getVerify(sPublicKey);
			buff = verify.decodeRadix64(buff);
			ByteArrayInputStream baoins = new ByteArrayInputStream(buff);
			DataInputStream dataInputStream = new DataInputStream(baoins);

			/*
			 * 重要:此处读取传递过来的信息,顺序与内容应该与create时严格一致.通常情况下,信息来自于WCM创建的.
			 */
			long nUserId = dataInputStream.readInt();
			String sUserName = dataInputStream.readUTF();
			sParam = dataInputStream.readUTF();
			if (sParam == null) {
				sParam = "";
			}

			int nSignLen = dataInputStream.readInt();
			if (!verify.verify(buff, nSignLen)) {
				logger.error("Invalid random info: Signature doesn't matched.");
				return null;
			}

			if (!CMyString.isEmpty(sParam)) {
				Map<String, String> map = StringHelper.String2Map(sParam);
				/*if ("true".equalsIgnoreCase(map.get("isAdmin"))) {
					user.setAdmin(true);
				} else {
					user.setAdmin(false);
				}
				if ("true".equalsIgnoreCase(map.get("isWXAdmin"))) {
					user.setWXAdmin(true);
				} else {
					user.setWXAdmin(false);
				}*/
			}
			//user.setUserId(nUserId);
			//user.setUsername(sUserName);
				
		} catch (Exception ex) {
			logger.error("Failed to check login.", ex);
			return null;
		}

		return user;

	}
}
