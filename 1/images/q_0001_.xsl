<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:websoft="http://www.websoft.ru" version="1.0">
<!--
'*	q_0001_.xsl
'*	Copyright (c) Websoft.  All rights reserved.
-->

<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>
<xsl:param name="moduleImagesFolder"></xsl:param>
<xsl:param name="imagesFolder"></xsl:param>
<xsl:param name="objectID"></xsl:param>
<xsl:param name="width"></xsl:param>
<xsl:param name="height"></xsl:param>

<xsl:template match="/"><xsl:apply-templates select="params"/></xsl:template>
<xsl:template match="params">
	<xsl:call-template name="styles"><xsl:with-param name="bDesign">yes</xsl:with-param></xsl:call-template>
	<div>
		<xsl:attribute name="class">clo-q_0001</xsl:attribute>
		<div>
			<xsl:attribute name="class">container cl-theme-<xsl:value-of select="theme"/></xsl:attribute>
			<div>
				<xsl:attribute name="class">wrapper</xsl:attribute>
				<div>
					<xsl:attribute name="class">cl-t-container</xsl:attribute>
					<div>
						<xsl:attribute name="class">cl-t-wrapper</xsl:attribute>
						<xsl:call-template name="t-header"/>
						<xsl:call-template name="t-workarea"/>
						<xsl:call-template name="t-footer"/>
					</div>
				</div>
			</div>
		</div>
		<xsl:if test="q_display_fb_correct='yes' and q_fb_correct_preview='yes'">
			<xsl:call-template name="feedback">
				<xsl:with-param name="sReason">correct</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="q_display_fb_incorrect='yes' and q_fb_incorrect_preview='yes'">
			<xsl:call-template name="feedback">
				<xsl:with-param name="sReason">incorrect</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="q_display_fb_lastattempt='yes' and q_fb_lastattempt_preview='yes'">
			<xsl:call-template name="feedback">
				<xsl:with-param name="sReason">lastattempt</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="q_display_fb_exceed='yes' and q_fb_exceed_preview='yes'">
			<xsl:call-template name="feedback">
				<xsl:with-param name="sReason">exceed</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="q_display_fb_timeout='yes' and q_fb_timeout_preview='yes'">
			<xsl:call-template name="feedback">
				<xsl:with-param name="sReason">timeout</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</div>
<script>
function Adjust()
{
	if('<xsl:value-of select="display_type"/>'=='list')
	{
		var oContainer = document.getElementsByClassName('cl-t-container')[0];
		var oHeader = document.getElementsByClassName('cl-t-header')[0];
		var oWA = document.getElementsByClassName('cl-t-workarea')[0];
		var oFooter = document.getElementsByClassName('cl-t-footer')[0];
		var iFullH = parseInt('<xsl:value-of select="$height"/>', 10);
		var iBorder = parseInt(window.getComputedStyle(oContainer, null).getPropertyValue('border-top-width'), 10) + parseInt(window.getComputedStyle(oContainer, null).getPropertyValue('border-bottom-width'), 10);
		iBorder += parseInt(window.getComputedStyle(oHeader, null).getPropertyValue('border-top-width'), 10) + parseInt(window.getComputedStyle(oHeader, null).getPropertyValue('border-bottom-width'), 10);
		iBorder += parseInt(window.getComputedStyle(oWA, null).getPropertyValue('border-top-width'), 10) + parseInt(window.getComputedStyle(oWA, null).getPropertyValue('border-bottom-width'), 10);
		iBorder += parseInt(window.getComputedStyle(oFooter, null).getPropertyValue('border-top-width'), 10) + parseInt(window.getComputedStyle(oFooter, null).getPropertyValue('border-bottom-width'), 10);
		var iPadding = parseInt(window.getComputedStyle(oWA, null).getPropertyValue('padding-top'), 10) + parseInt(window.getComputedStyle(oWA, null).getPropertyValue('padding-bottom'), 10);
		var iH = iFullH - oHeader.offsetHeight - oFooter.offsetHeight - iPadding - iBorder;
		oWA.style.height = iH + 'px';
	}
	var aOTO = document.getElementsByClassName('oto-table');
	var aInner;
	var iTxtH;
	var iMaxH;
	var iIdx;
	var iCnt = 0;
	while(aOTO[iCnt]!=null)
	{
		iMaxH = 0;
		iIdx = 0;
		aInner = aOTO[iCnt].getElementsByClassName('cell-to-adjust');
		while(aInner[iIdx]!=null)
		{
			iTxtH = parseInt(window.getComputedStyle(aInner[iIdx], null).getPropertyValue('height'), 10);
			if(Math.abs(iMaxH - iTxtH) != (iMaxH - iTxtH))
			{
				iMaxH = iTxtH;
			}
			iIdx++;
		}
		iIdx = 0;
		while(aInner[iIdx]!=null)
		{
			aInner[iIdx].style.height = iMaxH + 'px';
			iIdx++;
		}
		iCnt++;
	}
	if('<xsl:value-of select="display_type"/>'=='page')
	{
		if('<xsl:value-of select="adjust_height"/>'=='yes')
		{
			var oWA = document.getElementsByClassName('cl-t-workarea')[0];
			var aQuestions = document.getElementsByClassName('q-question');
			iMaxH = 0;
			iCnt = 0;
			var iQH = 0;
			while(aQuestions[iCnt]!=null)
			{
				iQH = parseInt(window.getComputedStyle(aQuestions[iCnt], null).getPropertyValue('height'), 10);
				if(Math.abs(iMaxH - iQH) != (iMaxH - iQH))
				{
					iMaxH = iQH;
				}
				if(aQuestions[iCnt].style.visibility=='hidden')
				{
					aQuestions[iCnt].style.display = 'none';
				}
				iCnt++;
			}
			oWA.style.height = iMaxH + 'px';
		}
	}
}
</script>
</xsl:template>

