<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0"
    xmlns:eg="http://www.tei-c.org/ns/Examples"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    <xsl:output encoding="UTF-8" method="text" indent="no" />
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:text">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:text> ###</xsl:text><xsl:value-of select="local-name()"/><xsl:for-each select="@*"><xsl:text> </xsl:text>
            <xsl:value-of select="local-name()"/><xsl:text>="</xsl:text><xsl:value-of select="."/><xsl:text>" </xsl:text></xsl:for-each>
        <xsl:text>+++ </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> ###/</xsl:text><xsl:value-of select="local-name()"/><xsl:text>+++ </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <xsl:text> ###pb n="</xsl:text><xsl:value-of select="@n"/><xsl:text>" xml:id="</xsl:text><xsl:value-of select="@xml:id"/><!--<xsl:if test="@facs"><xsl:text>" facs="</xsl:text><xsl:value-of select="@facs"/></xsl:if>--><xsl:text>"/+++ </xsl:text>
    </xsl:template>
   
    <xsl:template match="tei:TEI">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"/>
</xsl:stylesheet>