<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xh="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xh">

<!-- remove cnxml specific content from html -->

<xsl:output
  method="xml"
  encoding="UTF-8"
  indent="yes"/>

<xsl:strip-space elements="*"/>

<!-- Default: copy everything -->
<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!-- remove not needed namespaces from header and body -->
<xsl:template match="xh:head|xh:body">
  <xsl:element name="{local-name(.)}">
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<!-- remove first div title tag -->
<xsl:template match="xh:body/xh:div[1][@class='title']"/>

<!-- remove sections -->
<xsl:template match="xh:section">
  <xsl:apply-templates/>
</xsl:template>

<!-- copy section ids to headers -->
<xsl:template match="xh:h1|xh:h2|xh:h3|xh:h4|xh:h5|xh:h6">
  <xsl:copy>
    <xsl:if test="parent::xh:section/@id">
      <xsl:attribute name="id">
        <xsl:value-of select="parent::xh:section/@id"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>