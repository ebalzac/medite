<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        version="1.0"
        xmlns:eg="http://www.tei-c.org/ns/Examples"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        exclude-result-prefixes="tei">
        <xsl:output encoding="UTF-8" method="text" indent="no" />
        <xsl:strip-space elements="*"/>
        
        <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyzéèêàçâîïôöùüûœ'"/>
        <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÉÈÊÀÇÂÎÏÔÖÙÜÛŒ'"/>
        <xsl:template match="tei:text">
            <xsl:apply-templates/>
        </xsl:template>
        
        <xsl:template match="*">
            <xsl:apply-templates xml:space="default"/><xsl:text>
</xsl:text>
        </xsl:template>
        <xsl:template match="tei:hi[@rend='sc']">
            <xsl:value-of select="translate(., $smallcase, $uppercase)"/>
        </xsl:template>
        
        <xsl:template match="tei:hi|tei:num|tei:sup|tei:figure|tei:graphic|tei:stage">
            <xsl:apply-templates/>
        </xsl:template>
        
        <xsl:template match="tei:cell">
            <xsl:apply-templates/><xsl:text> </xsl:text>
        </xsl:template>
        
        <xsl:template match="tei:pb">
            <xsl:text>[</xsl:text><xsl:value-of select="@n"/><xsl:text>]</xsl:text>
        </xsl:template>
        <xsl:template match="tei:teiHeader"/>
        <xsl:template match="tei:note"/>
</xsl:stylesheet>