<xsl:template name="styles">
	<xsl:param name="bDesign"/>

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
	<xsl:variable name="spot-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="spot_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="font_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-correct-color-bg-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_correct_color_bg"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-correct-color-border-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_correct_color_border"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-correct-color-close-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_correct_color_close"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-incorrect-color-bg-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_incorrect_color_bg"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-incorrect-color-border-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_incorrect_color_border"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-incorrect-color-close-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_incorrect_color_close"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-lastattempt-color-bg-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_lastattempt_color_bg"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-lastattempt-color-border-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_lastattempt_color_border"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-lastattempt-color-close-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_lastattempt_color_close"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-exceed-color-bg-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_exceed_color_bg"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-exceed-color-border-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_exceed_color_border"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-exceed-color-close-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_exceed_color_close"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-timeout-color-bg-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_timeout_color_bg"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-timeout-color-border-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_timeout_color_border"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="q-fb-timeout-color-close-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="q_fb_timeout_color_close"/>
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
	<xsl:variable name="_fill_color" select="$bg-color-fixed"/>
	<xsl:variable name="_gradient_color">
		<xsl:call-template name="autogradient">
			<xsl:with-param name="color.base" select="$_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="_font_color">
		<xsl:choose>
			<xsl:when test="font_color_switch='yes'"><xsl:value-of select="$font-color-fixed"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$border-color-fixed"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_border_gradient_color">
		<xsl:call-template name="autogradient">
			<xsl:with-param name="color.base" select="$border-color-fixed"/>
		</xsl:call-template>
	</xsl:variable>
	
	<xsl:variable name="main.sSpotColor">
		<xsl:choose>
			<xsl:when test="spot_color_switch='yes'"><xsl:value-of select="$spot-color-fixed"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$border-color-fixed"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_spot_gradient_color">
		<xsl:call-template name="autogradient">
			<xsl:with-param name="color.base" select="$main.sSpotColor"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="_timer_gradient_color">
		<xsl:call-template name="autogradient">
			<xsl:with-param name="color.base" select="timer_color_1"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="_btn_bg_color" select="$border-color-fixed"/>
	<xsl:variable name="_btn_gradient_color">
		<xsl:call-template name="autogradient">
			<xsl:with-param name="color.base" select="$_btn_bg_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="_basic_font_family">
		<xsl:choose>
			<xsl:when test="basic_font='custom'"><xsl:value-of select="basic_font_custom"/></xsl:when>
			<xsl:otherwise><xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="basic_font"/></xsl:call-template></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_button_font_family">
		<xsl:choose>
			<xsl:when test="q_custombutton='yes' and q_button_type='HTML'">
				<xsl:choose>
					<xsl:when test="button_font='custom'"><xsl:value-of select="button_font_custom"/></xsl:when>
					<xsl:otherwise><xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="button_font"/></xsl:call-template></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$_basic_font_family"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="main.fb_left">
		<xsl:choose>
			<xsl:when test="q_fb_position='yes'"><xsl:value-of select="q_fb_left"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="round(0.5*(100-number(q_fb_box_width)))"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="main.fb_top">
		<xsl:choose>
			<xsl:when test="q_fb_position='yes'"><xsl:value-of select="q_fb_top"/></xsl:when>
			<xsl:otherwise>30</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<style>
		.container { width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="$height"/>px; }
		.cl-t-workarea { border-color: <xsl:value-of select="$border-color-fixed"/>; <xsl:choose><xsl:when test="display_type='list'">overflow: auto;</xsl:when><xsl:when test="display_type='page'"></xsl:when></xsl:choose> }
		.cl-t-header-table td { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; }
		.cl-t-footer-table td { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; }
		.cl-t-footer-btn { border-color: <xsl:value-of select="$border-color-fixed"/>; font-family: <xsl:value-of select="$_button_font_family"/>; }

		.var-true-false .spot { border-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 50%; }
		.var-selected .var-true-false .spot-point { background-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 50%; }

		.var-choice .spot { border-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 50%; }
		.var-selected .var-choice .spot-point { background-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 50%; }

		.var-select .spot { border-color: <xsl:value-of select="$border-color-fixed"/>; }
		.var-select .inner-part { fill: <xsl:value-of select="$border-color-fixed"/>; }

		.var-numeric .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$border-color-fixed"/>; }

		.var-fib .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$border-color-fixed"/>; }

		.var-target { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$border-color-fixed"/>; }
		.var-bullet { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$border-color-fixed"/>; }

		.q-feedback { width: <xsl:value-of select="q_fb_box_width"/>%; left: <xsl:value-of select="$main.fb_left"/>%; top: <xsl:value-of select="$main.fb_top"/>%; border-radius: 5px; box-shadow: <xsl:value-of select="$_shadow_string"/>; }
		.q-feedback-correct { background-color: <xsl:value-of select="$q-fb-correct-color-bg-fixed"/>; border-color: <xsl:value-of select="$q-fb-correct-color-border-fixed"/>; color: <xsl:value-of select="$q-fb-correct-color-close-fixed"/>; }
		.q-feedback-lastattempt { background-color: <xsl:value-of select="$q-fb-lastattempt-color-bg-fixed"/>; border-color: <xsl:value-of select="$q-fb-lastattempt-color-border-fixed"/>; color: <xsl:value-of select="$q-fb-lastattempt-color-close-fixed"/>; }
		.q-feedback-incorrect { background-color: <xsl:value-of select="$q-fb-incorrect-color-bg-fixed"/>; border-color: <xsl:value-of select="$q-fb-incorrect-color-border-fixed"/>; color: <xsl:value-of select="$q-fb-incorrect-color-close-fixed"/>; }
		.q-feedback-exceed { background-color: <xsl:value-of select="$q-fb-exceed-color-bg-fixed"/>; border-color: <xsl:value-of select="$q-fb-exceed-color-border-fixed"/>; color: <xsl:value-of select="$q-fb-exceed-color-close-fixed"/>; }
		.q-feedback-timeout { background-color: <xsl:value-of select="$q-fb-timeout-color-bg-fixed"/>; border-color: <xsl:value-of select="$q-fb-timeout-color-border-fixed"/>; color: <xsl:value-of select="$q-fb-timeout-color-close-fixed"/>; }
		.q-feedback-btn { font-family: <xsl:value-of select="$_basic_font_family"/>; }

		<xsl:if test="q_text_padding_override='yes'">.q-question-txt { padding: <xsl:value-of select="q_text_padding"/>px !important; }</xsl:if>
		<xsl:if test="q_item_padding_override='yes'">
			.var-true-false, .var-choice, .var-select, .var-order, .var-numeric, .var-fib { padding: <xsl:value-of select="q_item_padding"/>px !important; }
		</xsl:if>
		<xsl:if test="q_base_override='yes'">
			.oto-table .left-part { width: <xsl:value-of select="q_base_width"/>% !important; }
			.oto-table .right-part { width: <xsl:value-of select="(100-number(q_base_width))"/>% !important; }
			.oto-table .var-target { padding: <xsl:value-of select="q_base_padding"/>px !important; }
			.oto-table .var-bullet { padding: <xsl:value-of select="q_base_padding"/>px !important; }
		</xsl:if>
		<xsl:choose>
			<xsl:when test="theme='light'">
				.cl-theme-light .cl-t-container { border-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 15px; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); box-shadow: <xsl:value-of select="$_shadow_string"/>;  }
				.cl-theme-light .cl-t-header { border-radius: 15px 15px 0 0; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-light .cl-t-workarea { background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-light .cl-t-footer { border-radius: 0 0 15px 15px; background-image: linear-gradient(180deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-light .rnd-timer-main { border-color: <xsl:value-of select="$_font_color"/>; border-radius: 50%; }
				.cl-theme-light .rnd-timer-svg-full { fill: <xsl:value-of select="$_font_color"/>; }
				.cl-theme-light .cl-t-progress .cl-t-progress-item-btn { border-color: <xsl:value-of select="$_font_color"/>; border-radius: 2px; }
				.cl-theme-light .cl-current .cl-t-progress-item-btn { background-color: <xsl:value-of select="$_font_color"/>; }
				.cl-theme-light .cl-visited .cl-t-progress-item-btn { background-color: <xsl:value-of select="$_spot_gradient_color"/>; }
				.cl-theme-light .cl-unvisited .cl-t-progress-item-btn { background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-light .cl-t-footer-btn { border-radius: 5px; color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }

				.cl-theme-light .q-question { <xsl:choose><xsl:when test="display_type='list'">margin: 0 0 10px 0;</xsl:when><xsl:when test="display_type='page'">margin: 0;</xsl:when></xsl:choose> }
				<xsl:if test="display_type='list'">.cl-theme-light .q-question-number { padding: 0 10px 5px 10px; text-align: center; color: <xsl:value-of select="$_font_color"/>; font-family: <xsl:value-of select="$_basic_font_family"/>; font-size: 11px; }</xsl:if>
				.cl-theme-light .q-question-txt { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$bg-color-fixed"/>; <xsl:choose><xsl:when test="display_type='list'">border-radius: 10px 10px 0 0;</xsl:when><xsl:when test="display_type='page'">border-radius: 10px;</xsl:when></xsl:choose> }
				.cl-theme-light .q-question-goal { <xsl:choose><xsl:when test="display_type='list'">padding: 5px 15px 0 15px; border-style: none solid none solid; border-width: 0 1px 0 1px; border-color: <xsl:value-of select="$border-color-fixed"/>;</xsl:when><xsl:when test="display_type='page'">padding: 5px 15px;</xsl:when></xsl:choose>font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; }
				.cl-theme-light .q-vars { background-color: <xsl:value-of select="$base-color-fixed"/>; <xsl:choose><xsl:when test="display_type='list'">border-style: none solid solid solid; border-width: 0 1px 1px 1px; border-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 0 0 10px 10px; padding: 5px 15px 15px 15px;</xsl:when><xsl:when test="display_type='page'">padding: 0;</xsl:when></xsl:choose> }

				.cl-theme-light .var-true-false .spot { border-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-light .var-selected .var-true-false .spot-point { background-color: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-light .var-choice .spot { border-color: <xsl:value-of select="$main.sSpotColor"/>;  }
				.cl-theme-light .var-selected .var-choice .spot-point { background-color: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-light .var-select .spot { border-color: <xsl:value-of select="$main.sSpotColor"/>; border-width: 1px; border-radius: 5px; }
				.cl-theme-light .var-select .inner-part { fill: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-light .var-order .inner-part { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$main.sSpotColor"/>; }
				
				.cl-theme-light .var-numeric .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 5px; }

				.cl-theme-light .var-fib .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>;  border-radius: 5px; }

				.cl-theme-light .oto-connector { border-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-light .var-target { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 5px; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-light .var-bullet { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 5px; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }

			</xsl:when>
			<xsl:when test="theme='standard'">
				.cl-theme-standard .cl-t-container { border-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 10px; background-color: <xsl:value-of select="$base-color-fixed"/>; box-shadow: <xsl:value-of select="$_shadow_string"/>; }
				.cl-theme-standard .cl-t-header { border-radius: 10px 10px 0 0; }
				.cl-theme-standard .cl-t-workarea { padding: 10px; border-style: dotted none; border-width: 1px; <xsl:choose><xsl:when test="display_type='list'">background-color: <xsl:value-of select="$bg-color-fixed"/>;</xsl:when><xsl:when test="display_type='page'">background-color: <xsl:value-of select="$base-color-fixed"/>;</xsl:when></xsl:choose> }
				.cl-theme-standard .cl-t-footer { border-radius: 0 0 10px 10px; }
				.cl-theme-standard .cl-t-timer .cl-t-timer-bar { border-radius: 4px; background-image: linear-gradient(0deg, #ccc, #666); }
				.cl-theme-standard .cl-t-progress .cl-t-progress-item-btn { border-color: <xsl:value-of select="$_font_color"/>; border-radius: 50%; }
				.cl-theme-standard .cl-current .cl-t-progress-item-btn { background-color: <xsl:value-of select="$_font_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_btn_bg_color"/>, <xsl:value-of select="$_btn_gradient_color"/>); }
				.cl-theme-standard .cl-visited .cl-t-progress-item-btn { background-color: <xsl:value-of select="$_spot_gradient_color"/>; }
				.cl-theme-standard .cl-unvisited .cl-t-progress-item-btn { background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-standard .cl-t-footer-btn { border-radius: 5px; color: <xsl:value-of select="$base-color-fixed"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$border-color-fixed"/>, <xsl:value-of select="$_btn_gradient_color"/>); }
				.cl-theme-standard .cl-t-timer .cl-t-timer-scale { border-radius: 4px; background-color: <xsl:value-of select="$_font_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_font_color"/>, <xsl:value-of select="$_btn_gradient_color"/>); }
				.cl-theme-standard .cl-q-timer .cl-q-timer-bar { border-radius: 4px; background-image: linear-gradient(0deg, #ccc, #666); }
				.cl-theme-standard .cl-q-timer .cl-q-timer-scale { border-radius: 4px; background-color: <xsl:value-of select="$_font_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_font_color"/>, <xsl:value-of select="$_btn_gradient_color"/>); }

				.cl-theme-standard .q-question { <xsl:choose><xsl:when test="display_type='list'">margin: 0 0 10px 0; border: solid 1px <xsl:value-of select="$border-color-fixed"/>; </xsl:when><xsl:when test="display_type='page'">margin: 0; </xsl:when></xsl:choose> background-color: <xsl:value-of select="$base-color-fixed"/>; }
				<xsl:if test="display_type='list'">.cl-theme-standard .q-question-number { position: relative; padding: 4px 5px 5px 5px; background-color: <xsl:value-of select="$border-color-fixed"/>; color: <xsl:value-of select="$base-color-fixed"/>; font-family: <xsl:value-of select="$_basic_font_family"/>; font-size: 11px; }</xsl:if>
				.cl-theme-standard .q-question-txt { margin: 10px; padding: 10px; background-color: <xsl:value-of select="$bg-color-fixed"/>; border-radius: 10px; }
				.cl-theme-standard .q-question-goal { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; }
				.cl-theme-standard .q-vars { padding: 10px; }

				.cl-theme-standard .var-true-false { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-radius: 5px; border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-standard .var-true-false .spot { border-color: <xsl:value-of select="$main.sSpotColor"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; border-radius: 50%; }
				.cl-theme-standard .var-selected .var-true-false .spot-point { background-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 50%; }
				.cl-theme-standard .var-selected .spot-point { background-image: linear-gradient(0deg, <xsl:value-of select="$main.sSpotColor"/>, <xsl:value-of select="$_spot_gradient_color"/>); }

				.cl-theme-standard .var-choice { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-radius: 5px; border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-standard .var-choice .spot { background-color: <xsl:value-of select="$base-color-fixed"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 50%; }
				.cl-theme-standard .var-selected .var-choice .spot-point { background-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 50%; }
				.cl-theme-standard .var-selected .spot-point { background-image: linear-gradient(0deg, <xsl:value-of select="$main.sSpotColor"/>, <xsl:value-of select="$_spot_gradient_color"/>); }
				
				.cl-theme-standard .var-select { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-radius: 5px; border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-standard .var-select .spot { background-color: <xsl:value-of select="$base-color-fixed"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-standard .var-select .inner-part { fill: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-standard .var-order { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-radius: 5px; border: solid 1px <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-standard .var-order .inner-part { fill: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-standard .var-numeric { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-radius: 5px; border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-standard .var-numeric .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 5px; }

				.cl-theme-standard .var-fib { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-radius: 5px; border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-standard .var-fib .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 5px; }

				.cl-theme-standard .oto-connector { background-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-standard .var-target { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 5px; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-standard .var-bullet { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 5px; background-color: <xsl:value-of select="$_fill_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }

			</xsl:when>
			<xsl:when test="theme='simple'">
				.cl-theme-simple .cl-t-header { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; box-shadow: <xsl:value-of select="$_shadow_string"/>; box-shadow: <xsl:value-of select="$_shadow_string"/>; }
				.cl-theme-simple .cl-t-workarea { padding: 0; background-color: <xsl:value-of select="$base-color-fixed"/>; box-shadow: <xsl:value-of select="$_shadow_string"/>; }
				.cl-theme-simple .cl-t-footer { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$_fill_color"/>; box-shadow: <xsl:value-of select="$_shadow_string"/>; }
				.cl-theme-simple .cl-t-timer .cl-t-timer-bar { border-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 1px; background-image: linear-gradient(0deg, #ccc, #666); }
				.cl-theme-simple .cl-t-progress .cl-t-progress-item-btn { border-color: <xsl:value-of select="$_font_color"/>; border-radius: 1px; }
				.cl-theme-simple .cl-current .cl-t-progress-item-btn { background-color: <xsl:value-of select="$_font_color"/>; }
				.cl-theme-simple .cl-visited .cl-t-progress-item-btn { background-color: <xsl:value-of select="$_spot_gradient_color"/>; }
				.cl-theme-simple .cl-unvisited .cl-t-progress-item-btn { background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-simple .cl-t-footer-btn { border-radius: 2px; font-size: 0.9em; color: <xsl:value-of select="$border-color-fixed"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_fill_color"/>, <xsl:value-of select="$_gradient_color"/>); }
				.cl-theme-simple .cl-t-timer .cl-t-timer-scale { border-radius: 1px; background-color: <xsl:value-of select="$_font_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_font_color"/>, <xsl:value-of select="$_btn_gradient_color"/>); }
				.cl-theme-simple .cl-q-timer .cl-q-timer-bar { border-color: <xsl:value-of select="$border-color-fixed"/>; border-radius: 1px; background-image: linear-gradient(0deg, #ccc, #666); }
				.cl-theme-simple .cl-q-timer .cl-q-timer-scale { border-radius: 1px; background-color: <xsl:value-of select="$_font_color"/>; background-image: linear-gradient(0deg, <xsl:value-of select="$_font_color"/>, <xsl:value-of select="$_btn_gradient_color"/>); }

				.cl-theme-simple .q-question { <xsl:choose><xsl:when test="display_type='list'">margin: 0 0 10px 0;</xsl:when><xsl:when test="display_type='page'">margin: 0;</xsl:when></xsl:choose> background-color: <xsl:value-of select="$base-color-fixed"/>; }
				<xsl:if test="display_type='list'">.cl-theme-simple .q-question-number { padding: 4px 5px 5px 5px; background-color: <xsl:value-of select="$border-color-fixed"/>; color: <xsl:value-of select="$base-color-fixed"/>; font-family: <xsl:value-of select="$_basic_font_family"/>; font-size: 11px; }</xsl:if>
				.cl-theme-simple .q-question-txt { <xsl:choose><xsl:when test="display_type='list'">margin: 10px; border: solid 2px <xsl:value-of select="$border-color-fixed"/>;</xsl:when><xsl:when test="display_type='page'">margin: 0 0 10px 0;</xsl:when></xsl:choose> background-color: <xsl:value-of select="$bg-color-fixed"/>; }
				.cl-theme-simple .q-question-goal { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; }
				.cl-theme-simple .q-vars { <xsl:choose><xsl:when test="display_type='list'">padding: 10px;</xsl:when><xsl:when test="display_type='page'">padding: 10px 0 0 0;</xsl:when></xsl:choose> }

				.cl-theme-simple .var-true-false .spot { border-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-simple .var-selected .var-true-false .spot-point { background-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 50%; }
				.cl-theme-simple .var-true-false { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-simple .var-selected  .var-true-false .spot-point { background-image: linear-gradient(0deg, <xsl:value-of select="$main.sSpotColor"/>, <xsl:value-of select="$_spot_gradient_color"/>); }

				.cl-theme-simple .var-choice .spot { border-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 50%; }
				.cl-theme-simple .var-selected .var-choice .spot-point { background-color: <xsl:value-of select="$main.sSpotColor"/>; border-radius: 50%; }
				.cl-theme-simple .var-choice { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-simple .var-selected .spot-point { background-image: linear-gradient(0deg, <xsl:value-of select="$main.sSpotColor"/>, <xsl:value-of select="$_spot_gradient_color"/>); }
				
				.cl-theme-simple .var-select .spot { border-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-simple .var-select .inner-part { fill: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-simple .var-select { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; }

				.cl-theme-simple .var-order { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-simple .var-order .inner-part { fill: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-simple .var-numeric { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-simple .var-numeric .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-simple .var-fib { border-color: <xsl:value-of select="$border-color-fixed"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; }
				.cl-theme-simple .var-fib .var-input { font-family: <xsl:value-of select="$_basic_font_family"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; }

				.cl-theme-simple .oto-connector { border-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-simple .var-target { font-family: <xsl:value-of select="$_basic_font_family"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; }
				.cl-theme-simple .var-bullet { font-family: <xsl:value-of select="$_basic_font_family"/>; background-color: <xsl:value-of select="$base-color-fixed"/>; color: <xsl:value-of select="$_font_color"/>; border-color: <xsl:value-of select="$main.sSpotColor"/>; }
			</xsl:when>
		</xsl:choose>
	</style>
</xsl:template>

<xsl:template name="t-header">
	<div>
		<xsl:attribute name="class">cl-t-header</xsl:attribute>
		<table>
			<xsl:attribute name="class">cl-t-header-table</xsl:attribute>
			<tr>
				<td>
					<xsl:attribute name="class">cl-t-header-cell-left</xsl:attribute>
					<xsl:call-template name="t-credit-info"/>
					<xsl:call-template name="t-answered-info"/>
				</td>
				<td>
					<xsl:attribute name="class">cl-t-header-cell-center</xsl:attribute>
					<xsl:call-template name="t-progress"/>
					<xsl:if test="display_type='page'"><xsl:call-template name="t-counter"/></xsl:if>
				</td>
				<td>
					<xsl:attribute name="class">cl-t-header-cell-right</xsl:attribute>
					<xsl:choose>
						<xsl:when test="test_timer_switch='yes'">
							<xsl:call-template name="t-timer"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="string_test_time_unlimited"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</div>
</xsl:template>



<xsl:template name="t-credit-info">
	<div>
		<xsl:attribute name="class">cl-t-credit-info</xsl:attribute>
		<xsl:choose>
			<xsl:when test="test_scored='no'"><xsl:value-of select="q_notscored_msg"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="q_scored_msg"/></xsl:otherwise>
		</xsl:choose>
	</div>	
</xsl:template>
<xsl:template name="t-answered-info">
	<div>
		<xsl:attribute name="class">cl-t-answered-info</xsl:attribute>
		<xsl:variable name="_string_answered_1">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string" select="string_answered" />
				<xsl:with-param name="replace">{{1}}</xsl:with-param>
				<xsl:with-param name="with"><span class="cl-t-qty-answered">0</span></xsl:with-param>
			</xsl:call-template>						
		</xsl:variable>
		<xsl:variable name="_string_answered_2">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string" select="$_string_answered_1" />
				<xsl:with-param name="replace">{{2}}</xsl:with-param>
				<xsl:with-param name="with">
					<span class="cl-t-qty-total">
						<xsl:choose>
							<xsl:when test="randomize='yes'"><xsl:value-of select="random_quantity"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="count(q_questions/item)"/></xsl:otherwise>
						</xsl:choose>
					</span>
				</xsl:with-param>
			</xsl:call-template>						
		</xsl:variable>
		<xsl:value-of select="$_string_answered_2"/>
	</div>
</xsl:template>
<xsl:template name="t-progress">
	<div>
		<xsl:attribute name="class">cl-t-progress</xsl:attribute>
		<table>
			<xsl:attribute name="class">cl-t-progress-rail</xsl:attribute>
			<tr>
				<xsl:for-each select="q_questions/item">
					<xsl:if test="../../randomize!='yes' or (../../randomize='yes' and position() &lt;= number(../../random_quantity))">
						<td>
							<xsl:attribute name="class">cl-t-progress-item <xsl:choose><xsl:when test="position()=1">cl-current</xsl:when><xsl:otherwise>cl-unvisited</xsl:otherwise></xsl:choose></xsl:attribute>
							<div class="cl-t-progress-item-btn">&#160;</div>
						</td>
					</xsl:if>
				</xsl:for-each>
			</tr>
		</table>
	</div>
</xsl:template>
<xsl:template name="t-counter">
	<div class="cl-t-info-line">
		<xsl:variable name="_string_question_count_1">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string" select="string_question_count" />
				<xsl:with-param name="replace">{{1}}</xsl:with-param>
				<xsl:with-param name="with"><span class="cl-t-count-current">1</span></xsl:with-param>
			</xsl:call-template>						
		</xsl:variable>
		<xsl:variable name="_string_question_count_2">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string" select="$_string_question_count_1" />
				<xsl:with-param name="replace">{{2}}</xsl:with-param>
				<xsl:with-param name="with">
					<span class="cl-t-count-total">
						<xsl:choose>
							<xsl:when test="randomize='yes'"><xsl:value-of select="random_quantity"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="count(q_questions/item)"/></xsl:otherwise>
						</xsl:choose>
					</span>
				</xsl:with-param>
			</xsl:call-template>						
		</xsl:variable>
		<xsl:value-of select="$_string_question_count_2"/>
	</div>	
</xsl:template>
<xsl:template name="t-timer">
	<div>
		<xsl:attribute name="class">cl-t-timer test-timer</xsl:attribute>
		<xsl:attribute name="data-template">ttimer</xsl:attribute>
		<div>
			<xsl:attribute name="class">cl-t-timer-bar</xsl:attribute>
			<div>
				<xsl:attribute name="class">cl-t-timer-scale</xsl:attribute>
				&#160;
			</div>
		</div>
		<table>
			<xsl:attribute name="class">cl-t-timer-table</xsl:attribute>
			<tr>
				<td>
					<xsl:attribute name="class">cl-t-timer-value</xsl:attribute>
					<xsl:variable name="_minutes">
						<xsl:choose>
							<xsl:when test="number(test_timer_s) &gt;= 60"><xsl:value-of select="number(test_timer) + floor(number(test_timer_s) div 60)"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="test_timer"/></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="_seconds_pre">
						<xsl:choose>
							<xsl:when test="number(test_timer_s) &gt;= 60"><xsl:value-of select="number(test_timer_s) - 60*floor(number(test_timer_s) div 60)"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="test_timer_s"/></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="_seconds">
						<xsl:choose>
							<xsl:when test="number($_seconds_pre) &lt; 10">0<xsl:value-of select="$_seconds_pre"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="$_seconds_pre"/></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>											
					<xsl:variable name="_string_test_time_1">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="string_test_time" />
							<xsl:with-param name="replace">{{1}}</xsl:with-param>
							<xsl:with-param name="with"><span class="t-timer-minutes"><xsl:value-of select="$_minutes"/></span></xsl:with-param>
						</xsl:call-template>						
					</xsl:variable>
					<xsl:variable name="_string_test_time_2">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="$_string_test_time_1" />
							<xsl:with-param name="replace">{{2}}</xsl:with-param>
							<xsl:with-param name="with"><span class="t-timer-seconds"><xsl:value-of select="$_seconds"/></span></xsl:with-param>
						</xsl:call-template>						
					</xsl:variable>
					<xsl:value-of select="$_string_test_time_2"/>
				</td>
				<td>
					<xsl:attribute name="class">cl-t-timer-progress</xsl:attribute>
					<div>
						<xsl:attribute name="class">rnd-timer-main</xsl:attribute>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
							<xsl:attribute name="class">rnd-timer-svg</xsl:attribute>
							<circle>
								<xsl:attribute name="class">rnd-timer-svg-full</xsl:attribute>
								<xsl:attribute name="cx">12</xsl:attribute>
								<xsl:attribute name="cy">12</xsl:attribute>
								<xsl:attribute name="r">12</xsl:attribute>
							</circle>
						</svg>
					</div>
				</td>
			</tr>
		</table>
	</div>
</xsl:template>


<xsl:template name="t-workarea">
	<div>
		<xsl:attribute name="class">cl-t-workarea</xsl:attribute>
		<xsl:for-each select="q_questions/item">
			<xsl:call-template name="question">
				<xsl:with-param name="iCnt" select="position()"/>
			</xsl:call-template>
		</xsl:for-each>
	</div>
</xsl:template>
<xsl:template name="question">
	<xsl:param name="iCnt"/>
	<div>
		<xsl:attribute name="class">q-question q-question-<xsl:value-of select="../../display_type"/></xsl:attribute>
		<xsl:if test="../../display_type='page'">
			<xsl:choose>
				<xsl:when test="../../adjust_height='yes'">
					<xsl:attribute name="style"><xsl:choose><xsl:when test="number($iCnt)=number(../../display_question_number)">visibility: visible;</xsl:when><xsl:otherwise>visibility: hidden;</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style"><xsl:choose><xsl:when test="number($iCnt)=number(../../display_question_number)"></xsl:when><xsl:otherwise>display: none;</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:attribute name="data-q-num"><xsl:value-of select="$iCnt"/></xsl:attribute>
		<xsl:if test="../../display_type='list'"><xsl:call-template name="question-number"><xsl:with-param name="iCnt" select="$iCnt"/></xsl:call-template></xsl:if>
		<xsl:if test="display_question_text='yes'"><xsl:call-template name="question-text"/></xsl:if>
		<xsl:if test="../../display_goal='yes'"><xsl:call-template name="question-goal"/></xsl:if>
		<xsl:call-template name="vars-block"/>
	</div>
</xsl:template>
<xsl:template name="question-number">
	<xsl:param name="iCnt"/>
	<xsl:variable name="_string_question_count_1">
		<xsl:call-template name="string-replace">
			<xsl:with-param name="string" select="../../string_question_count" />
			<xsl:with-param name="replace">{{1}}</xsl:with-param>
			<xsl:with-param name="with"><xsl:value-of select="$iCnt"/></xsl:with-param>
		</xsl:call-template>						
	</xsl:variable>
	<xsl:variable name="_string_question_count_2">
		<xsl:call-template name="string-replace">
			<xsl:with-param name="string" select="$_string_question_count_1" />
			<xsl:with-param name="replace">{{2}}</xsl:with-param>
			<xsl:with-param name="with">
				<xsl:choose>
					<xsl:when test="randomize='yes'"><xsl:value-of select="../../random_quantity"/></xsl:when>
					<xsl:otherwise><xsl:value-of select="count(../../q_questions/item)"/></xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
		</xsl:call-template>						
	</xsl:variable>
	<div>
		<xsl:attribute name="class">q-question-number</xsl:attribute>
		<xsl:value-of select="$_string_question_count_2"/>
	</div>
</xsl:template>
<xsl:template name="question-goal">
	<xsl:param name="iCnt"/>
	<xsl:variable name="_sGoal">
		<xsl:choose>
			<xsl:when test="question_type='true-false'"><xsl:value-of select="../../q_goal_true-false"/></xsl:when>
			<xsl:when test="question_type='choice'"><xsl:value-of select="../../q_goal_choice"/></xsl:when>
			<xsl:when test="question_type='select'"><xsl:value-of select="../../q_goal_select"/></xsl:when>
			<xsl:when test="question_type='order'"><xsl:value-of select="../../q_goal_order"/></xsl:when>
			<xsl:when test="question_type='numeric'"><xsl:value-of select="../../q_goal_numeric"/></xsl:when>
			<xsl:when test="question_type='fib'"><xsl:value-of select="../../q_goal_fib"/></xsl:when>
			<xsl:when test="question_type='oto'"><xsl:value-of select="../../q_goal_oto"/></xsl:when>
			<xsl:when test="question_type='otm'"><xsl:value-of select="../../q_goal_otm"/></xsl:when>
			<xsl:when test="question_type='mtm'"><xsl:value-of select="../../q_goal_mtm"/></xsl:when>
		</xsl:choose>
	</xsl:variable>
	<div>
		<xsl:attribute name="class">q-question-goal  q-question-goal-page</xsl:attribute>
		<xsl:attribute name="data-template">qgoal</xsl:attribute>
		<xsl:value-of select="$_sGoal"/>
	</div>
</xsl:template>
<xsl:template name="question-text">
	<div>
		<xsl:attribute name="class">q-question-txt text-main</xsl:attribute>
		<xsl:attribute name="data-template">qtext</xsl:attribute>
		<xsl:value-of select="text_main" disable-output-escaping="yes"/>
	</div>
</xsl:template>
<xsl:template name="vars-block">
	<xsl:choose>
		<xsl:when test="question_type='true-false' and q_elements_layout='v'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-true-false q-vars-tf-v</xsl:attribute>
				<xsl:attribute name="data-template">qvars-true-false-v</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
				<xsl:call-template name="var-true-false">
					<xsl:with-param name="bChecked">
						<xsl:choose>
							<xsl:when test="(q_elements_order='tf' or q_elements_order='random') and q_eval='true'">true</xsl:when>
							<xsl:when test="q_elements_order='ft' and q_eval='false'">true</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
					<xsl:with-param name="sText">
						<xsl:choose>
							<xsl:when test="q_elements_order='tf' or q_elements_order='random'"><xsl:value-of select="q_text_true"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="q_text_false"/></xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="var-true-false">
					<xsl:with-param name="bChecked">
						<xsl:choose>
							<xsl:when test="(q_elements_order='tf' or q_elements_order='random') and q_eval='true'">false</xsl:when>
							<xsl:when test="q_elements_order='ft' and q_eval='false'">false</xsl:when>
							<xsl:otherwise>true</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
					<xsl:with-param name="sText">
						<xsl:choose>
							<xsl:when test="q_elements_order='tf' or q_elements_order='random'"><xsl:value-of select="q_text_false"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="q_text_true"/></xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</div>
		</xsl:when>
		<xsl:when test="question_type='true-false' and q_elements_layout='h'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-true-false q-vars-tf-h</xsl:attribute>
				<xsl:attribute name="data-template">qvars-true-false-h</xsl:attribute>
				<table>
					<xsl:attribute name="class">q-vars-tf-h-table</xsl:attribute>
					<tr>
						<td>
							<xsl:attribute name="class">q-vars-tf-h-td</xsl:attribute>
							<xsl:attribute name="data-append">1</xsl:attribute>
							<xsl:call-template name="var-true-false">
								<xsl:with-param name="bChecked">
									<xsl:choose>
										<xsl:when test="(q_elements_order='tf' or q_elements_order='random') and q_eval='true'">true</xsl:when>
										<xsl:when test="q_elements_order='ft' and q_eval='false'">true</xsl:when>
										<xsl:otherwise>false</xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
								<xsl:with-param name="sText">
									<xsl:choose>
										<xsl:when test="q_elements_order='tf' or q_elements_order='random'"><xsl:value-of select="q_text_true"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="q_text_false"/></xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
							</xsl:call-template>
						</td>
						<td>
							<xsl:attribute name="class">q-vars-tf-h-td</xsl:attribute>
							<xsl:attribute name="data-append">1</xsl:attribute>
							<xsl:call-template name="var-true-false">
								<xsl:with-param name="bChecked">
									<xsl:choose>
										<xsl:when test="(q_elements_order='tf' or q_elements_order='random') and q_eval='true'">false</xsl:when>
										<xsl:when test="q_elements_order='ft' and q_eval='false'">false</xsl:when>
										<xsl:otherwise>true</xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
								<xsl:with-param name="sText">
									<xsl:choose>
										<xsl:when test="q_elements_order='tf' or q_elements_order='random'"><xsl:value-of select="q_text_false"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="q_text_true"/></xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</div>
		</xsl:when>
		<xsl:when test="question_type='choice'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-choice</xsl:attribute>
				<xsl:attribute name="data-template">qvars-choice</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
				<xsl:for-each select="q_variants_choice/item">
					<xsl:call-template name="var-choice"/>
				</xsl:for-each>
			</div>
		</xsl:when>
		<xsl:when test="question_type='select'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-select</xsl:attribute>
				<xsl:attribute name="data-template">qvars-select</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
				<xsl:for-each select="q_variants_select/item">
					<xsl:call-template name="var-select"/>
				</xsl:for-each>
			</div>
		</xsl:when>
		<xsl:when test="question_type='order'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-order</xsl:attribute>
				<xsl:attribute name="data-template">qvars-order</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
				<xsl:for-each select="q_variants_order/item">
					<xsl:call-template name="var-order"/>
				</xsl:for-each>
			</div>
		</xsl:when>
		<xsl:when test="question_type='numeric'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-numeric</xsl:attribute>
				<xsl:attribute name="data-template">qvars-numeric</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
				<xsl:for-each select="q_variants_numeric/item">
					<xsl:call-template name="var-numeric">
						<xsl:with-param name="sExpPosition">
							<xsl:choose>
								<xsl:when test="q_exp_position='left'">left</xsl:when>
								<xsl:otherwise>right</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
					</xsl:call-template>	
				</xsl:for-each>
			</div>
		</xsl:when>
		<xsl:when test="question_type='fib'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-fib</xsl:attribute>
				<xsl:attribute name="data-template">qvars-fib</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
				<xsl:for-each select="q_variants_fib/item">
					<xsl:call-template name="var-fib">
						<xsl:with-param name="sExpPosition">
							<xsl:choose>
								<xsl:when test="q_exp_position='left'">left</xsl:when>
								<xsl:otherwise>right</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</div>
		</xsl:when>
		<xsl:when test="question_type='oto'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-oto</xsl:attribute>
				<xsl:attribute name="data-template">qvars-oto</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
				<table>
					<xsl:attribute name="class">oto-table</xsl:attribute>
					<xsl:for-each select="q_variants_oto/item">
						<tr>
							<td>
								<xsl:attribute name="class">left-part</xsl:attribute>
								<xsl:call-template name="var-oto-target"/>
							</td>
							<td>
								<xsl:attribute name="class">center-part</xsl:attribute>
								<div>
									<xsl:attribute name="class">oto-connector</xsl:attribute>
									&#160;
								</div>
							</td>
							<td>
								<xsl:attribute name="class">right-part</xsl:attribute>
								<xsl:call-template name="var-oto-bullet"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
		</xsl:when>
		<xsl:when test="question_type='otm'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-otm</xsl:attribute>
				<xsl:attribute name="data-template">qvars-otm</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
			</div>
		</xsl:when>
		<xsl:when test="question_type='mtm'">
			<div>
				<xsl:attribute name="class">q-vars q-vars-mtm</xsl:attribute>
				<xsl:attribute name="data-template">qvars-mtm</xsl:attribute>
				<xsl:attribute name="data-append">1</xsl:attribute>
			</div>
		</xsl:when>
	</xsl:choose>
</xsl:template>
<xsl:template name="var-true-false">
	<xsl:param name="bChecked"/>
	<xsl:param name="sText"/>
	<div>
		<xsl:attribute name="data-template">qvar-tf</xsl:attribute>
		<xsl:attribute name="class">var <xsl:choose><xsl:when test="$bChecked='true'">var-selected</xsl:when><xsl:otherwise>var-idle</xsl:otherwise></xsl:choose> unselectable</xsl:attribute>
		<div>
			<xsl:attribute name="class">var-inner var-true-false var-true-false-<xsl:value-of select="../../theme"/></xsl:attribute>
			<table>
				<xsl:attribute name="class">var-table</xsl:attribute>
				<tr>
					<td>
						<xsl:attribute name="class">var-spot-td</xsl:attribute>
						<xsl:call-template name="spot-true-false">
							<xsl:with-param name="bChecked" select="$bChecked"/>
						</xsl:call-template>
					</td>
					<td>
						<xsl:attribute name="class">var-txt-td</xsl:attribute>
						<div>
							<xsl:attribute name="class">var-txt text-main</xsl:attribute>
							<xsl:value-of select="$sText" disable-output-escaping="yes"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</xsl:template>
<xsl:template name="spot-true-false">
	<xsl:param name="bChecked"/>
	<div>
		<xsl:attribute name="class">spot <xsl:choose><xsl:when test="$bChecked='true'">spot-selected</xsl:when><xsl:otherwise>spot-idle</xsl:otherwise></xsl:choose></xsl:attribute>
		<xsl:attribute name="data-template">qvar-tf-spot</xsl:attribute>
		<div>
			<xsl:attribute name="class">inner-part selected</xsl:attribute>
			<div>
				<xsl:attribute name="class">spot-point</xsl:attribute>
				&#160;
			</div>
		</div>
	</div>
</xsl:template>
<xsl:template name="var-choice">	
	<div>
		<xsl:attribute name="data-template">qvar-choice</xsl:attribute>
		<xsl:attribute name="class">var <xsl:choose><xsl:when test="q_right='yes'">var-selected</xsl:when><xsl:otherwise>var-idle</xsl:otherwise></xsl:choose> unselectable</xsl:attribute>
		<div>
			<xsl:attribute name="class">var-inner var-choice var-choice-<xsl:value-of select="../../theme"/></xsl:attribute>
			<table>
				<xsl:attribute name="class">var-table</xsl:attribute>
				<tr>
					<td>
						<xsl:attribute name="class">var-spot-td</xsl:attribute>
						<xsl:call-template name="spot-choice"></xsl:call-template>
					</td>
					<td>
						<xsl:attribute name="class">var-txt-td</xsl:attribute>
						<div>
							<xsl:attribute name="class">var-txt text-main</xsl:attribute>
							<xsl:value-of select="q_variant" disable-output-escaping="yes"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</xsl:template>
<xsl:template name="spot-choice">
	<div>
		<xsl:attribute name="class">spot <xsl:choose><xsl:when test="q_right='yes'">spot-selected</xsl:when><xsl:otherwise>spot-idle</xsl:otherwise></xsl:choose></xsl:attribute>
		<xsl:attribute name="data-template">qvar-choice-spot</xsl:attribute>
		<div>
			<xsl:attribute name="class">inner-part selected</xsl:attribute>
			<div>
				<xsl:attribute name="class">spot-point</xsl:attribute>
				&#160;
			</div>
		</div>
	</div>
</xsl:template>
<xsl:template name="var-select">
	<div>
		<xsl:attribute name="data-template">qvar-select</xsl:attribute>
		<xsl:attribute name="class">var <xsl:choose><xsl:when test="q_right='yes'">var-selected</xsl:when><xsl:otherwise>var-idle</xsl:otherwise></xsl:choose> unselectable</xsl:attribute>
		<div>
			<xsl:attribute name="class">var-inner var-select</xsl:attribute>
			<table>
				<xsl:attribute name="class">var-table</xsl:attribute>
				<tr>
					<td>
						<xsl:attribute name="class">var-spot-td</xsl:attribute>
						<xsl:call-template name="spot-select"></xsl:call-template>
					</td>
					<td>
						<xsl:attribute name="class">var-txt-td</xsl:attribute>
						<div>
							<xsl:attribute name="class">var-txt text-main</xsl:attribute>
							<xsl:value-of select="q_variant" disable-output-escaping="yes"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</xsl:template>
<xsl:template name="spot-select">
	<xsl:choose>
		<xsl:when test="../../../../theme='simple'">
			<div>
				<xsl:attribute name="class">spot <xsl:choose><xsl:when test="q_right='yes'">spot-selected</xsl:when><xsl:otherwise>spot-idle</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="data-template">qvar-select-spot</xsl:attribute>
				<div>
					<xsl:attribute name="class">inner-part selected</xsl:attribute>
					<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14">
						<path>
							<xsl:attribute name="d">M0.7,7.7 L2.1,5.6 L2.8,5.6 L4.9,8.96 L14.0,0.0 L14.0,0.7 L5.6,12.6 Z</xsl:attribute>
							<xsl:attribute name="stroke">none</xsl:attribute>
							<xsl:attribute name="stroke-width">0</xsl:attribute>
						</path>
					</svg>
				</div>
			</div>
		</xsl:when>
		<xsl:when test="../../../../theme='standard'">
			<div>
				<xsl:attribute name="class">spot <xsl:choose><xsl:when test="q_right='yes'">spot-selected</xsl:when><xsl:otherwise>spot-idle</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="data-template">qvar-select-spot</xsl:attribute>
				<div>
					<xsl:attribute name="class">inner-part selected</xsl:attribute>
					<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14">
						<path>
							<xsl:attribute name="d">M0.7,7.7 L2.1,5.6 L2.8,5.6 L4.9,8.96 L14.0,0.0 L14.0,0.7 L5.6,12.6 Z</xsl:attribute>
							<xsl:attribute name="stroke">none</xsl:attribute>
							<xsl:attribute name="stroke-width">0</xsl:attribute>
						</path>
					</svg>
				</div>
			</div>
		</xsl:when>
		<xsl:when test="../../../../theme='light'">
			<div>
				<xsl:attribute name="class">spot <xsl:choose><xsl:when test="q_right='yes'">spot-selected</xsl:when><xsl:otherwise>spot-idle</xsl:otherwise></xsl:choose></xsl:attribute>
				<xsl:attribute name="data-template">qvar-select-spot</xsl:attribute>
				<div>
					<xsl:attribute name="class">inner-part selected</xsl:attribute>
					<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14">
						<path>
							<xsl:attribute name="d">M0.7,7.7 L2.1,5.6 L2.8,5.6 L4.9,8.96 L12.0,2.0 L12.8,3.7 L5.6,12.6 Z</xsl:attribute>
							<xsl:attribute name="stroke">none</xsl:attribute>
							<xsl:attribute name="stroke-width">0</xsl:attribute>
						</path>
					</svg>
				</div>
			</div>
		</xsl:when>
	</xsl:choose>
</xsl:template>
<xsl:template name="var-order">
	<div>
		<xsl:attribute name="data-template">qvar-order</xsl:attribute>
		<xsl:attribute name="class">var unselectable</xsl:attribute>
		<div>
			<xsl:attribute name="class">var-inner var-order</xsl:attribute>
			<table>
				<xsl:attribute name="class">var-table</xsl:attribute>
				<tr>
					<td>
						<xsl:attribute name="class">var-spot-td</xsl:attribute>
						<xsl:call-template name="spot-order"></xsl:call-template>
					</td>
					<td>
						<xsl:attribute name="class">var-txt-td</xsl:attribute>
						<div>
							<xsl:attribute name="class">var-txt text-main</xsl:attribute>
							<xsl:value-of select="q_variant" disable-output-escaping="yes"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</xsl:template>
<xsl:template name="spot-order">
	<xsl:choose>
		<xsl:when test="../../../../theme='simple'">
			<div>
				<xsl:attribute name="class">spot spot-basic</xsl:attribute>
				<xsl:attribute name="data-template">qvar-order-spot</xsl:attribute>
				<div>
					<xsl:attribute name="class">inner-part arrow arrow-up</xsl:attribute>
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="10" viewBox="0 0 20 10">
						<path>
							<xsl:attribute name="d">M10,0 L18,4 L18,8 L10,4 L2,8 L2,4 Z</xsl:attribute>
							<xsl:attribute name="stroke">none</xsl:attribute>
							<xsl:attribute name="stroke-width">0</xsl:attribute>
						</path>
					</svg>
				</div>
				<div>
					<xsl:attribute name="class">inner-part arrow arrow-down</xsl:attribute>
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="10" viewBox="0 0 20 10">
						<path>
							<xsl:attribute name="d">M10,10 L18,6 L18,2 L10,6 L2,2 L2,6 Z</xsl:attribute>
							<xsl:attribute name="stroke">none</xsl:attribute>
							<xsl:attribute name="stroke-width">0</xsl:attribute>
						</path>
					</svg>
				</div>
			</div>
		</xsl:when>
		<xsl:when test="../../../../theme='standard'">
			<div>
				<xsl:attribute name="class">spot spot-basic</xsl:attribute>
				<xsl:attribute name="data-template">qvar-order-spot</xsl:attribute>
				<div>
					<xsl:attribute name="class">inner-part arrow arrow-up</xsl:attribute>
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="10" viewBox="0 0 20 10">
						<path>
							<xsl:attribute name="d">M10,0 L18,4 L18,8 L10,4 L2,8 L2,4 Z</xsl:attribute>
							<xsl:attribute name="stroke">none</xsl:attribute>
							<xsl:attribute name="stroke-width">0</xsl:attribute>
						</path>
					</svg>
				</div>
				<div>
					<xsl:attribute name="class">inner-part arrow arrow-down</xsl:attribute>
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="10" viewBox="0 0 20 10">
						<path>
							<xsl:attribute name="d">M10,10 L18,6 L18,2 L10,6 L2,2 L2,6 Z</xsl:attribute>
							<xsl:attribute name="stroke">none</xsl:attribute>
							<xsl:attribute name="stroke-width">0</xsl:attribute>
						</path>
					</svg>
				</div>
			</div>
		</xsl:when>
		<xsl:when test="../../../../theme='light'">
			<div>
				<xsl:attribute name="class">spot spot-basic</xsl:attribute>
				<xsl:attribute name="data-template">qvar-order-spot</xsl:attribute>
				<div>
					<xsl:attribute name="class">inner-part</xsl:attribute>
					<span>
						<xsl:attribute name="class">order-up</xsl:attribute>
						&#8593;
					</span>
					<span>
						<xsl:attribute name="class">order-down</xsl:attribute>
						&#8595;
					</span>
				</div>
			</div>
		</xsl:when>
	</xsl:choose>
</xsl:template>
<xsl:template name="var-numeric">
	<xsl:param name="sExpPosition"/>
	<div>
		<xsl:attribute name="data-template">qvar-numeric</xsl:attribute>
		<xsl:attribute name="class">var</xsl:attribute>
		<div>
			<xsl:attribute name="class">var-inner var-numeric</xsl:attribute>
			<table>
				<xsl:attribute name="class">var-table</xsl:attribute>
				<tr>
					<xsl:if test="$sExpPosition='left'">
						<td>
							<xsl:attribute name="class">var-txt-td cl-var-exp-left</xsl:attribute>
							<div>
								<xsl:attribute name="class">var-txt text-main</xsl:attribute>
								<xsl:value-of select="q_explanation" disable-output-escaping="yes"/>
							</div>
						</td>
					</xsl:if>
					<td>
						<xsl:attribute name="class">var-spot-td cl-var-input-cell-<xsl:value-of select="$sExpPosition"/></xsl:attribute>
						<input type="text">
							<xsl:attribute name="class">var-input</xsl:attribute>
						</input>
					</td>
					<xsl:if test="$sExpPosition='right'">
						<td>
							<xsl:attribute name="class">var-txt-td cl-var-exp-right</xsl:attribute>
							<div>
								<xsl:attribute name="class">var-txt text-main</xsl:attribute>
								<xsl:value-of select="q_explanation" disable-output-escaping="yes"/>
							</div>
						</td>
					</xsl:if>
				</tr>
			</table>
		</div>
	</div>
</xsl:template>
<xsl:template name="var-fib">
	<xsl:param name="sExpPosition"/>
	<div>
		<xsl:attribute name="data-template">qvar-fib</xsl:attribute>
		<xsl:attribute name="class">var</xsl:attribute>
		<div>
			<xsl:attribute name="class">var-inner var-fib</xsl:attribute>
			<table>
				<xsl:attribute name="class">var-table</xsl:attribute>
				<tr>
					<xsl:if test="$sExpPosition='left'">
						<td>
							<xsl:attribute name="class">var-txt-td cl-var-exp-left</xsl:attribute>
							<div>
								<xsl:attribute name="class">var-txt text-main</xsl:attribute>
								<xsl:value-of select="q_explanation" disable-output-escaping="yes"/>
							</div>
						</td>
					</xsl:if>
					<td>
						<xsl:attribute name="class">var-spot-td cl-var-input-cell-<xsl:value-of select="$sExpPosition"/></xsl:attribute>
						<input type="text">
							<xsl:attribute name="class">var-input</xsl:attribute>
						</input>
					</td>
					<xsl:if test="$sExpPosition='right'">
						<td>
							<xsl:attribute name="class">var-txt-td cl-var-exp-right</xsl:attribute>
							<div>
								<xsl:attribute name="class">var-txt text-main</xsl:attribute>
								<xsl:value-of select="q_explanation" disable-output-escaping="yes"/>
							</div>
						</td>
					</xsl:if>
				</tr>
			</table>
		</div>
	</div>
</xsl:template>
<xsl:template name="var-oto-target">
	<div>
		<xsl:attribute name="class">var-target unselectable</xsl:attribute>
		<xsl:attribute name="data-template">qvar-oto-target</xsl:attribute>
		<xsl:attribute name="data-target-id"></xsl:attribute>
		<table>
			<xsl:attribute name="class">target-table</xsl:attribute>
			<tr>
				<td>
					<xsl:attribute name="class">target-text-cell cell-to-adjust</xsl:attribute>
					<div>
						<xsl:attribute name="class">target-text text-main</xsl:attribute>
						<xsl:value-of select="q_target" disable-output-escaping="yes"/>
					</div>
				</td>
				<!--
					<td>
						<xsl:attribute name="class">target-connector</xsl:attribute>
						<div>
							<xsl:attribute name="class">oto-connector</xsl:attribute>
							<xsl:attribute name="data-template">qvar-oto-connector</xsl:attribute>
							&#160;
						</div>
					</td>
				-->
			</tr>
		</table>
	</div>
</xsl:template>
<xsl:template name="var-oto-bullet">
	<div>
		<xsl:attribute name="class">var-bullet unselectable</xsl:attribute>
		<xsl:attribute name="data-template">qvar-oto-bullet</xsl:attribute>
		<xsl:attribute name="data-bullet-id"></xsl:attribute>
		<table>
			<xsl:attribute name="class">bullet-table</xsl:attribute>
			<tr>
				<td>
					<xsl:attribute name="class">bullet-text-cell cell-to-adjust</xsl:attribute>
					<div>
						<xsl:attribute name="class">bullet-text text-main</xsl:attribute>
						<xsl:value-of select="q_bullet" disable-output-escaping="yes"/>
					</div>
				</td>
			</tr>
		</table>
	</div>
</xsl:template>



<xsl:template name="t-footer">
	<div>
		<xsl:attribute name="class">cl-t-footer</xsl:attribute>
		<table>
			<xsl:attribute name="class">cl-t-footer-table</xsl:attribute>
			<tr>
				<td>
					<xsl:attribute name="class">cl-t-footer-cell-left</xsl:attribute>
					<xsl:call-template name="t-button"/>
				</td>
				<td>
					<xsl:attribute name="class">cl-t-footer-cell-center</xsl:attribute>
					<xsl:choose>
						<xsl:when test="display_type='list'"><xsl:value-of select="string_attempt_for_list"/></xsl:when>
						<xsl:otherwise><xsl:call-template name="t-attempts"/></xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:attribute name="class">cl-t-footer-cell-right</xsl:attribute>
					<xsl:choose>
						<xsl:when test="display_type='list'">&#160;</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="q_questions/item[1]/q_timer_switch='yes'"><xsl:call-template name="t-q-timer"/></xsl:when>
								<xsl:otherwise><xsl:value-of select="string_question_time_unlimited"/></xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</div>	
</xsl:template>
<xsl:template name="t-button">
	<button>
		<xsl:attribute name="class">cl-btn cl-t-footer-btn idle</xsl:attribute>
		<xsl:value-of select="string_btn_submit"/>
	</button>	
</xsl:template>
<xsl:template name="t-attempts">
	<div>
		<xsl:attribute name="class">cl-t-attempts</xsl:attribute>
		<xsl:variable name="_string_attempts_1">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string" select="string_question_attempts" />
				<xsl:with-param name="replace">{{1}}</xsl:with-param>
				<xsl:with-param name="with"><span class="cl-t-attempts-count">1</span></xsl:with-param>
			</xsl:call-template>						
		</xsl:variable>
		<xsl:variable name="_string_attempts_2">
			<xsl:call-template name="string-replace">
				<xsl:with-param name="string" select="$_string_attempts_1" />
				<xsl:with-param name="replace">{{2}}</xsl:with-param>
				<xsl:with-param name="with"><span class="cl-t-qty-total"><xsl:value-of select="q_questions/item[1]/q_attempts"/></span></xsl:with-param>
			</xsl:call-template>						
		</xsl:variable>
		<xsl:value-of select="$_string_attempts_2"/>
	</div>	
</xsl:template>
<xsl:template name="t-q-timer">
	<xsl:variable name="_q_timer" select="q_questions/item[1]/q_timer"/>
	<xsl:variable name="_q_timer_minutes" select="floor(number($_q_timer) div 60)"/>
	<xsl:variable name="_q_timer_seconds_pre" select="number($_q_timer) - 60*number($_q_timer_minutes)"/>
	<xsl:variable name="_q_timer_seconds">
		<xsl:choose>
			<xsl:when test="number($_q_timer_seconds_pre) &lt; 10">0<xsl:value-of select="$_q_timer_seconds_pre"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$_q_timer_seconds_pre"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<div>
		<xsl:attribute name="class">cl-q-timer question-timer</xsl:attribute>
		<xsl:attribute name="data-template">qtimer</xsl:attribute>
		<div>
			<xsl:attribute name="class">cl-q-timer-bar</xsl:attribute>
			<div>
				<xsl:attribute name="class">cl-q-timer-scale</xsl:attribute>
				&#160;
			</div>
		</div>
		<table>
			<xsl:attribute name="class">cl-q-timer-table</xsl:attribute>
			<tr>
				<td>
					<xsl:attribute name="class">cl-q-timer-value</xsl:attribute>
					<xsl:variable name="_string_q_time_1">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="string_question_time" />
							<xsl:with-param name="replace">{{1}}</xsl:with-param>
							<xsl:with-param name="with"><span class="q-timer-minutes"><xsl:value-of select="$_q_timer_minutes"/></span></xsl:with-param>
						</xsl:call-template>						
					</xsl:variable>
					<xsl:variable name="_string_q_time_2">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="$_string_q_time_1" />
							<xsl:with-param name="replace">{{2}}</xsl:with-param>
							<xsl:with-param name="with"><span class="q-timer-seconds"><xsl:value-of select="$_q_timer_seconds"/></span></xsl:with-param>
						</xsl:call-template>						
					</xsl:variable>
					<xsl:value-of select="$_string_q_time_2"/>
				</td>
				<td>
					<xsl:attribute name="class">cl-q-timer-progress</xsl:attribute>
					<div>
						<xsl:attribute name="class">rnd-timer-main</xsl:attribute>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
							<xsl:attribute name="class">rnd-timer-svg</xsl:attribute>
							<circle>
								<xsl:attribute name="class">rnd-timer-svg-full</xsl:attribute>
								<xsl:attribute name="cx">12</xsl:attribute>
								<xsl:attribute name="cy">12</xsl:attribute>
								<xsl:attribute name="r">12</xsl:attribute>
							</circle>
						</svg>
					</div>
				</td>
			</tr>
		</table>
	</div>
</xsl:template>

<xsl:template name="feedback">
	<xsl:param name="sReason"/>
	<div>
		<xsl:attribute name="data-template">fb</xsl:attribute>
		<xsl:attribute name="class">q-feedback q-feedback-<xsl:value-of select="$sReason"/></xsl:attribute>
		<div>
			<xsl:attribute name="class">q-feedback-inner</xsl:attribute>
			<div>
				<xsl:attribute name="class">q-feedback-btn unselectable</xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="title_close_fb"/></xsl:attribute>
				&#215;
			</div>
			<div>
				<xsl:attribute name="class">q-feedback-txt-cnt</xsl:attribute>
				<div>
					<xsl:attribute name="class">q-feedback-txt text-main</xsl:attribute>
					<xsl:choose>
						<xsl:when test="$sReason='correct'"><xsl:value-of select="q_fb_correct" disable-output-escaping="yes"/></xsl:when>
						<xsl:when test="$sReason='incorrect'"><xsl:value-of select="q_fb_incorrect" disable-output-escaping="yes"/></xsl:when>
						<xsl:when test="$sReason='lastattempt'"><xsl:value-of select="q_fb_lastattempt" disable-output-escaping="yes"/></xsl:when>
						<xsl:when test="$sReason='exceed'"><xsl:value-of select="q_fb_exceed" disable-output-escaping="yes"/></xsl:when>
						<xsl:when test="$sReason='timeout'"><xsl:value-of select="q_fb_timeout" disable-output-escaping="yes"/></xsl:when>
						<xsl:otherwise>&#160;</xsl:otherwise>
					</xsl:choose>
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
