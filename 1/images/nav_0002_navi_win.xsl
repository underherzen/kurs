<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:websoft="http://www.websoft.ru" version="1.0">
<!--
'*	nav_0002_navi_win.xsl
'*	Copyright (c) Websoft.  All rights reserved.
-->
<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>
<xsl:param name="objectID"></xsl:param>
<xsl:param name="imagesFolder"></xsl:param>
<xsl:param name="moduleImagesFolder"></xsl:param>
<xsl:param name="width"></xsl:param>
<xsl:param name="height"></xsl:param>

<xsl:template match="/"><xsl:apply-templates select="params"/></xsl:template>

<msxsl:script language="JScript" implements-prefix="websoft">
function arrayElem(sArrayString, iIndex, sDivider) { var aArray = sArrayString.split(sDivider); var iIdx = parseInt(iIndex, 10); if(isNaN(iIdx)) return ''; iIdx = iIdx - 1; if(iIdx!=Math.abs(iIdx)) return ''; if(aArray[iIdx]==null) return ''; return trim(aArray[iIdx]); }
function trim(sString) { if(typeof sString != "string") return sString; var bStart = true; var bEnd = true; var bDblSpc = true; var bCRLF = true; var sReturn = sString; var sChar; if(bStart) { sChar = sReturn.substring(0, 1); while (sChar==" " || sChar=="\n" || sChar=="\r" || sChar=="\t") { sReturn = sReturn.substring(1, sReturn.length); sChar = sReturn.substring(0, 1); }}; if(bEnd) { sChar = sReturn.substring(sReturn.length-1, sReturn.length); while (sChar==" " || sChar=="\n" || sChar=="\r" || sChar=="\t") { sReturn = sReturn.substring(0, sReturn.length-1); sChar = sReturn.substring(sReturn.length-1, sReturn.length); }}; if(bCRLF) { while (sReturn.indexOf("\n") != -1) { sReturn = sReturn.substring(0, sReturn.indexOf("\n")) +" "+ sReturn.substring(sReturn.indexOf("\n")+1, sReturn.length); }; while (sReturn.indexOf("\r") != -1) { sReturn = sReturn.substring(0, sReturn.indexOf("\r")) + sReturn.substring(sReturn.indexOf("\r")+1, sReturn.length); }; while (sReturn.indexOf("\t") != -1) { sReturn = sReturn.substring(0, sReturn.indexOf("\t")) + sReturn.substring(sReturn.indexOf("\t") + 1, sReturn.length); }}; if(bDblSpc) { while (sReturn.indexOf("  ") != -1) { sReturn = sReturn.substring(0, sReturn.indexOf("  ")) + sReturn.substring(sReturn.indexOf("  ") + 1, sReturn.length); }}; return sReturn; }
function getFirstChar(sString) { if(sString.length==0) return ""; var sStr = trim(sString).toUpperCase(); sStr = sStr.charAt(0); if(sStr=='"' || sStr=='"') sStr = sStr.charAt(1); return sStr; }
function cleanUpCharArray(sArrayString, sDivider) { var aArray = sArrayString.split(sDivider); var aPreSort = []; var sControlString = ""; var iCnt = 0; while(aArray[iCnt]!=null) { if(sControlString.indexOf(aArray[iCnt])==-1) { sControlString += aArray[iCnt]; aPreSort.push(aArray[iCnt]); } iCnt++; } return aPreSort.sort().join(sDivider); }
</msxsl:script>

