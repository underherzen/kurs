<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:websoft="http://www.websoft.ru"
				version="1.0">
<!--
'*	q_0002.xsl
'*	Copyright (c) Websoft Ltd.  All rights reserved.
-->

<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>
<xsl:param name="moduleImagesFolder"></xsl:param>
<xsl:param name="imagesFolder"></xsl:param>
<xsl:param name="objectID"></xsl:param>
<xsl:param name="width"></xsl:param>
<xsl:param name="height"></xsl:param>
<xsl:template match="/"><xsl:apply-templates select="params"/></xsl:template>

<xsl:template match="params">
	
	<xsl:variable name="theme">
		<xsl:choose>
			<xsl:when test="theme!=''"><xsl:value-of select="theme"/></xsl:when>
			<xsl:otherwise>light</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="bg-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="bg_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="border_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="base-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="base_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="scale-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="scalecolor"/>
		</xsl:call-template>
	</xsl:variable>

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

	<xsl:variable name="bg-color-simple" select="$bg-color-fixed"/>
	<xsl:variable name="border-color-main-simple" select="$border-color-fixed"/>
	<xsl:variable name="border-color-outer-simple">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$border-color-main-simple"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">stroke</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="border-color-inner-simple">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$border-color-outer-simple"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">color3</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="border-color-light" select="$border-color-fixed"/>
	<xsl:variable name="bg-color-light" select="$bg-color-fixed"/>

	<xsl:variable name="border-color-standard" select="$border-color-fixed"/>
	<xsl:variable name="bg-color-standard" select="$bg-color-fixed"/>

	<xsl:variable name="_font_family">
		<xsl:choose>
			<xsl:when test="font='custom'"><xsl:value-of select="font_custom"/></xsl:when>
			<xsl:otherwise><xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="font"/></xsl:call-template></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<div class="style-custom" style="display: none">
		<div class="rule">
			<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .container</xsl:attribute>
			<span class="rule-static">width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="$height"/>px;</span>
		</div>
		<xsl:choose>
			<xsl:when test="display_bg='yes'">
				<xsl:choose>
					<xsl:when test="$theme='simple'">
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-outer</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="number($width) - 2"/>px; height: <xsl:value-of select="number($height) - 2"/>px; border-style: solid; border-width: 1px; border-color: <xsl:value-of select="$border-color-outer-simple"/>;</span>
							<xsl:if test="$_shadow_string!=''">
								<span class="rule-dynamic">
									<xsl:attribute name="data-type">box-shadow</xsl:attribute>
									<xsl:attribute name="data-value"><xsl:value-of select="$_shadow_string"/></xsl:attribute>
								</span>
							</xsl:if>
						</div>
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-middle</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="number($width) - 6"/>px; height: <xsl:value-of select="number($height) - 6"/>px; border-style: solid; border-width: 2px; border-color: <xsl:value-of select="$border-color-main-simple"/>;</span>
						</div>
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-inner</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; background-color: <xsl:value-of select="$bg-color-simple"/>; border-style: solid; border-width: 1px; border-color: <xsl:value-of select="$border-color-inner-simple"/>; padding: <xsl:value-of select="padding"/>px;</span>
						</div>
						<xsl:choose>
							<xsl:when test="display_type='plain'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; border-spacing: 0;</span>
								</div>
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain-td</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>
							</xsl:when>
							<xsl:when test="display_type='scale'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; border-spacing: 0;</span>
								</div>
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-td</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; padding: 0;</span>
								</div>
							</xsl:when>
							<xsl:when test="display_type='detail'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-container</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$theme='standard'">
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-outer</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="number($width) - 4"/>px; height: <xsl:value-of select="number($height) - 4"/>px; border-style: solid; border-width: 2px; background-color: <xsl:value-of select="$bg-color-standard"/>; border-color: <xsl:value-of select="$border-color-standard"/>;</span>
							<span class="rule-dynamic">
								<xsl:attribute name="data-type">border-radius</xsl:attribute>
								<xsl:attribute name="data-value">10px</xsl:attribute>
							</span>
							<xsl:if test="$_shadow_string!=''">
								<span class="rule-dynamic">
									<xsl:attribute name="data-type">box-shadow</xsl:attribute>
									<xsl:attribute name="data-value"><xsl:value-of select="$_shadow_string"/></xsl:attribute>
								</span>
							</xsl:if>
						</div>
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-middle</xsl:attribute>
							<span class="rule-static">width: inherit; height: inherit;</span>
						</div>
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-inner</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; padding: <xsl:value-of select="padding"/>px;</span>
						</div>
						<xsl:choose>
							<xsl:when test="display_type='plain'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; border-spacing: 0;</span>
								</div>
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain-td</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>
							</xsl:when>
							<xsl:when test="display_type='scale'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; border-spacing: 0;</span>
								</div>
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-td</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; padding: 0;</span>
								</div>		
							</xsl:when>
							<xsl:when test="display_type='detail'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-container</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$theme='light'">
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-outer</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="number($width) - 2"/>px; height: <xsl:value-of select="number($height) - 2"/>px; border-style: solid; border-width: 1px; background-color: <xsl:value-of select="$bg-color-light"/>; border-color: <xsl:value-of select="$border-color-light"/>;</span>
							<span class="rule-dynamic">
								<xsl:attribute name="data-type">border-radius</xsl:attribute>
								<xsl:attribute name="data-value">5px</xsl:attribute>
							</span>
							<xsl:if test="$_shadow_string!=''">
								<span class="rule-dynamic">
									<xsl:attribute name="data-type">box-shadow</xsl:attribute>
									<xsl:attribute name="data-value"><xsl:value-of select="$_shadow_string"/></xsl:attribute>
								</span>
							</xsl:if>
						</div>
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-middle</xsl:attribute>
							<span class="rule-static">width: inherit; height: inherit;</span>
						</div>
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-inner</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; padding: <xsl:value-of select="padding"/>px;</span>
						</div>
						.cl-results-container { position: relative; overflow-y: scroll; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if> }
						<xsl:choose>
							<xsl:when test="display_type='plain'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; border-spacing: 0;</span>
								</div>
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain-td</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>
							</xsl:when>
							<xsl:when test="display_type='scale'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; border-spacing: 0;</span>
								</div>
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-td</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; padding: 0;</span>
								</div>		
							</xsl:when>
							<xsl:when test="display_type='detail'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-container</xsl:attribute>
									<span class="rule-static">width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
							</xsl:when>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="display_type='plain'">
						<xsl:choose>
							<xsl:when test="$theme='simple'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-outer</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2"/>px; height: <xsl:value-of select="number($height) - 2"/>px; border-style: solid; border-width: 1px; border-color: transparent;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-middle</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 6"/>px; height: <xsl:value-of select="number($height) - 6"/>px; border-style: solid; border-width: 2px; border-color: transparent;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-inner</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; border-style: solid; border-width: 1px; border-color: transparent; padding: <xsl:value-of select="padding"/>px;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; border-spacing: 0;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain-td</xsl:attribute>
									<span class="rule-static">vertical-align: middle; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; border-spacing: 0;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-td</xsl:attribute>
									<span class="rule-static">vertical-align: middle; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; padding: 0;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-container</xsl:attribute>
									<span class="rule-static">position: relative; overflow-y: scroll; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 8"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 8"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
							</xsl:when>
							<xsl:when test="$theme='standard'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-outer</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 4"/>px; height: <xsl:value-of select="number($height) - 4"/>px; border-style: solid; border-width: 2px; border-color: transparent;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-middle</xsl:attribute>
									<span class="rule-static">position: relative; width: inherit; height: inherit;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-inner</xsl:attribute>
									<span class="rule-static">position: relative; width: inherit; height: inherit; padding: <xsl:value-of select="padding"/>px;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; border-spacing: 0;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain-td</xsl:attribute>
									<span class="rule-static">vertical-align: middle; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; border-spacing: 0;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-td</xsl:attribute>
									<span class="rule-static">vertical-align: middle; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-container</xsl:attribute>
									<span class="rule-static">position: relative; overflow-y: scroll; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 4"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 4"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
							</xsl:when>
							<xsl:when test="$theme='light'">
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-outer</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2"/>px; height: <xsl:value-of select="number($height) - 2"/>px; border-style: solid; border-width: 1px; border-color: transparent;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-middle</xsl:attribute>
									<span class="rule-static">position: relative; width: inherit; height: inherit;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-inner</xsl:attribute>
									<span class="rule-static">position: relative; width: inherit; height: inherit; padding: <xsl:value-of select="padding"/>px;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; border-spacing: 0;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-plain-td</xsl:attribute>
									<span class="rule-static">vertical-align: middle; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale</xsl:attribute>
									<span class="rule-static">position: relative; width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; border-spacing: 0;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-td</xsl:attribute>
									<span class="rule-static">vertical-align: middle; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px;</span>
								</div>								
								<div class="rule">
									<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-container</xsl:attribute>
									<span class="rule-static">position: relative; overflow-y: scroll; text-align: center; width: <xsl:value-of select="number($width) - 2*number(padding) - 2"/>px; height: <xsl:value-of select="number($height) - 2*number(padding) - 2"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; color: <xsl:value-of select="$font-color-fixed"/>; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
								</div>								
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-outer, #<xsl:value-of select="$objectID"/> .cl-middle, #<xsl:value-of select="$objectID"/> .cl-inner</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="$height"/>px; padding: 0;</span>
						</div>								
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale</xsl:attribute>
							<span class="rule-static">width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="$height"/>px; border-spacing: 0;</span>
						</div>								
						<div class="rule">
							<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-td</xsl:attribute>
							<span class="rule-static">vertical-align: middle; text-align: center; width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="$height"/>px; padding: 0;</span>
						</div>								
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="display_type='scale'">
				<xsl:variable name="_scale_gradient_color">
					<xsl:call-template name="autogradient">
						<xsl:with-param name="color.base" select="$scale-color-fixed"/>
					</xsl:call-template>
				</xsl:variable>
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-h-desc</xsl:attribute>
					<span class="rule-static">padding: <xsl:value-of select="0.5*number(interscale)"/>px <xsl:value-of select="interscale"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-h-scale</xsl:attribute>
					<span class="rule-static">padding: <xsl:value-of select="0.5*number(interscale)"/>px 0;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-h-value</xsl:attribute>
					<span class="rule-static">padding: <xsl:value-of select="0.5*number(interscale)"/>px <xsl:value-of select="interscale"/>px; font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if><xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if></span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-h-div</xsl:attribute>
					<span class="rule-static">height: <xsl:value-of select="font_size"/>px; background-color: <xsl:value-of select="$scale-color-fixed"/>;</span>
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">border-radius</xsl:attribute>
						<xsl:attribute name="data-value"><xsl:value-of select="0.5*number(font_size)"/>px</xsl:attribute>
					</span>
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
						<xsl:attribute name="data-angle">180</xsl:attribute>
						<xsl:attribute name="data-colors"><xsl:value-of select="$scale-color-fixed"/>|0;<xsl:value-of select="$_scale_gradient_color"/>|100</xsl:attribute>
					</span>
				</div>								
				<xsl:for-each select="scoreboards/item">
					<xsl:variable name="score-color-fixed">
						<xsl:call-template name="fix-color">
							<xsl:with-param name="color" select="scorecolor"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="_gradient_color">
						<xsl:call-template name="autogradient">
							<xsl:with-param name="color.base" select="$score-color-fixed"/>
						</xsl:call-template>
					</xsl:variable>
					<div class="rule">
						<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-h-scale-<xsl:value-of select="position()"/> .cl-table-scale-h-ind</xsl:attribute>
						<span class="rule-static">width: 100%; height: <xsl:value-of select="../../font_size"/>px; background-color: <xsl:value-of select="$score-color-fixed"/>; overflow: hidden;</span>
						<span class="rule-dynamic">
							<xsl:attribute name="data-type">border-radius</xsl:attribute>
							<xsl:attribute name="data-value"><xsl:value-of select="0.5*number(../../font_size)"/>px</xsl:attribute>
						</span>
						<span class="rule-dynamic">
							<xsl:attribute name="data-type">linear-gradient</xsl:attribute>
							<xsl:attribute name="data-angle">0</xsl:attribute>
							<xsl:attribute name="data-colors"><xsl:value-of select="$score-color-fixed"/>|0;<xsl:value-of select="$_gradient_color"/>|100</xsl:attribute>
						</span>
					</div>								
					<div class="rule">
						<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-h-desc-<xsl:value-of select="position()"/></xsl:attribute>
						<span class="rule-static"><xsl:choose><xsl:when test="../../font_color_type='by_scale'">color: <xsl:value-of select="$score-color-fixed"/>;</xsl:when><xsl:otherwise>color: <xsl:value-of select="$font-color-fixed"/>;</xsl:otherwise></xsl:choose></span>
					</div>								
					<div class="rule">
						<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-table-scale-h-value-<xsl:value-of select="position()"/></xsl:attribute>
						<span class="rule-static"><xsl:choose><xsl:when test="../../font_color_type='by_scale'">color: <xsl:value-of select="$score-color-fixed"/>;</xsl:when><xsl:otherwise>color: <xsl:value-of select="$font-color-fixed"/>;</xsl:otherwise></xsl:choose></span>
					</div>								
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="display_type='detail'">
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-t-template</xsl:attribute>
					<span class="rule-static">border-color: <xsl:value-of select="$border-color-fixed"/>; color: <xsl:value-of select="$border-color-fixed"/>;</span>
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">border-radius</xsl:attribute>
						<xsl:attribute name="data-value">3px</xsl:attribute>
					</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-template</xsl:attribute>
					<span class="rule-static">border-color: <xsl:value-of select="$border-color-fixed"/>; color: <xsl:value-of select="$border-color-fixed"/>;</span>
					<span class="rule-dynamic">
						<xsl:attribute name="data-type">border-radius</xsl:attribute>
						<xsl:attribute name="data-value">3px</xsl:attribute>
					</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-header-title</xsl:attribute>
					<span class="rule-static">color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-header-score-div</xsl:attribute>
					<span class="rule-static">background-color: <xsl:value-of select="$bg-color-fixed"/>; color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-text</xsl:attribute>
					<span class="rule-static">background-color: <xsl:value-of select="$bg-color-fixed"/>; border-color: <xsl:value-of select="$border-color-fixed"/>; color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-variants</xsl:attribute>
					<span class="rule-static">border-color: <xsl:value-of select="$border-color-fixed"/>; color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-answer-title</xsl:attribute>
					<span class="rule-static">color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-variants-table td</xsl:attribute>
					<span class="rule-static">border-color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-variants-header</xsl:attribute>
					<span class="rule-static">background-color: <xsl:value-of select="$bg-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-stats</xsl:attribute>
					<span class="rule-static">border-color: <xsl:value-of select="$border-color-fixed"/>; color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-results-q-stats-title</xsl:attribute>
					<span class="rule-static">color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-stats-obj-table td</xsl:attribute>
					<span class="rule-static">border-color: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-stats-obj-header</xsl:attribute>
					<span class="rule-static">background-color: <xsl:value-of select="$bg-color-fixed"/>;</span>
				</div>								
				<div class="rule">
					<xsl:attribute name="data-name">#<xsl:value-of select="$objectID"/> .cl-switch-group</xsl:attribute>
					<span class="rule-static">fill: <xsl:value-of select="$border-color-fixed"/>;</span>
				</div>								
			</xsl:when>
		</xsl:choose>
	</div>
	<div>
		<xsl:attribute name="class">container cl-theme-<xsl:value-of select="$theme"/> unselectable</xsl:attribute>
		<div>
			<xsl:attribute name="class">cl-outer</xsl:attribute>
			<div>
				<xsl:attribute name="class">cl-middle</xsl:attribute>
				<div>
					<xsl:attribute name="class">cl-inner</xsl:attribute>
					<xsl:choose>
						<xsl:when test="display_type='plain'">
							<xsl:choose>
								<xsl:when test="q_board=''"><xsl:value-of select="hidden.obj.not.defined"/></xsl:when>
								<xsl:otherwise>
									<table>
										<xsl:attribute name="class">cl-table-plain</xsl:attribute>
										<tr>
											<td>
												<xsl:attribute name="class">cl-table-plain-td</xsl:attribute>
												<xsl:variable name="_plain_text_1">
													<xsl:call-template name="string-replace">
														<xsl:with-param name="string" select="plain_text" />
														<xsl:with-param name="replace">{{1}}</xsl:with-param>
														<xsl:with-param name="with">
															<xsl:choose>
																<xsl:when test="plain_values='score'">50</xsl:when>
																<xsl:when test="plain_values='percent'">50%</xsl:when>
																<xsl:when test="plain_values='score_percent'">50 (50%)</xsl:when>
															</xsl:choose>
														</xsl:with-param>
													</xsl:call-template>						
												</xsl:variable>
												<xsl:variable name="_plain_text_2">
													<xsl:call-template name="string-replace">
														<xsl:with-param name="string" select="$_plain_text_1" />
														<xsl:with-param name="replace">{{2}}</xsl:with-param>
														<xsl:with-param name="with">
															<xsl:choose>
																<xsl:when test="plain_values='score'">100</xsl:when>
																<xsl:when test="plain_values='percent'">100%</xsl:when>
																<xsl:when test="plain_values='score_percent'">100 (100%)</xsl:when>
															</xsl:choose>
														</xsl:with-param>
													</xsl:call-template>						
												</xsl:variable>
												<xsl:value-of select="$_plain_text_2"/>
											</td>
										</tr>
									</table>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="display_type='scale'">
							<xsl:variable name="_scale_text_1">
								<xsl:call-template name="string-replace">
									<xsl:with-param name="string" select="scale_text" />
									<xsl:with-param name="replace">{{1}}</xsl:with-param>
									<xsl:with-param name="with">
										<xsl:choose>
											<xsl:when test="scale_values='score'">50</xsl:when>
											<xsl:when test="scale_values='percent'">50%</xsl:when>
											<xsl:when test="scale_values='score_percent'">50 (50%)</xsl:when>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>						
							</xsl:variable>
							<xsl:variable name="_scale_text_2">
								<xsl:call-template name="string-replace">
									<xsl:with-param name="string" select="$_scale_text_1" />
									<xsl:with-param name="replace">{{2}}</xsl:with-param>
									<xsl:with-param name="with">
										<xsl:choose>
											<xsl:when test="scale_values='score'">100</xsl:when>
											<xsl:when test="scale_values='percent'">100%</xsl:when>
											<xsl:when test="scale_values='score_percent'">100 (100%)</xsl:when>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>						
							</xsl:variable>
							<table>
								<xsl:attribute name="class">cl-table-scale</xsl:attribute>
								<tr>
									<td>
										<xsl:attribute name="class">cl-table-scale-td</xsl:attribute>
										<table>
											<xsl:attribute name="class">cl-table-scale-h</xsl:attribute>
											<xsl:for-each select="scoreboards/item">
												<tr>
													<td>
														<xsl:attribute name="class">cl-table-scale-h-desc cl-table-scale-h-desc-<xsl:value-of select="position()"/></xsl:attribute>
														<xsl:choose>
															<xsl:when test="scoreboard=''"><xsl:value-of select="hidden.obj.not.defined"/></xsl:when>
															<xsl:otherwise><xsl:value-of select="sb_text"/></xsl:otherwise>
														</xsl:choose>
													</td>
													<td>
														<xsl:attribute name="class">cl-table-scale-h-scale cl-table-scale-h-scale-<xsl:value-of select="position()"/></xsl:attribute>
														<div>
															<xsl:attribute name="class">cl-table-scale-h-div</xsl:attribute>
															<div>
																<xsl:attribute name="class">cl-table-scale-h-ind</xsl:attribute>
																&#160;
															</div>
														</div>
													</td>
													<td>
														<xsl:attribute name="class">cl-table-scale-h-value cl-table-scale-h-value-<xsl:value-of select="position()"/></xsl:attribute>
														<xsl:value-of select="$_scale_text_2"/>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:when test="display_type='detail'">
							<div>
								<xsl:attribute name="class">cl-results-container</xsl:attribute>
								<xsl:choose>
									<xsl:when test="count(objects/item)=0">
										<div>
											<xsl:attribute name="class">cl-results-q-no-objects</xsl:attribute>
											<xsl:value-of select="hidden.no.objects"/>
										</div>
									</xsl:when>
									<xsl:otherwise>
										&#160;
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:when>
					</xsl:choose>
				</div>
			</div>
		</div>
		<div>
			<xsl:attribute name="class">cl-template-storage</xsl:attribute>
			<div>
				<xsl:attribute name="class">cl-results-t-template cl-results-parent</xsl:attribute>
				<div>
					<xsl:attribute name="class">cl-results-t-header</xsl:attribute>
					<table>
						<xsl:attribute name="class">cl-results-header-table</xsl:attribute>
						<tr>
							<td>
								<xsl:attribute name="class">cl-results-header-switch-cell</xsl:attribute>
								<div>
									<xsl:attribute name="class">cl-switch</xsl:attribute>
									<svg>
										<xsl:attribute name="class">cl-switch</xsl:attribute>
										<xsl:attribute name="width">20</xsl:attribute>
										<xsl:attribute name="height">20</xsl:attribute>
										<xsl:attribute name="viewBox">0<xsl:text> </xsl:text>0<xsl:text> </xsl:text>48<xsl:text> </xsl:text>48</xsl:attribute>
										<g>
											<xsl:attribute name="class">cl-switch-group</xsl:attribute>
											<path>
												<xsl:attribute name="class">cl-switch-path-circle</xsl:attribute>
												<xsl:attribute name="d">M24,0C10.745,0,0,10.746,0,24c0,13.255,10.745,24,24,24s24-10.744,24-24C48,10.746,37.255,0,24,0z M24.029,43.844c-11.023,0-19.959-8.936-19.959-19.958S13.006,3.926,24.029,3.926c11.022,0,19.959,8.936,19.959,19.959 S35.052,43.844,24.029,43.844z</xsl:attribute>
											</path>
											<path>
												<xsl:attribute name="class">cl-switch-path-plus</xsl:attribute>
												<xsl:attribute name="d">M32.56,21.902h-6.458l0.008-6.576c-0.026-0.454-0.221-1.354-1.331-1.356L23.2,13.968 c-1.181-0.001-1.282,1.165-1.288,1.47l-0.008,6.463h-6.607c-1.22,0-1.323,0.941-1.328,1.21v1.809 c0.006,0.247,0.107,1.178,1.328,1.178h6.602l-0.008,6.602c-0.002,1.219,0.939,1.324,1.209,1.33l1.809,0.002 c0.247-0.006,1.178-0.107,1.18-1.326l0.008-6.607h6.581c0.454-0.027,1.354-0.223,1.354-1.333v-1.578 C34.031,22.007,32.865,21.908,32.56,21.902z</xsl:attribute>
											</path>
											<path>
												<xsl:attribute name="class">cl-switch-path-minus</xsl:attribute>
												<xsl:attribute name="d">M32.677,26.099c0.454-0.027,1.354-0.223,1.354-1.333v-1.578c0-1.181-1.166-1.28-1.472-1.286H15.297 c-1.22,0-1.323,0.941-1.328,1.21v1.809c0.006,0.247,0.108,1.178,1.328,1.178H32.677z</xsl:attribute>
											</path>
										</g>
									</svg>
								</div>
							</td>
							<td>
								<xsl:attribute name="class">cl-results-header-title</xsl:attribute>
								<xsl:value-of select="hidden.question_header"/>
							</td>
							<td>
								<xsl:attribute name="class">cl-results-na</xsl:attribute>
								<xsl:value-of select="text_constant_nodata"/>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<xsl:attribute name="class">cl-results-contents cl-results-t-contents</xsl:attribute>
				</div>
			</div>
	
			<div>
				<xsl:attribute name="class">cl-results-q-template cl-results-parent</xsl:attribute>
				<div>
					<xsl:attribute name="class">cl-results-header</xsl:attribute>
					<table>
						<xsl:attribute name="class">cl-results-header-table</xsl:attribute>
						<tr>
							<td>
								<xsl:attribute name="class">cl-results-header-switch-cell</xsl:attribute>														
								<div>
									<xsl:attribute name="class">cl-switch</xsl:attribute>
									<svg>
										<xsl:attribute name="class">cl-switch</xsl:attribute>
										<xsl:attribute name="width">20</xsl:attribute>
										<xsl:attribute name="height">20</xsl:attribute>
										<xsl:attribute name="viewBox">0<xsl:text> </xsl:text>0<xsl:text> </xsl:text>48<xsl:text> </xsl:text>48</xsl:attribute>
										<g>
											<xsl:attribute name="class">cl-switch-group</xsl:attribute>
											<path>
												<xsl:attribute name="class">cl-switch-path-circle</xsl:attribute>
												<xsl:attribute name="d">M24,0C10.745,0,0,10.746,0,24c0,13.255,10.745,24,24,24s24-10.744,24-24C48,10.746,37.255,0,24,0z M24.029,43.844c-11.023,0-19.959-8.936-19.959-19.958S13.006,3.926,24.029,3.926c11.022,0,19.959,8.936,19.959,19.959 S35.052,43.844,24.029,43.844z</xsl:attribute>
											</path>
											<path>
												<xsl:attribute name="class">cl-switch-path-plus</xsl:attribute>
												<xsl:attribute name="d">M32.56,21.902h-6.458l0.008-6.576c-0.026-0.454-0.221-1.354-1.331-1.356L23.2,13.968 c-1.181-0.001-1.282,1.165-1.288,1.47l-0.008,6.463h-6.607c-1.22,0-1.323,0.941-1.328,1.21v1.809 c0.006,0.247,0.107,1.178,1.328,1.178h6.602l-0.008,6.602c-0.002,1.219,0.939,1.324,1.209,1.33l1.809,0.002 c0.247-0.006,1.178-0.107,1.18-1.326l0.008-6.607h6.581c0.454-0.027,1.354-0.223,1.354-1.333v-1.578 C34.031,22.007,32.865,21.908,32.56,21.902z</xsl:attribute>
											</path>
											<path>
												<xsl:attribute name="class">cl-switch-path-minus</xsl:attribute>
												<xsl:attribute name="d">M32.677,26.099c0.454-0.027,1.354-0.223,1.354-1.333v-1.578c0-1.181-1.166-1.28-1.472-1.286H15.297 c-1.22,0-1.323,0.941-1.328,1.21v1.809c0.006,0.247,0.108,1.178,1.328,1.178H32.677z</xsl:attribute>
											</path>
										</g>
									</svg>
								</div>
							</td>
							<td>
								<xsl:attribute name="class">cl-results-header-title</xsl:attribute>
								<xsl:value-of select="hidden.question_header"/>
							</td>
							<td>
								<xsl:attribute name="class">cl-results-na</xsl:attribute>
								<xsl:value-of select="text_constant_nodata"/>
							</td>
							<xsl:if test="display_main_score='yes'">
								<td>
									<xsl:attribute name="class">cl-results-header-score</xsl:attribute>
									<div>
										<xsl:attribute name="class">cl-results-header-score-div</xsl:attribute>
										0
									</div>
								</td>
							</xsl:if>
						</tr>
					</table>
				</div>
				
				<div>
					<xsl:attribute name="class">cl-results-contents</xsl:attribute>
					<xsl:if test="display_questiontext='yes'">
						<div>
							<xsl:attribute name="class">cl-results-q-text</xsl:attribute>
							<xsl:value-of select="hidden.question_text"/>
						</div>
					</xsl:if>
					<xsl:if test="display_statistics='yes'">
						<div>
							<xsl:attribute name="class">cl-results-stats cl-results-parent</xsl:attribute>
							<div>
								<xsl:attribute name="class">cl-stats-header</xsl:attribute>
								<table>
									<xsl:attribute name="class">cl-results-header-table</xsl:attribute>
									<tr>
										<td>
											<xsl:attribute name="class">cl-results-header-switch-cell</xsl:attribute>
											<div>
												<xsl:attribute name="class">cl-switch</xsl:attribute>
												<svg>
													<xsl:attribute name="class">cl-switch</xsl:attribute>
													<xsl:attribute name="width">20</xsl:attribute>
													<xsl:attribute name="height">20</xsl:attribute>
													<xsl:attribute name="viewBox">0<xsl:text> </xsl:text>0<xsl:text> </xsl:text>48<xsl:text> </xsl:text>48</xsl:attribute>
													<g>
														<xsl:attribute name="class">cl-switch-group</xsl:attribute>
														<path>
															<xsl:attribute name="class">cl-switch-path-circle</xsl:attribute>
															<xsl:attribute name="d">M24,0C10.745,0,0,10.746,0,24c0,13.255,10.745,24,24,24s24-10.744,24-24C48,10.746,37.255,0,24,0z M24.029,43.844c-11.023,0-19.959-8.936-19.959-19.958S13.006,3.926,24.029,3.926c11.022,0,19.959,8.936,19.959,19.959 S35.052,43.844,24.029,43.844z</xsl:attribute>
														</path>
														<path>
															<xsl:attribute name="class">cl-switch-path-plus</xsl:attribute>
															<xsl:attribute name="d">M32.56,21.902h-6.458l0.008-6.576c-0.026-0.454-0.221-1.354-1.331-1.356L23.2,13.968 c-1.181-0.001-1.282,1.165-1.288,1.47l-0.008,6.463h-6.607c-1.22,0-1.323,0.941-1.328,1.21v1.809 c0.006,0.247,0.107,1.178,1.328,1.178h6.602l-0.008,6.602c-0.002,1.219,0.939,1.324,1.209,1.33l1.809,0.002 c0.247-0.006,1.178-0.107,1.18-1.326l0.008-6.607h6.581c0.454-0.027,1.354-0.223,1.354-1.333v-1.578 C34.031,22.007,32.865,21.908,32.56,21.902z</xsl:attribute>
														</path>
														<path>
															<xsl:attribute name="class">cl-switch-path-minus</xsl:attribute>
															<xsl:attribute name="d">M32.677,26.099c0.454-0.027,1.354-0.223,1.354-1.333v-1.578c0-1.181-1.166-1.28-1.472-1.286H15.297 c-1.22,0-1.323,0.941-1.328,1.21v1.809c0.006,0.247,0.108,1.178,1.328,1.178H32.677z</xsl:attribute>
														</path>
													</g>
												</svg>
											</div>
										</td>
										<td>
											<xsl:attribute name="class">cl-results-header-title</xsl:attribute>
											<xsl:value-of select="text_constant_statistics"/>
										</td>
									</tr>
								</table>
							</div>
							<div>
								<xsl:attribute name="class">cl-results-contents</xsl:attribute>
								<table>
									<xsl:attribute name="class">cl-stats-table</xsl:attribute>
									<tr>
										<td>
											<xsl:attribute name="class">cl-stats-left</xsl:attribute>
											<div>
												<xsl:attribute name="class">cl-stats-q-type</xsl:attribute>
												<xsl:value-of select="text_objecttype_choice"/>
											</div>
											<div>
												<xsl:attribute name="class">cl-stats-q-scoring</xsl:attribute>
												<xsl:value-of select="text_constant_scoringtype"/> <xsl:value-of select="text_scoringtype_plain"/>
											</div>
											<xsl:if test="display_attempts='yes'">
												<div>
													<xsl:attribute name="class">cl-stats-q-attempts</xsl:attribute>
													<xsl:value-of select="text_constant_attemptsmax"/> 0<br/><xsl:value-of select="text_constant_attemptsleft"/> 0
												</div>
											</xsl:if>
											<xsl:if test="display_timers='yes'">
												<div>
													<xsl:attribute name="class">cl-stats-q-timing</xsl:attribute>
													<xsl:value-of select="text_constant_duration"/> 0<br/><xsl:value-of select="text_constant_latency"/> 0
												</div>
											</xsl:if>
										</td>
										<xsl:if test="display_scores='yes'">
											<td>
												<xsl:attribute name="class">cl-stats-right</xsl:attribute>
												<table>
													<xsl:attribute name="class">cl-stats-obj-table</xsl:attribute>
													<tr>
														<td>
															<xsl:attribute name="class">cl-stats-obj-obj cl-stats-obj-header</xsl:attribute>
															<xsl:value-of select="text_constant_objectives"/>
														</td>
														<td>
															<xsl:attribute name="class">cl-stats-obj-score cl-stats-obj-header</xsl:attribute>
															<xsl:value-of select="text_constant_score"/>
														</td>
													</tr>
												</table>
											</td>
										</xsl:if>
									</tr>
								</table>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="display_variants='yes'">
						<div>
							<xsl:attribute name="class">cl-results-variants cl-results-parent</xsl:attribute>
							<div>
								<xsl:attribute name="class">cl-variants-header</xsl:attribute>
								<table>
									<xsl:attribute name="class">cl-results-header-table</xsl:attribute>
									<tr>
										<td>
											<xsl:attribute name="class">cl-results-header-switch-cell</xsl:attribute>
											<div>
												<xsl:attribute name="class">cl-switch</xsl:attribute>
												<svg>
													<xsl:attribute name="class">cl-switch</xsl:attribute>
													<xsl:attribute name="width">20</xsl:attribute>
													<xsl:attribute name="height">20</xsl:attribute>
													<xsl:attribute name="viewBox">0<xsl:text> </xsl:text>0<xsl:text> </xsl:text>48<xsl:text> </xsl:text>48</xsl:attribute>
													<g>
														<xsl:attribute name="class">cl-switch-group</xsl:attribute>
														<path>
															<xsl:attribute name="class">cl-switch-path-circle</xsl:attribute>
															<xsl:attribute name="d">M24,0C10.745,0,0,10.746,0,24c0,13.255,10.745,24,24,24s24-10.744,24-24C48,10.746,37.255,0,24,0z M24.029,43.844c-11.023,0-19.959-8.936-19.959-19.958S13.006,3.926,24.029,3.926c11.022,0,19.959,8.936,19.959,19.959 S35.052,43.844,24.029,43.844z</xsl:attribute>
														</path>
														<path>
															<xsl:attribute name="class">cl-switch-path-plus</xsl:attribute>
															<xsl:attribute name="d">M32.56,21.902h-6.458l0.008-6.576c-0.026-0.454-0.221-1.354-1.331-1.356L23.2,13.968 c-1.181-0.001-1.282,1.165-1.288,1.47l-0.008,6.463h-6.607c-1.22,0-1.323,0.941-1.328,1.21v1.809 c0.006,0.247,0.107,1.178,1.328,1.178h6.602l-0.008,6.602c-0.002,1.219,0.939,1.324,1.209,1.33l1.809,0.002 c0.247-0.006,1.178-0.107,1.18-1.326l0.008-6.607h6.581c0.454-0.027,1.354-0.223,1.354-1.333v-1.578 C34.031,22.007,32.865,21.908,32.56,21.902z</xsl:attribute>
														</path>
														<path>
															<xsl:attribute name="class">cl-switch-path-minus</xsl:attribute>
															<xsl:attribute name="d">M32.677,26.099c0.454-0.027,1.354-0.223,1.354-1.333v-1.578c0-1.181-1.166-1.28-1.472-1.286H15.297 c-1.22,0-1.323,0.941-1.328,1.21v1.809c0.006,0.247,0.108,1.178,1.328,1.178H32.677z</xsl:attribute>
														</path>
													</g>
												</svg>
											</div>
										</td>
										<td>
											<xsl:attribute name="class">cl-results-header-title</xsl:attribute>
											<xsl:value-of select="text_constant_results"/>
										</td>
									</tr>
								</table>
							</div>
							<div>
								<xsl:attribute name="class">cl-results-contents</xsl:attribute>
							</div>
						</div>
					</xsl:if>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

<!-- COMMON TEMPLATES -->
<xsl:template name="string-replace">
    <xsl:param name="string" />
    <xsl:param name="replace" />
    <xsl:param name="with" />
    <xsl:choose>
        <xsl:when test="contains($string, $replace)">
            <xsl:value-of select="substring-before($string, $replace)" />
            <xsl:value-of select="$with" />
            <xsl:call-template name="string-replace">
                <xsl:with-param name="string" select="substring-after($string,$replace)" />
                <xsl:with-param name="replace" select="$replace" />
                <xsl:with-param name="with" select="$with" />
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$string" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
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

