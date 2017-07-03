<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:websoft="http://www.websoft.ru"
				version="1.0">
<!--
'*	nav_015_progress#.xsl
-->
<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>
<xsl:param name="moduleImagesFolder"></xsl:param>
<xsl:param name="imagesFolder"></xsl:param>
<xsl:param name="objectID"></xsl:param>
<xsl:param name="width"></xsl:param>
<xsl:param name="height"></xsl:param>

<xsl:template match="/"><xsl:apply-templates select="params"/></xsl:template>

<xsl:template match="params">
	
	<xsl:variable name="scale-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="scale_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="bar-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="bar_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="visited-fill-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="visited_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="visited-border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="visited_border_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="current-fill-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="current_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="current-border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="current_border_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="unvisited-fill-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="unvisited_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="unvisited-border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="unvisited_border_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="text-shadow-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="text_shadow_fill_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="font-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="font_color"/>
		</xsl:call-template>
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
	<xsl:variable name="bg-color-gradient">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$bg-color-fixed"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">color2</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="bar-color-gradient">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$bar-color-fixed"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">color2</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="scale-color-gradient">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$scale-color-fixed"/>
			<xsl:with-param name="color.base.type">color2</xsl:with-param>
			<xsl:with-param name="color.target.type">color1</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="scale-color-border">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$scale-color-fixed"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">strokecolor</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="_font">
		<xsl:choose>
			<xsl:when test="font!='custom'"><xsl:call-template name="font_selector"><xsl:with-param name="sFontID" select="font"/></xsl:call-template></xsl:when>
			<xsl:otherwise><xsl:value-of select="font_custom"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="_font_family" select="$_font"/>
	<xsl:variable name="visited-color-gradient">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$visited-fill-color-fixed"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">color2</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="current-color-gradient">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$current-fill-color-fixed"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">color2</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="unvisited-color-gradient">
		<xsl:call-template name="getcolor">
			<xsl:with-param name="color.base" select="$unvisited-fill-color-fixed"/>
			<xsl:with-param name="color.base.type">color1</xsl:with-param>
			<xsl:with-param name="color.target.type">color2</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<style>
		.cl-progress-bg-var { <xsl:choose><xsl:when test="display_bg='no'">width: <xsl:value-of select="$width"/>px;</xsl:when><xsl:otherwise>width: <xsl:value-of select="number($width) - 2*number(border_width) - 2*number(box_padding)"/>px;  padding: <xsl:value-of select="box_padding"/>px; background-color: <xsl:value-of select="$bg-color-fixed"/>; border: <xsl:value-of select="border_width"/>px solid <xsl:value-of select="$border-color-fixed"/>; border-radius: <xsl:value-of select="radius"/>px; <xsl:if test="bg_autogradient='yes'">background-image: -webkit-linear-gradient(90deg, <xsl:value-of select="$bg-color-fixed"/>, <xsl:value-of select="$bg-color-gradient"/>); background-image: linear-gradient(0deg, <xsl:value-of select="$bg-color-fixed"/>, <xsl:value-of select="$bg-color-gradient"/>);</xsl:if> <xsl:if test="$_shadow_string!=''">-webkit-box-shadow: <xsl:value-of select="$_shadow_string"/>; box-shadow: <xsl:value-of select="$_shadow_string"/>;</xsl:if></xsl:otherwise></xsl:choose> }
		.cl-progress-slidename-var { font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if> <xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if> color: <xsl:value-of select="$font-color-fixed"/>; padding: 0 0 <xsl:value-of select="inter_scale"/>px 0; }
		.cl-progress-slidename-top-var { padding: 0 0 <xsl:value-of select="inter_scale"/>px 0; }
		.cl-progress-slidename-bottom-var { padding: <xsl:value-of select="inter_scale"/>px 0 0 0; }
		.cl-table-var { <xsl:choose><xsl:when test="display_type='scale'">width: inherit;</xsl:when><xsl:otherwise>margin: 0 auto;</xsl:otherwise></xsl:choose> }
		.cl-bar-info-var { font-family: <xsl:value-of select="$_font_family"/>; font-size: <xsl:value-of select="font_size"/>px; <xsl:if test="font_style='bold' or font_style='bolditalic'">font-weight: bold;</xsl:if> <xsl:if test="font_style='italic' or font_style='bolditalic'">font-style: italic;</xsl:if> color: <xsl:value-of select="$font-color-fixed"/>; }
		.cl-bar-info-left-var { padding: 0 <xsl:value-of select="inter_scale"/>px 0 0; }
		.cl-bar-info-right-var { padding: 0 0 0 <xsl:value-of select="inter_scale"/>px; }
		.cl-bar-box-var { <xsl:choose><xsl:when test="display_type='scale'">width: 100%;</xsl:when><xsl:otherwise>white-space: nowrap;</xsl:otherwise></xsl:choose> }
		<xsl:if test="display_type='scale'">
			.cl-scale-var { width: inherit; height: <xsl:value-of select="scale_height"/>px; border: solid <xsl:value-of select="scale_border_width"/>px <xsl:value-of select="$scale-color-border"/>; border-radius: <xsl:value-of select="round(number(scale_radius) * number(scale_height) div 100)"/>px; background-color: <xsl:value-of select="$scale-color-fixed"/>; overflow: hidden; <xsl:if test="elem_autogradient='yes'">background-image: linear-gradient(0deg, <xsl:value-of select="$scale-color-fixed"/>, <xsl:value-of select="$scale-color-gradient"/>);</xsl:if> }
			.cl-bar { position: absolute; width: 50%;  height: <xsl:value-of select="scale_height"/>px; -webkit-border-radius: <xsl:value-of select="round(number(scale_radius) * number(scale_height) div 100)"/>px; border-radius: <xsl:value-of select="round(number(scale_radius) * number(scale_height) div 100)"/>px; background-color: <xsl:value-of select="$bar-color-fixed"/>; <xsl:if test="elem_autogradient='yes'">background-image: linear-gradient(0deg, <xsl:value-of select="$bar-color-fixed"/>, <xsl:value-of select="$bar-color-gradient"/>);</xsl:if> }
		</xsl:if>
		<xsl:if test="display_type='icons'">
			.cl-progress-elem-var { width: <xsl:value-of select="elem_width"/>px; height: <xsl:value-of select="elem_height"/>px; margin: 0 0 0 <xsl:value-of select="inter_elem"/>px; border-style: solid; border-width: <xsl:value-of select="elem_border_width"/>px; -webkit-border-radius: <xsl:value-of select="round(number(elem_radius) * number(elem_height) div 100)"/>px; border-radius: <xsl:value-of select="round(number(elem_radius) * number(elem_height) div 100)"/>px; }
			.cl-progress-v-var { border-color: <xsl:value-of select="$visited-border-color-fixed"/>; background-color: <xsl:value-of select="$visited-fill-color-fixed"/>; <xsl:if test="elem_autogradient='yes'">background-image: -webkit-linear-gradient(90deg, <xsl:value-of select="$visited-fill-color-fixed"/>, <xsl:value-of select="$visited-color-gradient"/>); background-image: linear-gradient(0deg, <xsl:value-of select="$visited-fill-color-fixed"/>, <xsl:value-of select="$visited-color-gradient"/>);</xsl:if> }
			.cl-progress-c-var { border-color: <xsl:value-of select="$current-border-color-fixed"/>; background-color: <xsl:value-of select="$current-fill-color-fixed"/>; <xsl:if test="elem_autogradient='yes'">background-image: -webkit-linear-gradient(90deg, <xsl:value-of select="$current-fill-color-fixed"/>, <xsl:value-of select="$current-color-gradient"/>); background-image: linear-gradient(0deg, <xsl:value-of select="$current-fill-color-fixed"/>, <xsl:value-of select="$current-color-gradient"/>);</xsl:if> }
			.cl-progress-u-var { border-color: <xsl:value-of select="$unvisited-border-color-fixed"/>; background-color: <xsl:value-of select="$unvisited-fill-color-fixed"/>; <xsl:if test="elem_autogradient='yes'">background-image: -webkit-linear-gradient(90deg, <xsl:value-of select="$unvisited-fill-color-fixed"/>, <xsl:value-of select="$unvisited-color-gradient"/>); background-image: linear-gradient(0deg, <xsl:value-of select="$unvisited-fill-color-fixed"/>, <xsl:value-of select="$unvisited-color-gradient"/>);</xsl:if> }
			.cl-progress-img-var { margin: 0 0 0 <xsl:value-of select="inter_elem"/>px; }
		</xsl:if>
	</style>
	<div>
		<xsl:attribute name="class">clo-nav_015_progress</xsl:attribute>
		<div>
			<xsl:attribute name="class">cl-container</xsl:attribute>
			<div>
				<xsl:attribute name="class">cl-progress-bg cl-progress-bg-var</xsl:attribute>
				<xsl:choose>
					<xsl:when test="display_type='scale'">
						<xsl:if test="display_counter='top' or display_slidename='top'">
							<div>
								<xsl:attribute name="class">cl-progress-slidename cl-progress-slidename-var cl-progress-slidename-top-var </xsl:attribute>
								<xsl:if test="display_counter='top'"><span class="cl-progress-counter">&#160;<xsl:value-of select="counter_mask"/>&#160;</span></xsl:if>
								<xsl:if test="display_slidename='top'"><span class="cl-progress-slidename-name"><xsl:value-of select="hidden.label.current"/></span></xsl:if>
							</div>
						</xsl:if>
						<div>
							<xsl:attribute name="class">cl-progress-box</xsl:attribute>
							<table cellpadding="0" cellspacing="0" border="0">
								<xsl:attribute name="class">cl-table cl-table-var</xsl:attribute>
								<tr>
									<xsl:if test="display_counter='left'">
										<td>
											<xsl:attribute name="class">cl-table-td cl-bar-info cl-bar-info-var cl-bar-info-left cl-bar-info-left-var</xsl:attribute>
											<span class="cl-progress-counter"><xsl:value-of select="counter_mask"/></span>
										</td>
									</xsl:if>
									<td>
										<xsl:attribute name="class">cl-table-td cl-bar-box cl-bar-box-var</xsl:attribute>
										<div>
											<xsl:attribute name="class">cl-scale cl-scale-var</xsl:attribute>
											<div>
												<xsl:attribute name="class">cl-bar cl-bar-var</xsl:attribute>
												&#160;
											</div>
										</div>
									</td>
									<xsl:if test="display_counter='right'">
										<td>
											<xsl:attribute name="class">cl-table-td cl-bar-info cl-bar-info-var cl-bar-info-right cl-bar-info-right-var</xsl:attribute>
											<span class="cl-progress-counter"><xsl:value-of select="counter_mask"/></span>
										</td>
									</xsl:if>
								</tr>
							</table>
						</div>
						<xsl:if test="display_counter='bottom' or display_slidename='bottom'">
							<div>
								<xsl:attribute name="class">cl-progress-slidename cl-progress-slidename-var cl-progress-slidename-bottom-var </xsl:attribute>
								<xsl:if test="display_counter='bottom'"><span class="cl-progress-counter">&#160;<xsl:value-of select="counter_mask"/>&#160;</span></xsl:if>
								<xsl:if test="display_slidename='bottom'"><span class="cl-progress-slidename-name"><xsl:value-of select="hidden.label.current"/></span></xsl:if>
							</div>
						</xsl:if>
					</xsl:when>
					<xsl:when test="display_type='icons'">
						<xsl:if test="display_counter='top' or display_slidename='top'">
							<div>
								<xsl:attribute name="class">cl-progress-slidename cl-progress-slidename-var cl-progress-slidename-top-var </xsl:attribute>
								<xsl:if test="display_counter='top'"><span class="cl-progress-counter">&#160;<xsl:value-of select="counter_mask"/>&#160;</span></xsl:if>
								<xsl:if test="display_slidename='top'"><span class="cl-progress-slidename-name"><xsl:value-of select="hidden.label.current"/></span></xsl:if>
							</div>
						</xsl:if>
						<div style="padding: 0; line-height: 0;">
							<xsl:attribute name="class">cl-progress-box</xsl:attribute>
							<table cellpadding="0" cellspacing="0" border="0">
								<xsl:attribute name="class">cl-table cl-table-var</xsl:attribute>
								<tr>
									<xsl:if test="display_counter='left'">
										<td>
											<xsl:attribute name="class">cl-table-td cl-bar-info cl-bar-info-var cl-bar-info-left cl-bar-info-left-var</xsl:attribute>
											<span class="cl-progress-counter"><xsl:value-of select="counter_mask"/></span>
										</td>
									</xsl:if>
									<td>
										<xsl:attribute name="class">cl-table-td cl-bar-box cl-bar-box-var</xsl:attribute>
										<div>
											<xsl:attribute name="class">cl-scale cl-scale-var</xsl:attribute>
											<xsl:choose>
												<xsl:when test="icon_type='standard'">
													<div>
														<xsl:attribute name="class">cl-progress-elem cl-progress-elem-var cl-progress-v cl-progress-v-var</xsl:attribute>
														&#160;
													</div>
													<div>
														<xsl:attribute name="class">cl-progress-elem cl-progress-elem-var cl-progress-v cl-progress-v-var</xsl:attribute>
														&#160;
													</div>
													<div>
														<xsl:attribute name="class">cl-progress-elem cl-progress-elem-var cl-progress-v cl-progress-v-var</xsl:attribute>
														&#160;
													</div>
													<div>
														<xsl:attribute name="class">cl-progress-elem cl-progress-elem-var cl-progress-c cl-progress-c-var</xsl:attribute>
														&#160;
													</div>
													<div>
														<xsl:attribute name="class">cl-progress-elem cl-progress-elem-var cl-progress-u cl-progress-u-var</xsl:attribute>
														&#160;
													</div>
													<div>
														<xsl:attribute name="class">cl-progress-elem cl-progress-elem-var cl-progress-u cl-progress-u-var</xsl:attribute>
														&#160;
													</div>
													<div>
														<xsl:attribute name="class">cl-progress-elem cl-progress-elem-var cl-progress-u cl-progress-u-var</xsl:attribute>
														&#160;
													</div>
												</xsl:when>
												<xsl:when test="icon_type='custom_images'">
													<img>
														<xsl:attribute name="class">cl-progress-img cl-progress-img-var cl-progress-v</xsl:attribute>
														<xsl:attribute name="src"><xsl:value-of select="substring-before($moduleImagesFolder,'images\')"/><xsl:value-of select="translate(img_visited,'/','\')"/></xsl:attribute>
													</img>
													<img>
														<xsl:attribute name="class">cl-progress-img cl-progress-img-var cl-progress-v</xsl:attribute>
														<xsl:attribute name="src"><xsl:value-of select="substring-before($moduleImagesFolder,'images\')"/><xsl:value-of select="translate(img_visited,'/','\')"/></xsl:attribute>
													</img>
													<img>
														<xsl:attribute name="class">cl-progress-img cl-progress-img-var cl-progress-v</xsl:attribute>
														<xsl:attribute name="src"><xsl:value-of select="substring-before($moduleImagesFolder,'images\')"/><xsl:value-of select="translate(img_visited,'/','\')"/></xsl:attribute>
													</img>
													<img>
														<xsl:attribute name="class">cl-progress-img cl-progress-img-var cl-progress-c</xsl:attribute>
														<xsl:attribute name="src"><xsl:value-of select="substring-before($moduleImagesFolder,'images\')"/><xsl:value-of select="translate(img_current,'/','\')"/></xsl:attribute>
													</img>
													<img>
														<xsl:attribute name="class">cl-progress-img cl-progress-img-var cl-progress-u</xsl:attribute>
														<xsl:attribute name="src"><xsl:value-of select="substring-before($moduleImagesFolder,'images\')"/><xsl:value-of select="translate(img_unvisited,'/','\')"/></xsl:attribute>
													</img>
													<img>
														<xsl:attribute name="class">cl-progress-img cl-progress-img-var cl-progress-u</xsl:attribute>
														<xsl:attribute name="src"><xsl:value-of select="substring-before($moduleImagesFolder,'images\')"/><xsl:value-of select="translate(img_unvisited,'/','\')"/></xsl:attribute>
													</img>
													<img>
														<xsl:attribute name="class">cl-progress-img cl-progress-img-var cl-progress-u</xsl:attribute>
														<xsl:attribute name="src"><xsl:value-of select="substring-before($moduleImagesFolder,'images\')"/><xsl:value-of select="translate(img_unvisited,'/','\')"/></xsl:attribute>
													</img>
												</xsl:when>
											</xsl:choose>
										</div>
									</td>
									<xsl:if test="display_counter='right'">
										<td>
											<xsl:attribute name="class">cl-table-td cl-bar-info cl-bar-info-var cl-bar-info-right cl-bar-info-right-var</xsl:attribute>
											<span class="cl-progress-counter"><xsl:value-of select="counter_mask"/></span>
										</td>
									</xsl:if>
								</tr>
							</table>
						</div>
						<xsl:if test="display_counter='bottom' or display_slidename='bottom'">
							<div><xsl:attribute name="class">cl-progress-slidename cl-progress-slidename-var cl-progress-slidename-bottom-var </xsl:attribute><xsl:if test="display_counter='bottom'"><span class="cl-progress-counter">&#160;<xsl:value-of select="counter_mask"/>&#160;</span></xsl:if><xsl:if test="display_slidename='bottom'"><span class="cl-progress-slidename-name"><xsl:value-of select="hidden.label.current"/></span></xsl:if></div>
						</xsl:if>
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