<xsl:template match="params">

	<xsl:if test="sound_click='custom'"><div style="display: none;"><xsl:attribute name="preload"><span><xsl:value-of select="sound_click_file_custom"/></span></xsl:attribute></div></xsl:if>
	<xsl:if test="sound_over='custom'"><div style="display: none;"><xsl:attribute name="preload"><span><xsl:value-of select="sound_over_file_custom"/></span></xsl:attribute></div></xsl:if>

 	<xsl:variable name="panel-bg-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="panel_bgcolor"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="panel-border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="panel_bordercolor"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="panel-gradient-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="panel_gradientcolor"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="allowed-fill-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="allowed_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="allowed-font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="allowed_font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="current-fill-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="current_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="current-font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="current_font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="forbidden-fill-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="forbidden_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="forbidden-font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="forbidden_font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="search-input-border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="search_input_border_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="search-input-bg-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="search_input_bg_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="search-input-font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="search_input_font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="highlight-bg-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="highlight_bg_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="highlight-font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="highlight_font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="search-button-bg-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="search_button_bg_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="search-button-font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="search_button_font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="search-button-border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="search_button_border_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-font-color-idle-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_font_color_idle"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-font-color-selected-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_font_color_selected"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-border-color-idle-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_border_color_idle"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-border-color-selected-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_border_color_selected"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-bg-color-idle-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_bg_color_idle"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-bg-color-selected-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_bg_color_selected"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-gradient-color-idle-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_gradient_color_idle"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="gloss-gradient-color-selected-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="gloss_gradient_color_selected"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="sett-border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="sett_border_color"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="panel_width"><xsl:value-of select="$width"/></xsl:variable>
	<xsl:variable name="panel_height"><xsl:value-of select="$height"/></xsl:variable>
	<xsl:variable name="panel_radius_string"><xsl:value-of select="panel_radius"/>px</xsl:variable>
	<xsl:variable name="panel_color_bg"><xsl:value-of select="$panel-bg-color-fixed"/></xsl:variable>
	<xsl:variable name="panel_color_gradient"><xsl:value-of select="$panel-gradient-color-fixed"/></xsl:variable>
	<xsl:variable name="panel_bgimg_position_css">
		<xsl:if test="panel_bgtype='image'">
			<xsl:choose>
				<xsl:when test="panel_bgimg_position='lt'">background-position: left top;</xsl:when>
				<xsl:when test="panel_bgimg_position='lm'">background-position: left center;</xsl:when>
				<xsl:when test="panel_bgimg_position='lb'">background-position: left bottom;</xsl:when>
				<xsl:when test="panel_bgimg_position='ct'">background-position: center top;</xsl:when>
				<xsl:when test="panel_bgimg_position='cm'">background-position: center center;</xsl:when>
				<xsl:when test="panel_bgimg_position='cb'">background-position: center bottom;</xsl:when>
				<xsl:when test="panel_bgimg_position='rt'">background-position: right top;</xsl:when>
				<xsl:when test="panel_bgimg_position='rm'">background-position: right center;</xsl:when>
				<xsl:when test="panel_bgimg_position='rb'">background-position: right bottom;</xsl:when>
				<xsl:when test="panel_bgimg_position='custom'">background-position: <xsl:value-of select="panel_bgimg_position_custom"/>;</xsl:when>
				<xsl:otherwise>background-position: center center;</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="panel_brd_width"><xsl:value-of select="panel_borderwidth"/></xsl:variable>
	<xsl:variable name="panel_color_brd"><xsl:value-of select="$panel-border-color-fixed"/></xsl:variable>
	<xsl:variable name="_shadow_string">
		<xsl:if test="shadow_strength!='none'">
			<xsl:call-template name="shadow_builder">
				<xsl:with-param name="sType">block</xsl:with-param>
				<xsl:with-param name="sColor"></xsl:with-param>
				<xsl:with-param name="sStrength" select="shadow_strength"/>
				<xsl:with-param name="sOpacity"></xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:variable>
	
	<xsl:variable name="_css_body_position">left: 0; top: 0;</xsl:variable>
	<xsl:variable name="_css_body_sizes">width: <xsl:value-of select="$panel_width"/>px; height: <xsl:value-of select="$panel_height"/>px; min-width: <xsl:value-of select="$panel_width"/>px; min-height: <xsl:value-of select="$panel_height"/>px; max-width: <xsl:value-of select="$panel_width"/>px; max-height: <xsl:value-of select="$panel_height"/>px;</xsl:variable>

	<xsl:variable name="_css_contents_visited_bg">
		<xsl:choose>
			<xsl:when test="slide_icons='standard'">background-image: url(<xsl:value-of select="$imagesFolder"/>navi_tab_contents_sprite.png); background-position: 0px 0px; background-repeat: no-repeat;</xsl:when>
			<xsl:when test="slide_icons='custom'">background-image: url(<xsl:value-of select="i3_img"/>); background-position: 0 0; background-repeat: no-repeat;</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_css_contents_current_bg">
		<xsl:choose>
			<xsl:when test="slide_icons='standard'">background-image: url(<xsl:value-of select="$imagesFolder"/>navi_tab_contents_sprite.png); background-position: 0px -400px; background-repeat: no-repeat;</xsl:when>
			<xsl:when test="slide_icons='custom'">background-image: url(<xsl:value-of select="i2_img"/>); background-position: 0 0; background-repeat: no-repeat;</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_css_contents_unvisited_bg">
		<xsl:choose>
			<xsl:when test="slide_icons='standard'">background-image: url(<xsl:value-of select="$imagesFolder"/>navi_tab_contents_sprite.png); background-position: 0px -800px; background-repeat: no-repeat;</xsl:when>
			<xsl:when test="slide_icons='custom'">background-image: url(<xsl:value-of select="i1_img"/>); background-position: 0 0; background-repeat: no-repeat;</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_css_contents_open">
		<xsl:choose>
			<xsl:when test="hier_type='standard'">background-image: url(<xsl:value-of select="$imagesFolder"/>navi_tab_contents_sprite.png); background-position: 2px -1600px; background-repeat: no-repeat;</xsl:when>
			<xsl:when test="hier_type='custom'">background-image: url(<xsl:value-of select="h2_img"/>); background-position: 0 0; background-repeat: no-repeat;</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_css_contents_closed">
		<xsl:choose>
			<xsl:when test="hier_type='standard'">background-image: url(<xsl:value-of select="$imagesFolder"/>navi_tab_contents_sprite.png); background-position: 2px -1200px; background-repeat: no-repeat;</xsl:when>
			<xsl:when test="hier_type='custom'">background-image: url(<xsl:value-of select="h1_img"/>); background-position: 0 0; background-repeat: no-repeat;</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_css_contents_font">
		<xsl:choose>
			<xsl:when test="basic_font!='custom'">font-family: <xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="basic_font"/></xsl:call-template>;</xsl:when>
			<xsl:otherwise>font-family: <xsl:value-of select="basic_font_custom"/>;</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="basic_font_style='bold' or basic_font_style='bolditalic'">font-weight: bold;</xsl:if>
		<xsl:if test="basic_font_style='italic' or basic_font_style='bolditalic'">font-style: italic;</xsl:if>
		font-size: <xsl:value-of select="basic_font_size"/>px;
	</xsl:variable>
	<xsl:variable name="_css_search_font">
		<xsl:choose>
			<xsl:when test="basic_font!='custom'">font-family: <xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="basic_font"/></xsl:call-template>;</xsl:when>
			<xsl:otherwise>font-family: <xsl:value-of select="basic_font_custom"/>;</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="basic_font_style='bold' or basic_font_style='bolditalic'">font-weight: bold;</xsl:if>
		<xsl:if test="basic_font_style='italic' or basic_font_style='bolditalic'">font-style: italic;</xsl:if>
		font-size: <xsl:value-of select="basic_font_size"/>px;
	</xsl:variable>
	<xsl:variable name="_css_search_border">
		border-style: <xsl:value-of select="search_input_border_style"/>;
		border-color: <xsl:value-of select="$search-input-border-color-fixed"/>;
		border-width: <xsl:value-of select="search_input_border_width"/>px;
		<xsl:if test="search_input_border_radius!='0'">-webkit-border-radius: <xsl:value-of select="search_input_border_radius"/>px; border-radius: <xsl:value-of select="search_input_border_radius"/>px;</xsl:if>
	</xsl:variable>
	<xsl:variable name="_css_search_btn_font">
		<xsl:choose>
			<xsl:when test="basic_font!='custom'">font-family: <xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="basic_font"/></xsl:call-template>;</xsl:when>
			<xsl:otherwise>font-family: <xsl:value-of select="basic_font_custom"/>;</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="basic_font_style='bold' or basic_font_style='bolditalic'">font-weight: bold;</xsl:if>
		<xsl:if test="basic_font_style='italic' or basic_font_style='bolditalic'">font-style: italic;</xsl:if>
		font-size: <xsl:value-of select="basic_font_size"/>px;
	</xsl:variable>
	<xsl:variable name="_css_search_btn_border">
		border-style: <xsl:value-of select="search_button_border_style"/>;
		border-color: <xsl:value-of select="$search-button-border-color-fixed"/>;
		border-width: <xsl:value-of select="search_button_border_width"/>px;
		<xsl:if test="search_button_border_radius!='0'">-webkit-border-radius: <xsl:value-of select="search_button_border_radius"/>px; border-radius: <xsl:value-of select="search_button_border_radius"/>px;</xsl:if>
	</xsl:variable>
	<xsl:variable name="_search_btn_border">border-style: <xsl:value-of select="search_button_border_style"/>; border-color: <xsl:value-of select="$search-button-border-color-fixed"/>; border-width: <xsl:value-of select="search_button_border_width"/>px;</xsl:variable>
	<xsl:variable name="_css_search_param_font">
		<xsl:choose>
			<xsl:when test="basic_font!='custom'">font-family: <xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="basic_font"/></xsl:call-template>;</xsl:when>
			<xsl:otherwise>font-family: <xsl:value-of select="basic_font_custom"/>;</xsl:otherwise>
		</xsl:choose>
		font-size: <xsl:value-of select="number(basic_font_size)-1"/>px;
	</xsl:variable>
	<xsl:variable name="_css_gloss_border">
		<xsl:if test="gloss_border_style!='none' and number(gloss_border_width)!=0">border-width: <xsl:value-of select="gloss_border_width"/>px; border-style: <xsl:value-of select="gloss_border_style"/>;</xsl:if>
	</xsl:variable>
	<xsl:variable name="_css_gloss_font">
		<xsl:choose>
			<xsl:when test="basic_font!='custom'">font-family: <xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="basic_font"/></xsl:call-template>;</xsl:when>
			<xsl:otherwise>font-family: <xsl:value-of select="basic_font_custom"/>;</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="basic_font_style='bold'">font-weight: bold;</xsl:when>
			<xsl:when test="basic_font_style='bolditalic'">font-weight: bold; font-style: italic;</xsl:when>
			<xsl:when test="basic_font_style='italic'">font-style: italic;</xsl:when>
		</xsl:choose>
		font-size: <xsl:value-of select="basic_font_size"/>px;
	</xsl:variable>
	<xsl:variable name="gloss_bgimg_position_css">
		<xsl:choose>
			<xsl:when test="gloss_img_position='lt'">background-position: left top;</xsl:when>
			<xsl:when test="gloss_img_position='lm'">background-position: left center;</xsl:when>
			<xsl:when test="gloss_img_position='lb'">background-position: left bottom;</xsl:when>
			<xsl:when test="gloss_img_position='ct'">background-position: center top;</xsl:when>
			<xsl:when test="gloss_img_position='cm'">background-position: center center;</xsl:when>
			<xsl:when test="gloss_img_position='cb'">background-position: center bottom;</xsl:when>
			<xsl:when test="gloss_img_position='rt'">background-position: right top;</xsl:when>
			<xsl:when test="gloss_img_position='rm'">background-position: right center;</xsl:when>
			<xsl:when test="gloss_img_position='rb'">background-position: right bottom;</xsl:when>
			<xsl:when test="gloss_img_position='custom'">background-position: <xsl:value-of select="gloss_img_position_custom"/>;</xsl:when>
			<xsl:otherwise>background-position: center center;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_css_gloss_letter_font"><xsl:choose><xsl:when test="basic_font!='custom'">font-family: <xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="basic_font"/></xsl:call-template>;</xsl:when><xsl:otherwise>font-family: <xsl:value-of select="basic_font_custom"/>;</xsl:otherwise></xsl:choose><xsl:if test="basic_font_style='bold'">font-weight: bold;</xsl:if> font-size: <xsl:value-of select="round(0.8*number(basic_font_size))"/>px;</xsl:variable>
	<xsl:variable name="_css_gloss_letter_idle">background-color: <xsl:value-of select="$gloss-bg-color-idle-fixed"/>; border-color: <xsl:value-of select="$gloss-border-color-idle-fixed"/>; color: <xsl:value-of select="$gloss-font-color-idle-fixed"/>;</xsl:variable>
	<xsl:variable name="_css_gloss_letter_selected">background-color: <xsl:value-of select="$gloss-bg-color-selected-fixed"/>; border-color: <xsl:value-of select="$gloss-border-color-selected-fixed"/>; color: <xsl:value-of select="$gloss-font-color-selected-fixed"/>;</xsl:variable>
	<xsl:variable name="_css_gloss_idle">
		<xsl:choose>
			<xsl:when test="gloss_fill_type='solid'">background-color: <xsl:value-of select="$gloss-bg-color-idle-fixed"/>;</xsl:when>
			<xsl:when test="gloss_fill_type='grad_v'">
				background-color: <xsl:value-of select="$gloss-bg-color-idle-fixed"/>;
				background-image: linear-gradient(180deg, <xsl:value-of select="$gloss-bg-color-idle-fixed"/>, <xsl:value-of select="$gloss-gradient-color-idle-fixed"/>); 
			</xsl:when>
			<xsl:when test="gloss_fill_type='grad_h'">
				background-color: <xsl:value-of select="$gloss-bg-color-idle-fixed"/>;
				background-image: linear-gradient(90deg, <xsl:value-of select="$gloss-bg-color-idle-fixed"/>, <xsl:value-of select="$gloss-gradient-color-idle-fixed"/>); 
			</xsl:when>
			<xsl:when test="gloss_fill_type='image'">
				background-image: url(<xsl:value-of select="gloss_img_idle"/>);
				<xsl:value-of select="$gloss_bgimg_position_css"/> background-repeat: <xsl:value-of select="gloss_img_repeat"/>;		
			</xsl:when>
		</xsl:choose>
		border-color: <xsl:value-of select="$gloss-border-color-idle-fixed"/>; color: <xsl:value-of select="$gloss-font-color-idle-fixed"/>;
	</xsl:variable>
	<xsl:variable name="_css_gloss_selected">
		<xsl:choose>
			<xsl:when test="gloss_fill_type='solid'">background-color: <xsl:value-of select="$gloss-bg-color-selected-fixed"/>;</xsl:when>
			<xsl:when test="gloss_fill_type='grad_v'">
				background-color: <xsl:value-of select="$gloss-bg-color-selected-fixed"/>;
				background-image: -webkit-linear-gradient(-90deg, <xsl:value-of select="$gloss-bg-color-selected-fixed"/>, <xsl:value-of select="$gloss-gradient-color-selected-fixed"/>); 
				background-image: linear-gradient(180deg, <xsl:value-of select="$gloss-bg-color-selected-fixed"/>, <xsl:value-of select="$gloss-gradient-color-selected-fixed"/>); 
			</xsl:when>
			<xsl:when test="gloss_fill_type='grad_h'">
				background-color: <xsl:value-of select="$gloss-bg-color-selected-fixed"/>;
				background-image: -webkit-linear-gradient(0deg, <xsl:value-of select="$gloss-bg-color-selected-fixed"/>, <xsl:value-of select="$gloss-gradient-color-selected-fixed"/>); 
				background-image: linear-gradient(90deg, <xsl:value-of select="$gloss-bg-color-selected-fixed"/>, <xsl:value-of select="$gloss-gradient-color-selected-fixed"/>); 
			</xsl:when>
			<xsl:when test="gloss_fill_type='image'">
				background-image: url(<xsl:value-of select="gloss_img_selected"/>);
				<xsl:value-of select="$gloss_bgimg_position_css"/> background-repeat: <xsl:value-of select="gloss_img_repeat"/>;		
			</xsl:when>
		</xsl:choose>
		border-color: <xsl:value-of select="$gloss-border-color-selected-fixed"/>; color: <xsl:value-of select="$gloss-font-color-selected-fixed"/>;
	</xsl:variable>
	<xsl:variable name="_css_sett_border_top">
		<xsl:if test="sett_border_style!='none' and number(sett_border_width)!=0">border-top-width: <xsl:value-of select="sett_border_width"/>px; border-top-style: <xsl:value-of select="sett_border_style"/>; border-top-color: <xsl:value-of select="$sett-border-color-fixed"/>;</xsl:if>
	</xsl:variable>
	<xsl:variable name="_css_sett_border_bottom">
		<xsl:if test="sett_border_style!='none' and number(sett_border_width)!=0">border-bottom-width: <xsl:value-of select="sett_border_width"/>px; border-bottom-style: <xsl:value-of select="sett_border_style"/>; border-bottom-color: <xsl:value-of select="$sett-border-color-fixed"/>;</xsl:if>
	</xsl:variable>
	<xsl:variable name="_close_offset">
		<xsl:choose>
			<xsl:when test="number(panel_padding) &lt; number(panel_radius)"><xsl:value-of select="panel_radius"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="panel_padding"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_css_header_margin">margin: 0 <xsl:value-of select="2*number($_close_offset) + 20"/>px 0 0;</xsl:variable>
	<xsl:variable name="_css_body_margin">
		<xsl:choose>
			<xsl:when test="contenttype='richtext' and display_header_richtext='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:when test="contenttype='contents' and display_header_contents='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:when test="contenttype='search' and display_header_search='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:when test="contenttype='glossary' and display_header_glossary='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:when test="contenttype='documents' and display_header_documents='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:when test="contenttype='settings' and display_header_settings='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:when test="contenttype='calculator' and display_header_calculator='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:when test="contenttype='comment' and display_header_comment='yes'">margin: <xsl:value-of select="$_close_offset"/>px 0 0 0;</xsl:when>
			<xsl:otherwise>margin: <xsl:value-of select="2*number($_close_offset) + 20"/>px 0 0 0;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_btn_gradient_color">
		<xsl:call-template name="autogradient">
			<xsl:with-param name="color.base" select="$search-button-bg-color-fixed"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="main.arAllLetters"><xsl:if test="contenttype='glossary' and display_letters='yes'"><xsl:for-each select="glossary_item_list/item"><xsl:variable name="temp.sLetter" select="websoft:getFirstChar(string(e_item))"/><xsl:if test="$temp.sLetter!=''">|<xsl:value-of select="$temp.sLetter"/></xsl:if></xsl:for-each></xsl:if></xsl:variable>
	<xsl:variable name="main.arLetters"><xsl:if test="contenttype='glossary' and display_letters='yes'"><xsl:value-of select="websoft:cleanUpCharArray(string($main.arAllLetters), '|')"/></xsl:if></xsl:variable>
	
	<div class="style-custom" style="display: none">
		<div class="rule">
			<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-container</xsl:attribute>
			<span class="rule-static">width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="$height"/>px; min-width: <xsl:value-of select="$width"/>px; min-height: <xsl:value-of select="$height"/>px; max-width: <xsl:value-of select="$width"/>px; max-height: <xsl:value-of select="$height"/>px;</span>
		</div>
		<div class="rule">
			<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-body</xsl:attribute>
			<span class="rule-static"><xsl:value-of select="$_css_body_position"/><xsl:value-of select="$_css_body_sizes"/>padding: <xsl:value-of select="panel_padding"/>px; border: <xsl:value-of select="$panel_brd_width"/>px solid <xsl:value-of select="$panel_color_brd"/>; background-color: <xsl:value-of select="$panel-bg-color-fixed"/>; <xsl:if test="panel_bg_type='image'">background-image: url(<xsl:value-of select="panel_bgimg"/>); <xsl:value-of select="$panel_bgimg_position_css"/> background-repeat: <xsl:value-of select="panel_bgimg_repeat"/>;</xsl:if></span>
			<xsl:choose>
				<xsl:when test="panel_bgtype='vertical'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
						<xsl:attribute name="data-angle">0</xsl:attribute>
						<xsl:attribute name="data-colors"><xsl:value-of select="$panel_color_bg"/>|0;<xsl:value-of select="$panel_color_gradient"/>|100</xsl:attribute>
					</span>
				</xsl:when>
				<xsl:when test="panel_bgtype='horizontal'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
						<xsl:attribute name="data-angle">90</xsl:attribute>
						<xsl:attribute name="data-colors"><xsl:value-of select="$panel_color_bg"/>|0;<xsl:value-of select="$panel_color_gradient"/>|100</xsl:attribute>
					</span>
				</xsl:when>
			</xsl:choose>
			<xsl:if test="number(panel_radius)!=0">
				<span class="rule-dynamic">
					<xsl:attribute name="data-type">border-radius</xsl:attribute>
					<xsl:attribute name="data-value"><xsl:value-of select="$panel_radius_string"/></xsl:attribute>
				</span>
			</xsl:if>
			<xsl:if test="shadow_strength!='none'">
				<span class="rule-dynamic">
					<xsl:attribute name="data-type">box-shadow</xsl:attribute>
					<xsl:attribute name="data-value"><xsl:value-of select="$_shadow_string"/></xsl:attribute>
				</span>
			</xsl:if>
		</div>
		<div class="rule">
			<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-body-header</xsl:attribute>
			<span class="rule-static">padding: 0 0 <xsl:value-of select="panel_padding"/>px 0;</span>
		</div>
		<xsl:if test="contenttype='contents'">
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .slide-list li</xsl:attribute>
				<span class="rule-static">padding: <xsl:value-of select="item_padding"/>px <xsl:value-of select="item_padding"/>px <xsl:value-of select="item_padding"/>px 0; <xsl:value-of select="$_css_contents_font"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .open .indent</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_contents_open"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .closed .indent</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_contents_closed"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .allowed</xsl:attribute>
				<span class="rule-static">background-color: <xsl:value-of select="$allowed-fill-color-fixed"/>; color: <xsl:value-of select="$allowed-font-color-fixed"/>;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .current</xsl:attribute>
				<span class="rule-static">background-color: <xsl:value-of select="$current-fill-color-fixed"/>; color: <xsl:value-of select="$current-font-color-fixed"/>;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .forbidden</xsl:attribute>
				<span class="rule-static">background-color: <xsl:value-of select="$forbidden-fill-color-fixed"/>; color: <xsl:value-of select="$forbidden-font-color-fixed"/>;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .visited .item-inner</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_contents_visited_bg"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .current .item-inner</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_contents_current_bg"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .unvisited .item-inner</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_contents_unvisited_bg"/></span>
			</div>
		</xsl:if>
		<xsl:if test="contenttype='search'">
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-search-table .cl-td-param</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_search_param_font" /></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-search-table select</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_search_param_font" /> padding: 0.2em; <xsl:value-of select="$_search_btn_border" /></span>
				<xsl:if test="search_button_border_radius!='0'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">border-radius</xsl:attribute>
						<xsl:attribute name="data-value"><xsl:value-of select="search_button_border_radius"/>px</xsl:attribute>
					</span>
				</xsl:if>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-search-field</xsl:attribute>
				<span class="rule-static">height: <xsl:value-of select="2*number(search_input_font_size)"/>px; <xsl:value-of select="$_css_search_btn_font" /><xsl:value-of select="$_css_search_border" /> color: <xsl:value-of select="$search-input-font-color-fixed" />; background-color: <xsl:value-of select="$search-input-bg-color-fixed" />;</span>
				<xsl:if test="search_input_border_radius!='0'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">border-radius</xsl:attribute>
						<xsl:attribute name="data-value"><xsl:value-of select="search_input_border_radius"/>px</xsl:attribute>
					</span>
				</xsl:if>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-search-btn</xsl:attribute>
				<span class="rule-static">height: <xsl:value-of select="2*number(search_button_font_size)"/>px; color: <xsl:value-of select="$search-button-font-color-fixed" />; background-color: <xsl:value-of select="$search-button-bg-color-fixed" />; <xsl:value-of select="$_css_search_btn_font" /><xsl:value-of select="$_search_btn_border" /></span>
				<xsl:if test="search_button_border_radius!='0'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">border-radius</xsl:attribute>
						<xsl:attribute name="data-value"><xsl:value-of select="search_button_border_radius"/>px</xsl:attribute>
					</span>
				</xsl:if>
				<span class="rule-dynamic">
					<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
					<xsl:attribute name="data-angle">0</xsl:attribute>
					<xsl:attribute name="data-colors"><xsl:value-of select="$search-button-bg-color-fixed"/>|0;<xsl:value-of select="$_btn_gradient_color"/>|100</xsl:attribute>
				</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-search-btn:hover</xsl:attribute>
				<span class="rule-dynamic">
					<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
					<xsl:attribute name="data-angle">180</xsl:attribute>
					<xsl:attribute name="data-colors"><xsl:value-of select="$search-button-bg-color-fixed"/>|0;<xsl:value-of select="$_btn_gradient_color"/>|100</xsl:attribute>
				</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-search-results li, #<xsl:value-of select="$objectID"/> .cl-search-no-results, #<xsl:value-of select="$objectID"/> .cl-search-found</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_search_btn_font" /></span>
			</div>			
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-found</xsl:attribute>
				<span class="rule-static">color: <xsl:value-of select="$highlight-font-color-fixed" />; background-color: <xsl:value-of select="$highlight-bg-color-fixed" />;</span>
			</div>
		</xsl:if>
		<xsl:if test="contenttype='documents'">
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-doc-list .cl-doc-item-inner</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_gloss_font"/>background-image: url(<xsl:value-of select="$imagesFolder"/>navi_tab_contents_sprite.png); background-position: 0px -800px; background-repeat: no-repeat;</span>
			</div>
		</xsl:if>
		<xsl:if test="contenttype='glossary'">
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-letters-box</xsl:attribute>
				<span class="rule-static">border-bottom: solid 2px <xsl:value-of select="$gloss-border-color-selected-fixed"/>;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-letter-item</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_gloss_letter_font"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-letter-idle</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_gloss_letter_idle"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-letter-selected</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_gloss_letter_selected"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-terms-list-cell</xsl:attribute>
				<span class="rule-static">width: <xsl:value-of select="glossary_items_col_width"/>%;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-terms-desc</xsl:attribute>
				<span class="rule-static">width: <xsl:value-of select="100-number(glossary_items_col_width)"/>%;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-terms-desc-container</xsl:attribute>
				<span class="rule-static">padding: <xsl:value-of select="panel_padding"/>px;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-terms-list</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_gloss_font"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-term-item</xsl:attribute>
				<span class="rule-static">padding: <xsl:value-of select="gloss_padding"/>px; <xsl:value-of select="$_css_gloss_font"/> <xsl:value-of select="$_css_gloss_border"/></span>
				<xsl:if test="number(gloss_border_radius)!=0">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">border-radius</xsl:attribute>
						<xsl:attribute name="data-value"><xsl:value-of select="gloss_border_radius"/>px 0 0 <xsl:value-of select="gloss_border_radius"/>px</xsl:attribute>
					</span>
				</xsl:if>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-term-idle</xsl:attribute>
				<span class="rule-static">color: <xsl:value-of select="$gloss-font-color-idle-fixed"/>; <xsl:if test="gloss_fill_type='solid' or gloss_fill_type='grad_v' or gloss_fill_type='grad_h'">background-color: <xsl:value-of select="$gloss-bg-color-idle-fixed"/>;</xsl:if><xsl:if test="gloss_fill_type='image'">background-image: url(<xsl:value-of select="gloss_img_idle"/>);<xsl:value-of select="$gloss_bgimg_position_css"/> background-repeat: <xsl:value-of select="gloss_img_repeat"/>;</xsl:if></span>
				<xsl:if test="gloss_fill_type='grad_v'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
						<xsl:attribute name="data-angle">180</xsl:attribute>
						<xsl:attribute name="data-colors"><xsl:value-of select="$gloss-bg-color-idle-fixed"/>|0;<xsl:value-of select="$gloss-gradient-color-idle-fixed"/>|100</xsl:attribute>
					</span>
				</xsl:if>
				<xsl:if test="gloss_fill_type='grad_h'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
						<xsl:attribute name="data-angle">90</xsl:attribute>
						<xsl:attribute name="data-colors"><xsl:value-of select="$gloss-bg-color-idle-fixed"/>|0;<xsl:value-of select="$gloss-gradient-color-idle-fixed"/>|100</xsl:attribute>
					</span>
				</xsl:if>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-term-selected</xsl:attribute>
				<span class="rule-static">color: <xsl:value-of select="$gloss-font-color-selected-fixed"/>; <xsl:if test="gloss_fill_type='solid' or gloss_fill_type='grad_v' or gloss_fill_type='grad_h'">background-color: <xsl:value-of select="$gloss-bg-color-selected-fixed"/>;</xsl:if><xsl:if test="gloss_fill_type='image'">background-image: url(<xsl:value-of select="gloss_img_selected"/>);<xsl:value-of select="$gloss_bgimg_position_css"/> background-repeat: <xsl:value-of select="gloss_img_repeat"/>;</xsl:if></span>
				<xsl:if test="gloss_fill_type='grad_v'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
						<xsl:attribute name="data-angle">180</xsl:attribute>
						<xsl:attribute name="data-colors"><xsl:value-of select="$gloss-bg-color-selected-fixed"/>|0;<xsl:value-of select="$gloss-gradient-color-selected-fixed"/>|100</xsl:attribute>
					</span>
				</xsl:if>
				<xsl:if test="gloss_fill_type='grad_h'">
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
						<xsl:attribute name="data-angle">90</xsl:attribute>
						<xsl:attribute name="data-colors"><xsl:value-of select="$gloss-bg-color-selected-fixed"/>|0;<xsl:value-of select="$gloss-gradient-color-selected-fixed"/>|100</xsl:attribute>
					</span>
				</xsl:if>
			</div>
		</xsl:if>
		<xsl:if test="contenttype='settings'">
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-sett-tip</xsl:attribute>
				<span class="rule-static">padding: <xsl:value-of select="sett_padding"/>px 0;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-sett-table td</xsl:attribute>
				<span class="rule-static">padding: <xsl:value-of select="sett_padding"/>px; <xsl:value-of select="$_css_gloss_font"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-header</xsl:attribute>
				<span class="rule-static">padding: <xsl:value-of select="2*number(sett_padding)"/>px 0;</span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-sett-table .sett-th</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_sett_border_top"/><xsl:value-of select="$_css_sett_border_bottom"/></span>
			</div>
			<div class="rule">
				<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-name, #<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-value</xsl:attribute>
				<span class="rule-static"><xsl:value-of select="$_css_sett_border_bottom"/></span>
			</div>
			<xsl:if test="settings_icons='standard'">
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-status-n, #<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-status-i, #<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-status-c, #<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-status-p, #<xsl:value-of select="$objectID"/> .cl-sett-table .cl-sett-status-f</xsl:attribute>
					<span class="rule-static">background-image: url(<xsl:value-of select="$imagesFolder"/>navi_tab_sett_sprite.png);</span>
				</div>
			</xsl:if>
		</xsl:if>
		<div class="rule">
			<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-close-btn</xsl:attribute>
			<span class="rule-static"><xsl:if test="hide_close='yes'">display: none;</xsl:if> top: <xsl:value-of select="$_close_offset"/>px; right: <xsl:value-of select="$_close_offset"/>px; color: <xsl:value-of select="$panel-border-color-fixed"/>;</span>
		</div>
	</div>

	<div>
		<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_CONTAINER</xsl:attribute>
		<xsl:attribute name="class">cl-container unselectable</xsl:attribute>
		<div>
			<xsl:attribute name="class">cl-body</xsl:attribute>
			<xsl:choose>
				<xsl:when test="contenttype='richtext' and display_header_richtext='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_richtext" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
				<xsl:when test="contenttype='contents' and display_header_contents='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_contents" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
				<xsl:when test="contenttype='search' and display_header_search='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_search" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
				<xsl:when test="contenttype='glossary' and display_header_glossary='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_glossary" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
				<xsl:when test="contenttype='documents' and display_header_documents='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_documents" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
				<xsl:when test="contenttype='settings' and display_header_settings='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_settings" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
				<xsl:when test="contenttype='calculator' and display_header_calculator='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_calculator" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
				<xsl:when test="contenttype='comment' and display_header_comment='yes'">
					<div>
						<xsl:attribute name="class">cl-body-header</xsl:attribute>
						<xsl:value-of select="header_comment" disable-output-escaping="yes"/>
					</div>
				</xsl:when>
			</xsl:choose>
			<div>
				<xsl:attribute name="class">cl-btn cl-close-btn</xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="title_close"/></xsl:attribute>
				&#215;
			</div>
			<div>
				<xsl:attribute name="class">cl-body-contents cl-body-contents-<xsl:value-of select="contenttype"/></xsl:attribute>
				<xsl:choose>
					<xsl:when test="contenttype='richtext'"><xsl:value-of select="panel_text_richtext" disable-output-escaping="yes"/></xsl:when>
					<xsl:when test="contenttype='contents'">
						<ul>
							<xsl:attribute name="class">slide-list</xsl:attribute>
						</ul>
						<ul style="display: none;">
							<li>
								<xsl:attribute name="class">slide-item-template</xsl:attribute>
								<div>
									<xsl:attribute name="class">indent</xsl:attribute>
									<div>
										<xsl:attribute name="class">item-inner</xsl:attribute>
										.
									</div>
								</div>
							</li>
						</ul>
					</xsl:when>
					<xsl:when test="contenttype='search'">
						<div>
							<xsl:attribute name="class">cl-search-form</xsl:attribute>
							<div>
								<xsl:attribute name="class">cl-search-fields</xsl:attribute>
								<table>
									<xsl:attribute name="class">cl-search-table</xsl:attribute>
									<tr>
										<td>
											<xsl:attribute name="class">cl-td-field</xsl:attribute>
											<input>
												<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_SEARCH_STRING</xsl:attribute>
												<xsl:attribute name="class">cl-search-field</xsl:attribute>
												<xsl:attribute name="name">search_string</xsl:attribute>
												<xsl:attribute name="type">text</xsl:attribute>
											</input>
										</td>
										<td>
											<xsl:attribute name="class">cl-td-btn</xsl:attribute>
											<input type="button">
												<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_SEARCH_BTN</xsl:attribute>
												<xsl:attribute name="class">cl-search-btn</xsl:attribute>
												<xsl:attribute name="value"><xsl:value-of select="search_text_button"/></xsl:attribute>
											</input>
										</td>
									</tr>
									<xsl:if test="search_case='no_user' or search_case='yes_user'">
										<tr>
											<td>
												<xsl:attribute name="class">cl-td-param</xsl:attribute>
												<xsl:value-of select="search_text_case"/>
											</td>
											<td>
												<xsl:attribute name="class">cl-td-select</xsl:attribute>
												<select>
													<xsl:attribute name="class">cl-search-case</xsl:attribute>
													<xsl:choose>
														<xsl:when test="search_case='no_user'">
															<option value="no" selected="selected"><xsl:value-of select="search_text_case_no"/></option>
															<option value="yes"><xsl:value-of select="search_text_case_yes"/></option>
														</xsl:when>
														<xsl:otherwise>
															<option value="no"><xsl:value-of select="search_text_case_no"/></option>
															<option value="yes" selected="selected"><xsl:value-of select="search_text_case_yes"/></option>
														</xsl:otherwise>
													</xsl:choose>
												</select>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="search_logic='OR_user' or search_logic='AND_user'">
										<tr>
											<td>
												<xsl:attribute name="class">cl-td-param</xsl:attribute>
												<xsl:value-of select="search_text_logic"/>
											</td>
											<td>
												<xsl:attribute name="class">cl-td-select</xsl:attribute>
												<select>
													<xsl:attribute name="class">cl-search-logic</xsl:attribute>
													<xsl:choose>
														<xsl:when test="search_case='OR_user'">
															<option value="no" selected="selected"><xsl:value-of select="search_text_OR"/></option>
															<option value="yes"><xsl:value-of select="search_text_AND"/></option>
														</xsl:when>
														<xsl:otherwise>
															<option value="no"><xsl:value-of select="search_text_OR"/></option>
															<option value="yes" selected="selected"><xsl:value-of select="search_text_AND"/></option>
														</xsl:otherwise>
													</xsl:choose>
												</select>
											</td>
										</tr>
									</xsl:if>
								</table>
							</div>
							<div>
								<xsl:attribute name="class">cl-search-results</xsl:attribute>
								<xsl:if test="search_tip='yes'">
									<div>
										<xsl:attribute name="class">cl-search-tips</xsl:attribute>
										<xsl:value-of select="search_tip_text" disable-output-escaping="yes"/>
									</div>
								</xsl:if>
								<div>
									<xsl:attribute name="class">cl-search-no-results</xsl:attribute>
									<xsl:value-of select="search_text_notfound"/>
								</div>
								<div>
									<xsl:attribute name="class">cl-search-found</xsl:attribute>
									<xsl:value-of select="search_text_found"/>
									<span>
										<xsl:attribute name="class">cl-search-found-qty</xsl:attribute>
										0
									</span>
								</div>
								<ul>
									<xsl:attribute name="class">cl-search-results-list</xsl:attribute>
								</ul>
								<ul style="display: none;">
									<li>
										<xsl:attribute name="class">cl-search-item-template</xsl:attribute>
										<div>
											<xsl:attribute name="class">indent</xsl:attribute>
											<div>
												<xsl:attribute name="class">item-inner</xsl:attribute>
												<div>
													<xsl:attribute name="class">item-name</xsl:attribute>
													.
												</div>
												<div>
													<xsl:attribute name="class">item-text</xsl:attribute>
													.
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</xsl:when>
					<xsl:when test="contenttype='glossary'">
						<xsl:if test="display_letters='yes'">
							<div>
								<xsl:attribute name="class">cl-letters-box</xsl:attribute>
								<table align="center">
									<xsl:attribute name="class">cl-letters-table</xsl:attribute>
									<tr>
										<td>
											<xsl:attribute name="class">cl-letter-cell</xsl:attribute>
											<div>
												<xsl:attribute name="class">cl-letter-item cl-letter-selected</xsl:attribute>
												<xsl:attribute name="data-letter">*</xsl:attribute>
												*
											</div>
										</td>
										<xsl:for-each select="glossary_item_list/item">
											<xsl:variable name="temp.sItemLetter" select="websoft:arrayElem(string($main.arLetters), position(), '|')"/>
											<xsl:if test="$temp.sItemLetter!=''">
												<td>
													<xsl:attribute name="class">cl-letter-cell</xsl:attribute>
													<div>
														<xsl:attribute name="class">cl-letter-item cl-letter-idle</xsl:attribute>
														<xsl:attribute name="data-letter"><xsl:value-of select="$temp.sItemLetter"/></xsl:attribute>
														<xsl:value-of select="$temp.sItemLetter"/>
													</div>
												</td>
											</xsl:if>
										</xsl:for-each>
									</tr>
								</table>
							</div>
						</xsl:if>
						<div>
							<xsl:attribute name="class">cl-terms-box</xsl:attribute>
							<table cellpadding="0" cellspacing="0" border="0">
								<xsl:attribute name="class">cl-terms-table</xsl:attribute>
								<tr>
									<td>
										<xsl:attribute name="class">cl-terms-td cl-terms-list-cell</xsl:attribute>
										<div>
											<xsl:attribute name="class">cl-terms-list-container</xsl:attribute>
											<ul>
												<xsl:attribute name="class">cl-terms-list</xsl:attribute>
												<xsl:for-each select="glossary_item_list/item">
													<xsl:sort select="e_item" case-order="upper-first" data-type="text" order="ascending"/>
													<li>
														<xsl:attribute name="class">cl-term-item cl-term-idle</xsl:attribute>
														<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_TERM_<xsl:value-of select="position()"/></xsl:attribute>
														<xsl:attribute name="data-code"><xsl:value-of select="e_code"/></xsl:attribute>
														<xsl:attribute name="data-number"><xsl:value-of select="position()"/></xsl:attribute>
														<xsl:value-of select="e_item"/>
													</li>
												</xsl:for-each>
											</ul>
										</div>
									</td>
									<td>
										<xsl:attribute name="class">cl-terms-td cl-terms-desc</xsl:attribute>
										<div>
											<xsl:attribute name="class">cl-terms-desc-container</xsl:attribute>
											<div>
												<xsl:attribute name="class">cl-term-desc-item cl-term-desc-default</xsl:attribute>
												<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_DESC_0</xsl:attribute>
												<xsl:attribute name="data-code">___DEFAULT</xsl:attribute>
												<xsl:attribute name="data-number">0</xsl:attribute>
												<table>
													<xsl:attribute name="class">cl-terms-desc-default-table</xsl:attribute>
													<tr>
														<td>
															<xsl:attribute name="class">cl-terms-desc-default-cell</xsl:attribute>
															<xsl:value-of select="glossary_default_text" disable-output-escaping="yes"/>
														</td>
													</tr>
												</table>
											</div>
											<xsl:for-each select="glossary_item_list/item">
												<xsl:sort select="e_item" case-order="upper-first" data-type="text" order="ascending"/>
												<div>
													<xsl:attribute name="class">cl-term-desc-item</xsl:attribute>
													<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_DESC_<xsl:value-of select="position()"/></xsl:attribute>
													<xsl:attribute name="data-code"><xsl:value-of select="e_code"/></xsl:attribute>
													<xsl:attribute name="data-number"><xsl:value-of select="position()"/></xsl:attribute>
													<xsl:value-of select="e_text" disable-output-escaping="yes"/>
												</div>
											</xsl:for-each>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="contenttype='documents'">
						<ul>
							<xsl:attribute name="class">cl-doc-list</xsl:attribute>
							<xsl:for-each select="doc_list/item">
								<li>
									<xsl:attribute name="class">cl-doc-item</xsl:attribute>
									<div>
										<xsl:attribute name="class">cl-doc-item-inner</xsl:attribute>
										<xsl:attribute name="title"><xsl:value-of select="doc_desc"/></xsl:attribute>
										<a target="_blank">
											<xsl:attribute name="href"><xsl:value-of select="doc_file"/></xsl:attribute>
											<xsl:value-of select="doc_link_text"/>
										</a>
									</div>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:when>
					<xsl:when test="contenttype='settings'">
						<xsl:if test="settings_tip='yes'">
							<div>
								<xsl:attribute name="class">cl-sett-tip</xsl:attribute>
								<xsl:value-of select="settings_tip_text" disable-output-escaping="yes"/>
							</div>
						</xsl:if>
						<table>
							<xsl:attribute name="class">cl-sett-table</xsl:attribute>
							<tr>
								<xsl:attribute name="class">cl-sett-row-template</xsl:attribute>
								<td>
									<xsl:attribute name="class">cl-sett-name</xsl:attribute>
									<xsl:value-of select="hidden_obj_title"/>
								</td>
								<td>
									<xsl:attribute name="class">cl-sett-value cl-sett-score</xsl:attribute>
									50
								</td>
								<td>
									<xsl:attribute name="class">cl-sett-value sett-cs</xsl:attribute>
									<xsl:attribute name="data-title-cs-n"><xsl:value-of select="status_n"/></xsl:attribute>
									<xsl:attribute name="data-title-cs-i"><xsl:value-of select="status_i"/></xsl:attribute>
									<xsl:attribute name="data-title-cs-c"><xsl:value-of select="status_c"/></xsl:attribute>
									<xsl:choose>
										<xsl:when test="settings_icons='standard'">
											<div>
												<xsl:attribute name="class">cl-sett-status</xsl:attribute>
												&#160;
											</div>
										</xsl:when>
										<xsl:otherwise>
											<img>
												<xsl:attribute name="class">sett-cs-n</xsl:attribute>
												<xsl:attribute name="src"><xsl:value-of select="on_img"/></xsl:attribute>
											</img>
											<img>
												<xsl:attribute name="class">sett-cs-i</xsl:attribute>
												<xsl:attribute name="src"><xsl:value-of select="oi_img"/></xsl:attribute>
											</img>
											<img>
												<xsl:attribute name="class">sett-cs-c</xsl:attribute>
												<xsl:attribute name="src"><xsl:value-of select="oc_img"/></xsl:attribute>
											</img>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td>
									<xsl:attribute name="class">cl-sett-value</xsl:attribute>
									<xsl:attribute name="data-title-ss-u"><xsl:value-of select="status_u"/></xsl:attribute>
									<xsl:attribute name="data-title-ss-p"><xsl:value-of select="status_p"/></xsl:attribute>
									<xsl:attribute name="data-title-ss-f"><xsl:value-of select="status_f"/></xsl:attribute>
									<xsl:choose>
										<xsl:when test="settings_icons='standard'">
											<div>
												<xsl:attribute name="class">cl-sett-status</xsl:attribute>
												&#160;
											</div>
										</xsl:when>
										<xsl:otherwise>
											<img>
												<xsl:attribute name="class">sett-cs-u</xsl:attribute>
												<xsl:attribute name="src"><xsl:value-of select="ou_img"/></xsl:attribute>
											</img>
											<img>
												<xsl:attribute name="class">sett-cs-p</xsl:attribute>
												<xsl:attribute name="src"><xsl:value-of select="op_img"/></xsl:attribute>
											</img>
											<img>
												<xsl:attribute name="class">sett-cs-f</xsl:attribute>
												<xsl:attribute name="src"><xsl:value-of select="of_img"/></xsl:attribute>
											</img>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="settings_display='main' or settings_display='all'">
								<tr>
									<td colspan="4">
										<xsl:attribute name="class">cl-sett-header</xsl:attribute>
										<div>
											<div>
												<xsl:value-of select="mainobj_text" disable-output-escaping="yes"/>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<xsl:attribute name="class">sett-main-obj-header</xsl:attribute>
									<td>
										<xsl:attribute name="class">sett-th cl-sett-name</xsl:attribute>
										<xsl:value-of select="obj_header"/>
									</td>
									<td>
										<xsl:attribute name="class">sett-th cl-sett-score</xsl:attribute>
										<xsl:value-of select="obj_score"/>
									</td>
									<td>
										<xsl:attribute name="class">sett-th</xsl:attribute>
										<xsl:value-of select="obj_cs"/>
									</td>
									<td>
										<xsl:attribute name="class">sett-th</xsl:attribute>
										<xsl:value-of select="obj_ss"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="settings_display='other' or settings_display='all'">
								<tr>
									<td colspan="4">
										<xsl:attribute name="class">cl-sett-header</xsl:attribute>
										<div>
											<div>
												<xsl:value-of select="allobj_text" disable-output-escaping="yes"/>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<xsl:attribute name="class">sett-other-obj-header</xsl:attribute>
									<td>
										<xsl:attribute name="class">sett-th cl-sett-name</xsl:attribute>
										<xsl:value-of select="obj_header"/>
									</td>
									<td>
										<xsl:attribute name="class">sett-th cl-sett-score</xsl:attribute>
										<xsl:value-of select="obj_score"/>
									</td>
									<td>
										<xsl:attribute name="class">sett-th</xsl:attribute>
										<xsl:value-of select="obj_cs"/>
									</td>
									<td>
										<xsl:attribute name="class">sett-th</xsl:attribute>
										<xsl:value-of select="obj_ss"/>
									</td>
								</tr>
							</xsl:if>
						</table>
					</xsl:when>
					<xsl:when test="contenttype='calculator'">
						<div>
							<xsl:attribute name="class">calc-container</xsl:attribute>
							<table align="center">
								<xsl:attribute name="class">calc-table</xsl:attribute>
								<tr>
									<td colspan="6">
										<xsl:attribute name="class">calc-display-td</xsl:attribute>
										<div>
											<xsl:attribute name="class">calc-display</xsl:attribute>
											<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_display</xsl:attribute>
											0
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:attribute name="style">padding: 5px 2px 2px 5px;</xsl:attribute>
										<div>
											<xsl:attribute name="class">calc-memind</xsl:attribute>
											<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_mem_ind</xsl:attribute>
										</div>
									</td>
									<td colspan="3" style="padding: 5px 5px 2px 2px;">
										<input value="Backspace" type="button">
											<xsl:attribute name="class">calc-btn calc-back</xsl:attribute>
											<xsl:attribute name="data-btn">Backspace</xsl:attribute>
										</input>
									</td>
									<td style="padding-top: 5px;">
										<input value="CE" type="button">
											<xsl:attribute name="class">calc-btn calc-del</xsl:attribute>
											<xsl:attribute name="data-btn">CE</xsl:attribute>
										</input>
									</td>
									<td style="padding: 5px 5px 2px 2px;">
										<input value="C" type="button">
											<xsl:attribute name="class">calc-btn calc-del</xsl:attribute>
											<xsl:attribute name="data-btn">C</xsl:attribute>
										</input>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 5px;">
										<input value="MC" type="button" name="MC">
											<xsl:attribute name="class">calc-btn calc-mem</xsl:attribute>
											<xsl:attribute name="data-btn">MC</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="7" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">7</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="8" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">8</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="9" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">9</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="/" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">divide</xsl:attribute>
										</input>
									</td>
									<td style="padding-right: 5px;">
										<input value="^" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">power</xsl:attribute>
										</input>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 5px;">
										<input value="MR" type="button">
											<xsl:attribute name="class">calc-btn calc-mem</xsl:attribute>
											<xsl:attribute name="data-btn">MR</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="4" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">4</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="5" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">5</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="6" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">6</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="x" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">mult</xsl:attribute>
										</input>
									</td>
									<td style="padding-right: 5px;">
										<input value="%" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">percent</xsl:attribute>
										</input>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 5px;">
										<input value="M-" type="button">
											<xsl:attribute name="class">calc-btn calc-mem</xsl:attribute>
											<xsl:attribute name="data-btn">MS</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="1" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">1</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="2" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">2</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="3" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">3</xsl:attribute>
										</input>
									</td>
									<td>
										<input value="-" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">minus</xsl:attribute>
										</input>
									</td>
									<td style="padding-right: 5px;">
										<input value="1/x" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">recip</xsl:attribute>
										</input>
									</td>
								</tr>
								<tr>
									<td style="padding-left: 5px;">
										<input value="M+" type="button">
											<xsl:attribute name="class">calc-btn calc-mem</xsl:attribute>
											<xsl:attribute name="data-btn">M+</xsl:attribute>
										</input>
									</td>
									<td style="padding-bottom: 5px;">
										<input value="0" type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">0</xsl:attribute>
										</input>
									</td>
									<td style="padding-bottom: 5px;">
										<input value="." type="button">
											<xsl:attribute name="class">calc-btn calc-num</xsl:attribute>
											<xsl:attribute name="data-btn">.</xsl:attribute>
										</input>
									</td>
									<td style="padding-bottom: 5px;">
										<input value="+/-" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">negate</xsl:attribute>
										</input>
									</td>
									<td style="padding-bottom: 5px;">
										<input value="+" type="button">
											<xsl:attribute name="class">calc-btn calc-act</xsl:attribute>
											<xsl:attribute name="data-btn">plus</xsl:attribute>
										</input>
									</td>
									<td style="padding-right: 5px; padding-bottom: 5px;">
										<input value="=" type="button">
											<xsl:attribute name="class">calc-btn calc-final</xsl:attribute>
											<xsl:attribute name="data-btn">equal</xsl:attribute>
										</input>
									</td>
								</tr>
							</table>
						</div>
						<xsl:if test="display_calculator_desc='yes'">
							<div>
								<xsl:attribute name="class">calc-tip</xsl:attribute>
								<xsl:value-of select="calculator_desc" disable-output-escaping="yes"/>
							</div>
						</xsl:if>
					</xsl:when>
					<xsl:when test="contenttype='comment'">
						<div>
							<xsl:attribute name="class">cl-comm-none</xsl:attribute>
							<xsl:value-of select="no_comments" disable-output-escaping="yes"/>
						</div>
						<div>
							<xsl:attribute name="class">cl-comm-body</xsl:attribute>
							<xsl:value-of select="no_comments" disable-output-escaping="yes"/>
						</div>
					</xsl:when>
				</xsl:choose>
			</div>
		</div>
	</div>

