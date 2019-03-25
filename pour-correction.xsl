<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:strip-space elements="*"/>
    <!--Pour s'assurer que les comparaisons sont correctes-->
    <xsl:template match="text">
        <xsl:for-each select="*[not(@resp='reg')]">
            <xsl:apply-templates xml:space="default"/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="choice">
        <xsl:apply-templates select="orig"/>
    </xsl:template>
    <xsl:template match="p |div">
        <xsl:apply-templates/><xsl:text>
</xsl:text>
    </xsl:template>
    <xsl:template match="teiHeader"/>
</xsl:stylesheet>