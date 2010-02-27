/**
 * Copyright (c) 2000-2010 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.util.dao.orm;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.OrderByComparator;

/**
 * <a href="CustomSQLUtil.java.html"><b><i>View Source</i></b></a>
 *
 * @author Brian Wing Shun Chan
 * @author Bruno Farache
 */
public class CustomSQLUtil {

	public static String get(String id) {
		return _instance._customSQL.get(id);
	}

	public static boolean isVendorDB2() {
		return _instance._customSQL.isVendorDB2();
	}

	public static boolean isVendorInformix() {
		return _instance._customSQL.isVendorInformix();
	}

	public static boolean isVendorMySQL() {
		return _instance._customSQL.isVendorMySQL();
	}

	public static boolean isVendorOracle() {
		return _instance._customSQL.isVendorOracle();
	}

	public static boolean isVendorSybase() {
		return _instance._customSQL.isVendorSybase();
	}

	public static String[] keywords(String keywords) {
		return _instance._customSQL.keywords(keywords);
	}

	public static String[] keywords(String keywords, boolean lowerCase) {
		return _instance._customSQL.keywords(keywords, lowerCase);
	}

	public static String[] keywords(String[] keywordsArray) {
		return _instance._customSQL.keywords(keywordsArray);
	}

	public static String[] keywords(String[] keywordsArray, boolean lowerCase) {
		return _instance._customSQL.keywords(
			keywordsArray, lowerCase);
	}

	public static String replaceAndOperator(String sql, boolean andOperator) {
		return _instance._customSQL.replaceAndOperator(
			sql, andOperator);
	}

	public static String replaceIsNull(String sql) {
		return _instance._customSQL.replaceIsNull(sql);
	}

	public static String replaceKeywords(
		String sql, String field, String operator, boolean last,
		String[] values) {

		return _instance._customSQL.replaceKeywords(
			sql, field, operator, last, values);
	}

	public static String removeOrderBy(String sql) {
		return _instance._customSQL.removeOrderBy(sql);
	}

	public static String replaceOrderBy(String sql, OrderByComparator obc) {
		return _instance._customSQL.replaceOrderBy(sql, obc);
	}

	private CustomSQLUtil() {
		try {
			_customSQL = new CustomSQL();
		}
		catch (Exception e) {
			_log.error(e, e);
		}
	}

	private static Log _log = LogFactoryUtil.getLog(CustomSQLUtil.class);

	private static CustomSQLUtil _instance = new CustomSQLUtil();

	private CustomSQL _customSQL;

}