</xsl:template>

<!-- COMMON TEMPLATES -->
<xsl:template name="shadow_builder">
	<xsl:param name="sType"/>
	<xsl:param name="sStrength"/>
	<xsl:param name="sColor"/>
	<xsl:param name="sOpacity"/>
	<xsl:variable name="sHexColor">
		<xsl:choose>
			<xsl:when test="$sType='text'">
				<xsl:choose>
					<xsl:when test="string-length($sColor)!=0"><xsl:value-of select="$sColor"/></xsl:when>
					<xsl:otherwise>#FFFFFF</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$sStrength='extralight'">#CCCCCC</xsl:when>
					<xsl:when test="$sStrength='light'">#999999</xsl:when>
					<xsl:when test="$sStrength='normal'">#666666</xsl:when>
					<xsl:when test="$sStrength='dark'">#333333</xsl:when>
					<xsl:when test="$sStrength='extradark'">#000000</xsl:when>
					<xsl:otherwise>#666666</xsl:otherwise>
				</xsl:choose>	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="sOp">
		<xsl:choose>
			<xsl:when test="$sType='text'">
				<xsl:choose>
					<xsl:when test="string-length($sOpacity)=0">
						<xsl:choose>
							<xsl:when test="$sStrength='extralight'">0.3</xsl:when>
							<xsl:when test="$sStrength='light'">0.5</xsl:when>
							<xsl:when test="$sStrength='normal'">0.66</xsl:when>
							<xsl:when test="$sStrength='dark'">0.9</xsl:when>
							<xsl:when test="$sStrength='extradark'">1.0</xsl:when>
							<xsl:otherwise>0.66</xsl:otherwise>
						</xsl:choose>	
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$sOpacity"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$sStrength='extralight'">0.3</xsl:when>
					<xsl:when test="$sStrength='light'">0.5</xsl:when>
					<xsl:when test="$sStrength='normal'">0.66</xsl:when>
					<xsl:when test="$sStrength='dark'">0.9</xsl:when>
					<xsl:when test="$sStrength='extradark'">1.0</xsl:when>
					<xsl:otherwise>0.66</xsl:otherwise>
				</xsl:choose>	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="sRGB">
		<xsl:call-template name="hex2rgb">
			<xsl:with-param name="hexcolor" select="$sHexColor"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="sOffset">
		<xsl:choose>
			<xsl:when test="$sType='text'">
				<xsl:choose>
					<xsl:when test="$sStrength='extralight'">1px 1px 2px</xsl:when>
					<xsl:when test="$sStrength='light'">1px 1px 2px</xsl:when>
					<xsl:when test="$sStrength='normal'">1px 1px 2px</xsl:when>
					<xsl:when test="$sStrength='dark'">2px 2px 3px</xsl:when>
					<xsl:when test="$sStrength='extradark'">2px 2px 4px</xsl:when>
					<xsl:otherwise>1px 1px 2px</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$sStrength='extralight'">1px 1px 2px</xsl:when>
					<xsl:when test="$sStrength='light'">2px 2px 4px</xsl:when>
					<xsl:when test="$sStrength='normal'">2px 2px 6px</xsl:when>
					<xsl:when test="$sStrength='dark'">3px 3px 6px</xsl:when>
					<xsl:when test="$sStrength='extradark'">3px 3px 8px</xsl:when>
					<xsl:otherwise>1px 1px 2px</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:value-of select="concat($sOffset,' rgba(',$sRGB,',',$sOp,')')"/>
