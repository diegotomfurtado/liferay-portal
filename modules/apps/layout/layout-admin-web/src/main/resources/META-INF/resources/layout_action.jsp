<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
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
--%>

<%@ include file="/init.jsp" %>

<%
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

Layout curLayout = (Layout)row.getObject();
%>

<liferay-ui:icon-menu
	direction="left-side"
	icon="<%= StringPool.BLANK %>"
	markupView="lexicon"
	message="<%= StringPool.BLANK %>"
	showWhenSingleIcon="<%= true %>"
>
	<liferay-ui:icon
		message="view"
		url="<%= layoutsAdminDisplayContext.getViewLayoutURL(curLayout) %>"
	/>

	<%
	String editLayoutURL = layoutsAdminDisplayContext.getEditLayoutURL(curLayout);
	%>

	<c:if test="<%= Validator.isNotNull(editLayoutURL) %>">
		<liferay-ui:icon
			message="edit"
			url="<%= editLayoutURL %>"
		/>
	</c:if>

	<c:if test="<%= layoutsAdminDisplayContext.isShowConfigureAction(curLayout) %>">
		<liferay-ui:icon
			message="configure"
			url="<%= layoutsAdminDisplayContext.getConfigureLayoutURL(curLayout) %>"
		/>
	</c:if>

	<c:if test="<%= layoutsAdminDisplayContext.isShowAddChildPageAction(curLayout) %>">
		<liferay-ui:icon
			message="add-child-page"
			url="<%= layoutsAdminDisplayContext.getSelectLayoutPageTemplateEntryURL(layoutsAdminDisplayContext.getFirstLayoutPageTemplateCollectionId(), curLayout.getPlid(), curLayout.isPrivateLayout()) %>"
		/>
	</c:if>

	<c:if test="<%= layoutsAdminDisplayContext.isShowMarkAsHomePageLayout(curLayout) %>">
		<liferay-ui:icon
			message="mark-as-home-page"
			url="<%= layoutsAdminDisplayContext.getMarkAsHomePageLayoutURL(curLayout) %>"
		/>
	</c:if>

	<c:if test="<%= layoutsAdminDisplayContext.isShowCopyLayoutAction(curLayout) %>">
		<liferay-ui:icon
			cssClass="copy-layout-action-option"
			message="copy-page"
			url="javascript:;"
		/>
	</c:if>

	<c:if test="<%= layoutsAdminDisplayContext.isShowPermissionsAction(curLayout) %>">
		<liferay-ui:icon
			message="permissions"
			method="get"
			url="<%= layoutsAdminDisplayContext.getPermissionsURL(curLayout) %>"
			useDialog="<%= true %>"
		/>
	</c:if>

	<c:if test="<%= layoutsAdminDisplayContext.isShowOrphanPortletsAction(curLayout) %>">
		<liferay-ui:icon
			message="orphan-widgets"
			url="<%= layoutsAdminDisplayContext.getOrphanPortletsURL(curLayout) %>"
		/>
	</c:if>

	<c:if test="<%= layoutsAdminDisplayContext.isShowDeleteAction(curLayout) %>">
		<liferay-ui:icon-delete
			url="<%= layoutsAdminDisplayContext.getDeleteLayoutURL(curLayout) %>"
		/>
	</c:if>
</liferay-ui:icon-menu>

<%
String autoSiteNavigationMenuNames = layoutsAdminDisplayContext.getAutoSiteNavigationMenuNames();
%>

<aui:script require="metal-dom/src/all/dom as dom,frontend-js-web/liferay/modal/commands/OpenSimpleInputModal.es as modalCommands">
	var addLayoutPrototypeActionOptionQueryClickHandler = dom.delegate(
		document.body,
		'click',
		'.<portlet:namespace />copy-layout-action-option',
		function(event) {
			var actionElement = event.delegateTarget;

			modalCommands.openSimpleInputModal(
				{
					<c:if test="<%= Validator.isNotNull(autoSiteNavigationMenuNames) %>">
						checkboxFieldLabel: '<liferay-ui:message arguments="<%= autoSiteNavigationMenuNames %>" key="add-this-page-to-the-following-menus-x" />',
						checkboxFieldName: 'TypeSettingsProperties--addToAutoMenus--',
						checkboxFieldValue: true,
					</c:if>

					dialogTitle: '<liferay-ui:message key="copy-page" />',
					formSubmitURL: '<%= layoutsAdminDisplayContext.getCopyLayoutURL(curLayout) %>',
					mainFieldName: 'name',
					mainFieldLabel: '<liferay-ui:message key="name" />',
					namespace: '<portlet:namespace />',
					spritemap: '<%= themeDisplay.getPathThemeImages() %>/lexicon/icons.svg'
				}
			);
		}
	);

	function handleDestroyPortlet () {
		addLayoutPrototypeActionOptionQueryClickHandler.removeListener();

		Liferay.detach('destroyPortlet', handleDestroyPortlet);
	}

	Liferay.on('destroyPortlet', handleDestroyPortlet);
</aui:script>