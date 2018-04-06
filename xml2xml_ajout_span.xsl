<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei">
<xsl:output encoding="UTF-8" method="xml" indent="no" escape-uri-attributes="yes" />
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:processing-instruction name="xml-model"> href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model"> href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="*">
    <xsl:element name="{local-name()}">
        <xsl:for-each select="@*">
            <xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute>
        </xsl:for-each>
        <xsl:apply-templates/>
    </xsl:element>
</xsl:template>
    
    <xsl:template match="tei:p |
        tei:q | 
        tei:quote |
        tei:dateline | 
        tei:salute | 
        tei:signed | 
        tei:label | 
        tei:head | 
        tei:speaker | 
        tei:stage | 
        tei:titlePart">
        
        <xsl:element name="{local-name()}">
            <xsl:for-each select="@*">
                <xsl:if test=". ='resp | type | rend'"><xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute></xsl:if>
            </xsl:for-each>
            <xsl:apply-templates mode="para"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="text()" mode="para">
        <xsl:element name="span">
            <xsl:attribute name="type">para</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:pb|tei:choice" mode="para">
        <xsl:element name="{local-name()}">
            <xsl:for-each select="@*">
                <xsl:if test=". ='ana | n | resp'"><xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute></xsl:if>
                <xsl:if test=". ='xml:id'"><xsl:attribute name="xml:id"><xsl:value-of select="."/></xsl:attribute></xsl:if>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="*" mode="para">
        <xsl:element name="{local-name()}">
            <xsl:for-each select="@*">
                <xsl:if test=". ='rend | place | resp'"><xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute></xsl:if>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    
    
</xsl:stylesheet>