</xsl:template>
<xsl:template match="*" name="font_selector">
	<xsl:param name="sFontID"/>
	<xsl:choose>
		<xsl:when test="$sFontID='Arial'">Arial,'Helvetica Neue',Helvetica,sans-serif</xsl:when>
		<xsl:when test="$sFontID='ArialBlack'">'Arial Black','Arial Bold',Gadget,sans-serif</xsl:when>
		<xsl:when test="$sFontID='ArialNarrow'">'Arial Narrow',Arial,sans-serif</xsl:when>
		<xsl:when test="$sFontID='Comic Sans MS'">'Comic Sans MS', cursive, sans-serif</xsl:when>
		<xsl:when test="$sFontID='CourierNew'">'Courier New',Courier,'Lucida Sans Typewriter','Lucida Typewriter',monospace</xsl:when>
		<xsl:when test="$sFontID='Georgia'">Georgia,Times,'Times New Roman',serif</xsl:when>
		<xsl:when test="$sFontID='Impact'">Impact,Haettenschweiler,'Franklin Gothic Bold',Charcoal,'Helvetica Inserat','Bitstream Vera Sans Bold','Arial Black',sans-serif</xsl:when>
		<xsl:when test="$sFontID='LucidaConsole'">'Lucida Console','Lucida Sans Typewriter',monaco,'Bitstream Vera Sans Mono',monospace</xsl:when>
		<xsl:when test="$sFontID='LucidaSansUnicode'">'Lucida Sans Unicode', 'Lucida Grande', sans-serif</xsl:when>
		<xsl:when test="$sFontID='Palatino'">Palatino,'Palatino Linotype','Palatino LT STD','Book Antiqua',Georgia,serif</xsl:when>
		<xsl:when test="$sFontID='Tahoma'">Tahoma,Verdana,Segoe,sans-serif</xsl:when>
		<xsl:when test="$sFontID='Times'">TimesNewRoman,'Times New Roman',Times,Baskerville,Georgia,serif</xsl:when>
		<xsl:when test="$sFontID='TrebuchetMS'">'Trebuchet MS','Lucida Grande','Lucida Sans Unicode','Lucida Sans',Tahoma,sans-serif</xsl:when>
		<xsl:when test="$sFontID='Verdana'">Verdana,Geneva,sans-serif</xsl:when>
		<xsl:when test="$sFontID='clear_sans_lightregular'">clear_sans_lightregular, 'Arial Narrow', sans-serif</xsl:when>
		<xsl:when test="$sFontID='clear_sans_mediumregular'">clear_sans_mediumregular, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='clear_sansregular'">clear_sansregular, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='clear_sans_thinregular'">clear_sans_thinregular, 'Arial Narrow', sans-serif</xsl:when>
		<xsl:when test="$sFontID='droid_sans_monoregular'">droid_sans_monoregular, 'Lucida Console', Monaco, monospace</xsl:when>
		<xsl:when test="$sFontID='droid_sansregular'">droid_sansregular, Verdana, sans-serif</xsl:when>
		<xsl:when test="$sFontID='droid_serifregular'">droid_serifregular, Georgia, serif</xsl:when>
		<xsl:when test="$sFontID='nerisblack'">nerisblack, 'Arial Black', sans-serif</xsl:when>
		<xsl:when test="$sFontID='nerislight'">nerislight, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='nerissemibold'">nerissemibold, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='neristhin'">neristhin, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='noto_sansregular'">noto_sansregular, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='noto_serifregular'">noto_serifregular, Georgia, serif</xsl:when>
		<xsl:when test="$sFontID='open_sanscondensed_light'">open_sanscondensed_light, 'Arial Narrow', sans-serif</xsl:when>
		<xsl:when test="$sFontID='open_sansextrabold'">open_sansextrabold, 'Arial Black', sans-serif</xsl:when>
		<xsl:when test="$sFontID='open_sanslight'">open_sanslight, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='open_sansregular'">open_sansregular, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='open_sanssemibold'">open_sanssemibold, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='permiansanstypefaceregular'">permiansanstypefaceregular, Arial, sans-serif</xsl:when>
		<xsl:when test="$sFontID='permianseriftypefaceregular'">permianseriftypefaceregular, Georgia, serif</xsl:when>
		<xsl:when test="$sFontID='permianslabseriftypefaceRg'">permianslabseriftypefaceRg, Georgia, serif</xsl:when>
		<xsl:when test="$sFontID='robotoblack'">robotoblack, 'Arial Black', Gadget, sans-serif</xsl:when>
		<xsl:when test="$sFontID='roboto_condensedregular'">roboto_condensedregular, 'Arial Narrow', sans-serif</xsl:when>
		<xsl:when test="$sFontID='roboto_condensedlight'">roboto_condensedlight, 'Arial Narrow', sans-serif</xsl:when>
		<xsl:when test="$sFontID='robotolight'">robotolight, Arial, Helvetica, sans-serif</xsl:when>
		<xsl:when test="$sFontID='robotomedium'">robotomedium, Arial, Helvetica, sans-serif</xsl:when>
		<xsl:when test="$sFontID='robotoregular'">robotoregular, Arial, Helvetica, sans-serif</xsl:when>
		<xsl:when test="$sFontID='robotothin'">robotothin, Arial, Helvetica, sans-serif</xsl:when>
		<xsl:when test="$sFontID='roboto_slablight'">roboto_slablight, Georgia, serif</xsl:when>
		<xsl:when test="$sFontID='roboto_slabregular'">roboto_slabregular, Georgia, serif</xsl:when>
		<xsl:when test="$sFontID='roboto_slabthin'">roboto_slabthin, Georgia, serif</xsl:when>
		<xsl:otherwise>robotoregular, Arial, Helvetica, sans-serif</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="fix-color">
	<xsl:param name="color"/>
	<xsl:choose>
		<xsl:when test="substring($color, 1, 1)='#'">
			<xsl:choose>
				<xsl:when test="string-length($color)=7"><xsl:value-of select="$color"/></xsl:when>
				<xsl:when test="string-length($color)=4">#<xsl:value-of select="substring($color, 2, 1)"/><xsl:value-of select="substring($color, 2, 1)"/><xsl:value-of select="substring($color, 3, 1)"/><xsl:value-of select="substring($color, 3, 1)"/><xsl:value-of select="substring($color, 4, 1)"/><xsl:value-of select="substring($color, 4, 1)"/></xsl:when>
				<xsl:otherwise>transparent</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>transparent</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!--
	COLOR CONVERSION START
	Templates:
		hex2rgb (hexcolor: 7-character hex color value, starts with #) = 7-character hex color value, starts with #, returns comma-separated values r,g,b
		autogradient (color.base: 7-character hex color value, starts with #) = 7-character hex color value, starts with #
		lighten (color.base: 7-character hex color value, starts with #, ratio - 0-1 - darken, 1+ - lighten) = 7-character hex color value, starts with #
		getcolor (color.base: 7-character hex color value, starts with #, color.base.type - string [color1|color2], color.target.type - string [color1|color2|color3|color4\stroke|font]) = 7-character hex color value, starts with #
		hex2todec (hex2: 2-character hex value) = integer decimal value
		hex1todec (hex: 1-character hex value) = integer decimal value
		dectohex2 (dec2: 0-255 decimal value) = 2-character hex value
		dectohex1 (dec: 0-15 decimal value) = 1-character hex value
		hue (hexcolor: 7-character hex color value, starts with #) = 0-360 degrees integer decimal hue value
		saturation (hexcolor: 7-character hex color value, starts with #) = 0-100 percents integer decimal saturation value
		brightness (hexcolor: 7-character hex color value, starts with #) = 0-100 percents integer decimal brightness value
		inverted (hexcolor: 7-character hex color value, starts with #) = 7-character hex color value, starts with #
		max (C1,C2,C3: decimal values) = maximal from these 3 values
		min (C1,C2,C3: decimal values) = minimal from these 3 values
		RGBtoHex (R,G,B: decimal 0-255 color values) = 7-character hex color value, starts with #
		HSBtoHex (H: 0-360 degrees integer decimal hue value,S,B: decimal 0-100 percent saturation and brightness values) = 7-character hex color value, starts with #
-->
	<xsl:template match="*" name="hex2rgb">
		<xsl:param name="hexcolor"/>
		<xsl:variable name="rhex" select="substring($hexcolor, 2, 2)"/>
		<xsl:variable name="ghex" select="substring($hexcolor, 4, 2)"/>
		<xsl:variable name="bhex" select="substring($hexcolor, 6, 2)"/>
		<xsl:variable name="rdec">
			<xsl:call-template name="hex2todec">
				<xsl:with-param name="hex2" select="$rhex"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="gdec">
			<xsl:call-template name="hex2todec">
				<xsl:with-param name="hex2" select="$ghex"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="bdec">
			<xsl:call-template name="hex2todec">
				<xsl:with-param name="hex2" select="$bhex"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$rdec"/>,<xsl:value-of select="$gdec"/>,<xsl:value-of select="$bdec"/>
	</xsl:template>
	<xsl:template match="*" name="autogradient">
		
		<xsl:param name="color.base"/>
		<xsl:variable name="ratio">2</xsl:variable>
		<xsl:variable name="base.H">
			<xsl:call-template name="hue">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="base.S">
			<xsl:call-template name="saturation">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="base.B">
			<xsl:call-template name="brightness">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="target.B">
			<xsl:choose>
				<xsl:when test="(number($base.B)*number($ratio)) &gt; 100">100</xsl:when>
				<xsl:otherwise><xsl:value-of select="round(number($base.B)*number($ratio))"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="target.S">
			<xsl:choose>
				<xsl:when test="number($target.B)=100"><xsl:value-of select="0.35*number($base.S)"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="0.5*number($base.S)"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="HSBtoHex">
			<xsl:with-param name="H" select="$base.H"/>
			<xsl:with-param name="S" select="$target.S"/>
			<xsl:with-param name="B" select="$target.B"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*" name="lighten">
		
		<xsl:param name="color.base"/>
		<xsl:param name="ratio"/>
		<xsl:variable name="base.H">
			<xsl:call-template name="hue">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="base.S">
			<xsl:call-template name="saturation">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="base.B">
			<xsl:call-template name="brightness">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="target.B">
			<xsl:choose>
				<xsl:when test="(number($base.B)*number($ratio)) &gt; 100">100</xsl:when>
				<xsl:otherwise><xsl:value-of select="round(number($base.B)*number($ratio))"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>	
		<xsl:call-template name="HSBtoHex">
			<xsl:with-param name="H" select="$base.H"/>
			<xsl:with-param name="S" select="$base.S"/>
			<xsl:with-param name="B" select="$target.B"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="*" name="getcolor">
		
		<xsl:param name="color.base"/>
		<xsl:param name="color.base.type"/>
		<xsl:param name="color.target.type"/>
		
		<xsl:variable name="base.H">
			<xsl:call-template name="hue">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="base.S">
			<xsl:call-template name="saturation">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="base.B">
			<xsl:call-template name="brightness">
				<xsl:with-param name="hexcolor" select="$color.base"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="target.H" select="$base.H"/>
		<xsl:variable name="target.S">
			<xsl:choose>
				<xsl:when test="$color.base.type='color1'">
					<xsl:choose>
						<xsl:when test="$color.target.type='color2'"><xsl:value-of select="round(0.35*number($base.S))"/></xsl:when>
						<xsl:when test="$color.target.type='color3'"><xsl:value-of select="round(0.67 * number($base.S))"/></xsl:when>
						<xsl:when test="$color.target.type='color4'"><xsl:value-of select="round(0.56 * number($base.S))"/></xsl:when>
						<xsl:when test="$color.target.type='stroke' or $color.target.type='font'">
							<xsl:choose>
								<xsl:when test="round(1.2*number($base.S)) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(1.2*number($base.S))"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise><xsl:value-of select="$base.S"/></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$color.base.type='color2'">
					<xsl:choose>
						<xsl:when test="$color.target.type='color1'">
							<xsl:choose>
								<xsl:when test="(2.8*number($base.S)) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(2.8*number($base.S))"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$color.target.type='color3'">
							<xsl:choose>
								<xsl:when test="(1.56*number($base.S)) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(1.56 * number($base.S))"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$color.target.type='color4'">
							<xsl:choose>
								<xsl:when test="(1.88*number($base.S)) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(1.88 * number($base.S))"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$color.target.type='stroke'">
							<xsl:choose>
								<xsl:when test="round(3.38*number($base.S)) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(3.38*number($base.S))"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$color.target.type='font'">
							<xsl:choose>
								<xsl:when test="round(3.38*number($base.S)) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(3.38*number($base.S))"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise><xsl:value-of select="$base.S"/></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="$base.S"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="target.B">
			<xsl:choose>
				<xsl:when test="$color.base.type='color1'">
					<xsl:choose>
						<xsl:when test="$color.target.type='color2'">
							<xsl:choose>
								<xsl:when test="number($base.B) &lt; 70">
									<xsl:choose>
										<xsl:when test="(number($base.B)*1.4) &gt; 100">100</xsl:when>
										<xsl:otherwise><xsl:value-of select="round(number($base.B)*1.4)"/></xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="(number($base.B)*1.2) &gt; 100">100</xsl:when>
										<xsl:otherwise><xsl:value-of select="round(number($base.B)*1.2)"/></xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$color.target.type='color3'">
							<xsl:choose>
								<xsl:when test="(number($base.B)*1.09) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(number($base.B)*1.08)"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$color.target.type='color4'">
							<xsl:choose>
								<xsl:when test="(number($base.B)*1.13) &gt; 100">100</xsl:when>
								<xsl:otherwise><xsl:value-of select="round(number($base.B)*1.13)"/></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$color.target.type='stroke'"><xsl:value-of select="round(0.75*number($base.B))"/></xsl:when>
						<xsl:when test="$color.target.type='font'"><xsl:value-of select="round(0.5*number($base.B))"/></xsl:when>
						<xsl:otherwise><xsl:value-of select="$base.B"/></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$color.base.type='color2'">
					<xsl:choose>
						<xsl:when test="$color.target.type='color1'"><xsl:value-of select="round(0.83*number($base.B))"/></xsl:when>
						<xsl:when test="$color.target.type='color3'"><xsl:value-of select="round(0.91*number($base.B))"/></xsl:when>
						<xsl:when test="$color.target.type='color4'"><xsl:value-of select="round(0.94*number($base.B))"/></xsl:when>
						<xsl:when test="$color.target.type='stroke'"><xsl:value-of select="round(0.62*number($base.B))"/></xsl:when>
						<xsl:when test="$color.target.type='font'"><xsl:value-of select="round(0.53*number($base.B))"/></xsl:when>
						<xsl:otherwise><xsl:value-of select="$base.B"/></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="$base.B"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="HSBtoHex">
			<xsl:with-param name="H" select="$target.H"/>
			<xsl:with-param name="S" select="$target.S"/>
			<xsl:with-param name="B" select="$target.B"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*" name="hex2todec">
		<xsl:param name="hex2"/>
		<xsl:variable name="d1">
			<xsl:call-template name="hex1todec">
				<xsl:with-param name="hex" select="substring(string($hex2), 1, 1)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="d2">
			<xsl:call-template name="hex1todec">
				<xsl:with-param name="hex" select="substring(string($hex2), 2, 1)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="number($d1)*16 + number($d2)"/>
	</xsl:template> 
	<xsl:template match="*" name="hex1todec">
		<xsl:param name="hex"/>
		<xsl:choose>
			<xsl:when test="$hex='A' or $hex='a'">10</xsl:when>
			<xsl:when test="$hex='B' or $hex='b'">11</xsl:when>
			<xsl:when test="$hex='C' or $hex='c'">12</xsl:when>
			<xsl:when test="$hex='D' or $hex='d'">13</xsl:when>
			<xsl:when test="$hex='E' or $hex='e'">14</xsl:when>
			<xsl:when test="$hex='F' or $hex='f'">15</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string(number($hex))='NaN'">0</xsl:when>
					<xsl:otherwise><xsl:value-of select="$hex"/></xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template> 
	<xsl:template match="*" name="dectohex2">
		<xsl:param name="dec2"/>
		<xsl:variable name="d1" select="floor(number($dec2) div 16)"/>
		<xsl:variable name="d2" select="number($dec2) - (number($d1)*16)"/>
		<xsl:variable name="h1">
			<xsl:call-template name="dectohex1">
				<xsl:with-param name="dec" select="$d1"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="h2">
			<xsl:call-template name="dectohex1">
				<xsl:with-param name="dec" select="$d2"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat(string($h1), string($h2))"/>
	</xsl:template> 
	<xsl:template match="*" name="dectohex1">
		<xsl:param name="dec"/>
		<xsl:choose>
			<xsl:when test="number($dec)=10">A</xsl:when>
			<xsl:when test="number($dec)=11">B</xsl:when>
			<xsl:when test="number($dec)=12">C</xsl:when>
			<xsl:when test="number($dec)=13">D</xsl:when>
			<xsl:when test="number($dec)=14">E</xsl:when>
			<xsl:when test="number($dec)=15">F</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="string(number($dec))='NaN'">0</xsl:when>
					<xsl:otherwise><xsl:value-of select="$dec"/></xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template> 
	<xsl:template match="*" name="hue">
		<xsl:param name="hexcolor"/>
		<xsl:choose>
			<xsl:when test="string-length($hexcolor)=7">
				<xsl:choose>
					<xsl:when test="substring($hexcolor, 1, 1)='#'">
						<xsl:variable name="rhex" select="substring($hexcolor, 2, 2)"/>
						<xsl:variable name="ghex" select="substring($hexcolor, 4, 2)"/>
						<xsl:variable name="bhex" select="substring($hexcolor, 6, 2)"/>
						<xsl:variable name="rdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$rhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="gdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$ghex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="bdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$bhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="Rn" select="number($rdec) div 255"/>
						<xsl:variable name="Gn" select="number($gdec) div 255"/>
						<xsl:variable name="Bn" select="number($bdec) div 255"/>
						<xsl:variable name="Cmax">
							<xsl:call-template name="max">
								<xsl:with-param name="C1" select="$Rn"/>
								<xsl:with-param name="C2" select="$Gn"/>
								<xsl:with-param name="C3" select="$Bn"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="Cmin">
							<xsl:call-template name="min">
								<xsl:with-param name="C1" select="$Rn"/>
								<xsl:with-param name="C2" select="$Gn"/>
								<xsl:with-param name="C3" select="$Bn"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="Cdif" select="number($Cmax) - number($Cmin)"/>
						<xsl:choose>
							<xsl:when test="$Cdif='0'">0</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="(number($Cmax)=number($Rn)) and (number($Gn) &gt;= number($Bn))">
										<xsl:value-of select="round(60 * (number($Gn) - number($Bn)) div number($Cdif))"/>
									</xsl:when>
									<xsl:when test="(number($Cmax)=number($Rn)) and (number($Gn) &lt; number($Bn))">
										<xsl:value-of select="round(60 * (number($Gn) - number($Bn)) div number($Cdif)) + 360"/>
									</xsl:when>
									<xsl:when test="number($Cmax)=number($Gn)">
										<xsl:value-of select="round(60 * (number($Bn) - number($Rn)) div number($Cdif)) + 120"/>
									</xsl:when>
									<xsl:when test="number($Cmax)=number($Bn)">
										<xsl:value-of select="round(60 * (number($Rn) - number($Gn)) div number($Cdif)) + 240"/>
									</xsl:when>
									<xsl:otherwise>0</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" name="saturation">
		<xsl:param name="hexcolor"/>
		<xsl:choose>
			<xsl:when test="string-length($hexcolor)=7">
				<xsl:choose>
					<xsl:when test="substring($hexcolor, 1, 1)='#'">
						<xsl:variable name="rhex" select="substring($hexcolor, 2, 2)"/>
						<xsl:variable name="ghex" select="substring($hexcolor, 4, 2)"/>
						<xsl:variable name="bhex" select="substring($hexcolor, 6, 2)"/>
						<xsl:variable name="rdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$rhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="gdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$ghex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="bdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$bhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="Rn" select="number($rdec) div 255"/>
						<xsl:variable name="Gn" select="number($gdec) div 255"/>
						<xsl:variable name="Bn" select="number($bdec) div 255"/>
						<xsl:variable name="Cmax">
							<xsl:call-template name="max">
								<xsl:with-param name="C1" select="$Rn"/>
								<xsl:with-param name="C2" select="$Gn"/>
								<xsl:with-param name="C3" select="$Bn"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="Cmin">
							<xsl:call-template name="min">
								<xsl:with-param name="C1" select="$Rn"/>
								<xsl:with-param name="C2" select="$Gn"/>
								<xsl:with-param name="C3" select="$Bn"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="(number($Cmax) - number($Cmin))=0">0</xsl:when>
							<xsl:otherwise><xsl:value-of select="round(100*(1 - (number($Cmin) div number($Cmax))))"/></xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" name="brightness">
		<xsl:param name="hexcolor"/>
		<xsl:choose>
			<xsl:when test="string-length($hexcolor)=7">
				<xsl:choose>
					<xsl:when test="substring($hexcolor, 1, 1)='#'">
						<xsl:variable name="rhex" select="substring($hexcolor, 2, 2)"/>
						<xsl:variable name="ghex" select="substring($hexcolor, 4, 2)"/>
						<xsl:variable name="bhex" select="substring($hexcolor, 6, 2)"/>
						<xsl:variable name="rdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$rhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="gdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$ghex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="bdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$bhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="Rn" select="number($rdec) div 255"/>
						<xsl:variable name="Gn" select="number($gdec) div 255"/>
						<xsl:variable name="Bn" select="number($bdec) div 255"/>
						<xsl:variable name="Cmax">
							<xsl:call-template name="max">
								<xsl:with-param name="C1" select="$Rn"/>
								<xsl:with-param name="C2" select="$Gn"/>
								<xsl:with-param name="C3" select="$Bn"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="Cmin">
							<xsl:call-template name="min">
								<xsl:with-param name="C1" select="$Rn"/>
								<xsl:with-param name="C2" select="$Gn"/>
								<xsl:with-param name="C3" select="$Bn"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:value-of select="round(100*number($Cmax))"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" name="inverted">
		<xsl:param name="hexcolor"/>
		<xsl:choose>
			<xsl:when test="string-length($hexcolor)=7">
				<xsl:choose>
					<xsl:when test="substring($hexcolor, 1, 1)='#'">
						<xsl:variable name="rhex" select="substring($hexcolor, 2, 2)"/>
						<xsl:variable name="ghex" select="substring($hexcolor, 4, 2)"/>
						<xsl:variable name="bhex" select="substring($hexcolor, 6, 2)"/>
						<xsl:variable name="rdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$rhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="gdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$ghex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:variable name="bdec">
							<xsl:call-template name="hex2todec">
								<xsl:with-param name="hex2" select="$bhex"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:call-template name="RGBtoHex">
							<xsl:with-param name="R" select="255 - number($rdec)"/>
							<xsl:with-param name="G" select="255 - number($gdec)"/>
							<xsl:with-param name="B" select="255 - number($bdec)"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>#000000</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>#000000</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" name="max">
		<xsl:param name="C1"/>
		<xsl:param name="C2"/>
		<xsl:param name="C3"/>
		<xsl:choose>
			<xsl:when test="number($C1) &gt;= number($C2)">
				<xsl:choose>
					<xsl:when test="number($C1) &gt;= number($C3)"><xsl:value-of select="$C1"/></xsl:when>
					<xsl:otherwise><xsl:value-of select="$C3"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="number($C2) &gt;= number($C3)"><xsl:value-of select="$C2"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$C3"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" name="min">
		<xsl:param name="C1"/>
		<xsl:param name="C2"/>
		<xsl:param name="C3"/>
		<xsl:choose>
			<xsl:when test="(number($C1) &lt;= number($C2)) and (number($C1) &lt;= number($C3))"><xsl:value-of select="$C1"/></xsl:when>
			<xsl:when test="(number($C2) &lt;= number($C1)) and (number($C2) &lt;= number($C3))"><xsl:value-of select="$C2"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$C3"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" name="RGBtoHex">
		<xsl:param name="R"/>
		<xsl:param name="G"/>
		<xsl:param name="B"/>
		<xsl:variable name="Rhex">
			<xsl:call-template name="dectohex2">
				<xsl:with-param name="dec2" select="$R"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="Ghex">
			<xsl:call-template name="dectohex2">
				<xsl:with-param name="dec2" select="$G"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="Bhex">
			<xsl:call-template name="dectohex2">
				<xsl:with-param name="dec2" select="$B"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="concat('#',$Rhex,$Ghex,$Bhex)"/>
	</xsl:template>
	<xsl:template match="*" name="HSBtoHex">
		<xsl:param name="H"/>
		<xsl:param name="S"/>
		<xsl:param name="B"/>
		<xsl:variable name="hsector" select="floor(number($H) div 60)"/>
		<xsl:variable name="hdiff" select="(number($H) div 60) - number($hsector)"/>
		<xsl:variable name="sdec" select="number($S) div 100"/>
		<xsl:variable name="bdec" select="number($B) div 100"/>
		<xsl:variable name="c1" select="number($bdec) * (1 - number($sdec))"/>
		<xsl:variable name="c2" select="number($bdec) * (1 - (number($sdec) * number($hdiff)))"/>
		<xsl:variable name="c3" select="number($bdec) * (1 - ((1 - number($hdiff)) * number($sdec)))"/>
		<xsl:choose>
			<xsl:when test="number($hsector)=0">
				<xsl:call-template name="RGBtoHex">
					<xsl:with-param name="R" select="round(number($bdec) * 255)"/>
					<xsl:with-param name="G" select="round(number($c3) * 255)"/>
					<xsl:with-param name="B" select="round(number($c1) * 255)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="number($hsector)=1">
				<xsl:call-template name="RGBtoHex">
					<xsl:with-param name="R" select="round(number($c2) * 255)"/>
					<xsl:with-param name="G" select="round(number($bdec) * 255)"/>
					<xsl:with-param name="B" select="round(number($c1) * 255)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="number($hsector)=2">
				<xsl:call-template name="RGBtoHex">
					<xsl:with-param name="R" select="round(number($c1) * 255)"/>
					<xsl:with-param name="G" select="round(number($bdec) * 255)"/>
					<xsl:with-param name="B" select="round(number($c3) * 255)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="number($hsector)=3">
				<xsl:call-template name="RGBtoHex">
					<xsl:with-param name="R" select="round(number($c1) * 255)"/>
					<xsl:with-param name="G" select="round(number($c2) * 255)"/>
					<xsl:with-param name="B" select="round(number($bdec) * 255)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="number($hsector)=4">
				<xsl:call-template name="RGBtoHex">
					<xsl:with-param name="R" select="round(number($c3) * 255)"/>
					<xsl:with-param name="G" select="round(number($c1) * 255)"/>
					<xsl:with-param name="B" select="round(number($bdec) * 255)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="number($hsector)=5">
				<xsl:call-template name="RGBtoHex">
					<xsl:with-param name="R" select="round(number($bdec) * 255)"/>
					<xsl:with-param name="G" select="round(number($c1) * 255)"/>
					<xsl:with-param name="B" select="round(number($c2) * 255)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="RGBtoHex">
					<xsl:with-param name="R" select="round(number($bdec) * 255)"/>
					<xsl:with-param name="G" select="round(number($c3) * 255)"/>
					<xsl:with-param name="B" select="round(number($c1) * 255)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
<!--COLOR CONVERSION END-->
</xsl:stylesheet>
