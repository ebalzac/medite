<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
        <xsl:output encoding="UTF-8" method="html"/>
    <xsl:strip-space elements="*"/>
    <!--<xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>-->
    <xsl:template match="/">
        <!--<xsl:processing-instruction name="xml-stylesheet"> type="text/xsl" href="tool.xsl"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model"> href="http://oeuvres.github.io/Teinte/teinte.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>-->
        
        <html>
            <head><meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
                <link href="medite.css" rel="stylesheet" type="text/css" title="style par défaut"/>
                <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet"/> 
                <style type="text/css"> a:link{text-decoration:none}
                .txt_gauche{
                width:43%;
                float:left;
                overflow:auto;
                height: 550px;
                padding: 20px 20px 20px 20px;
                }
                .txt_droite{
                width:43%;
                float:left;
                overflow:auto;
                height: 550px;
                padding: 20px 20px 20px 20px;
                }
                form{
                display:inline-block;
                }
                input{
                width: 30px;}
                .norm{
                width: 100px;}
            </style>
            <script>
                function align(a){
                document.getElementById(a).click()}
            </script></head>
            <body>
                <div class="txt_gauche"><!--<form method="post" action="edittool.php">-->
                    <xsl:apply-templates select="//text" mode="text1"/>
                <!--</form>--></div>
                <div class="txt_droite">
                    <xsl:apply-templates select="//text" mode="text2"/>
                <!--</form>--></div>
            </body>
        </html>
    </xsl:template>
        <xsl:template match="text" mode="text1">
            <xsl:element name="article"><xsl:attribute name="class">text</xsl:attribute><xsl:apply-templates mode="text1"/></xsl:element>
        </xsl:template>
    <xsl:template match="text" mode="text2">
        <xsl:element name="article"><xsl:attribute name="class">text</xsl:attribute><xsl:apply-templates mode="text2"/></xsl:element>
    </xsl:template>
    <xsl:template match="front | body | docTitle" mode="text1">
        <xsl:element name="section"><xsl:attribute name="class"><xsl:value-of select="local-name()"/></xsl:attribute><xsl:apply-templates mode="text1"/></xsl:element>
    </xsl:template>
    <xsl:template match="front | body | docTitle" mode="text2">
        <xsl:element name="section"><xsl:attribute name="class"><xsl:value-of select="local-name()"/></xsl:attribute><xsl:apply-templates mode="text2"/></xsl:element>
    </xsl:template>
    
    <xsl:template match="titlePart" mode="text1">
        <xsl:element name="div">
            <xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="titlePart" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="docAuthor" mode="text2">
        <xsl:element name="p">
            <xsl:attribute name="class">docAuthor</xsl:attribute>
            <xsl:apply-templates mode="text2"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="docAuthor" mode="text1">
        <xsl:element name="p">
            <xsl:attribute name="class">docAuthor</xsl:attribute>
            <xsl:apply-templates mode="text2"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="div[@type='dedication']" mode="text1">
        <xsl:element name="div">
            <xsl:attribute name="class">dedication level2</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="div[@type='dedication']" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class">dedication level2</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="salute" mode="text1">
        <xsl:element name="div">
            <xsl:attribute name="class">salute</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="salute" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class">salute</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body/div" mode="text1">
        <xsl:element name="section">
            <xsl:attribute name="class">div level2</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body/div" mode="text2">
        <xsl:element name="section">
            <xsl:attribute name="class">div level2</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
        
        <xsl:template match="reg" mode="text2">
                <xsl:element name="a">
                    <xsl:attribute name="href"><xsl:text>#g</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                    <xsl:attribute name="id"><xsl:text>d</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                    <xsl:attribute name="class"><xsl:apply-templates select="parent::choice" mode="name"/></xsl:attribute>
                    <xsl:attribute name="onclick">align('<xsl:text>g</xsl:text><xsl:value-of select="count(preceding::choice)"/><xsl:text>')</xsl:text></xsl:attribute>
                    <xsl:apply-templates mode="text2"/>
                    <xsl:if test=".=' '">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:element>
        </xsl:template>
        
        <xsl:template match="orig" mode="text1">
                <xsl:element name="a">
                    <xsl:attribute name="href"><xsl:text>#d</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                    <xsl:attribute name="id"><xsl:text>g</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                    <xsl:attribute name="class"><xsl:apply-templates select="parent::choice" mode="name"/></xsl:attribute>
                    <xsl:attribute name="onclick">align('<xsl:text>d</xsl:text><xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                <xsl:apply-templates mode="text1"/>
                    <xsl:if test=".=' '">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:element>
        </xsl:template>
        
        <xsl:template match="choice[descendant::orig and descendant::reg]" mode="text1">
            <xsl:text>&lt;/a&gt;</xsl:text>
                <xsl:apply-templates select="orig" mode="text1"/>
            <xsl:text>&lt;a class="para"&gt;</xsl:text>
        </xsl:template>
    
    <xsl:template match="choice" mode="name">
        <xsl:value-of select="@ana"/>
    </xsl:template>
    
        <xsl:template match="choice[descendant::orig and descendant::reg]" mode="text2">
            <xsl:text>&lt;/a&gt;</xsl:text>
                <xsl:apply-templates select="reg" mode="text2"/>
            <xsl:text>&lt;a class="para"&gt;</xsl:text>
        </xsl:template>
    
        <xsl:template match="choice[descendant::orig and not(descendant::reg)]" mode="text1">
            <xsl:text>&lt;/a&gt;</xsl:text>
                <xsl:apply-templates select="orig" mode="text1"/>
            <xsl:text>&lt;a class="para"&gt;</xsl:text>
        </xsl:template>
    
        <xsl:template match="choice[descendant::orig and not(descendant::reg)]" mode="text2">
            <xsl:text>&lt;/a&gt;</xsl:text>
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:text>#g</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                        <xsl:attribute name="id"><xsl:text>d</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                        <xsl:attribute name="class"><xsl:value-of select="@ana"/></xsl:attribute>
                        <xsl:attribute name="onclick">align('<xsl:text>g</xsl:text><xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                    </xsl:element>
            <xsl:text>&lt;a class="para"&gt;</xsl:text>
        </xsl:template>
        
    <xsl:template match="choice[descendant::reg and not(descendant::orig)]" mode="text1">
        <xsl:text>&lt;/a&gt;</xsl:text>
        <xsl:element name="a">
                <xsl:attribute name="href"><xsl:text>#d</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
            <xsl:attribute name="id"><xsl:text>g</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                <xsl:attribute name="class"><xsl:value-of select="@ana"/></xsl:attribute>
            <xsl:attribute name="onclick">align('<xsl:text>d</xsl:text><xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
            </xsl:element>
        <xsl:text>&lt;a class="para"&gt;</xsl:text>
    </xsl:template>
     
    <xsl:template match="*" mode="orig">
        <xsl:apply-templates mode="text2"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="*" mode="reg">
        <xsl:apply-templates mode="text1"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="p[not(@resp='orig') and not(following-sibling::p[@resp='orig'][0])]" mode="text2">
                
                        <xsl:element name="{local-name()}">
                        <xsl:if test="@resp ='reg'"><xsl:attribute name="class">reg</xsl:attribute></xsl:if>
                            <xsl:if test="@rend ='noindent'"><xsl:attribute name="class">noindent</xsl:attribute></xsl:if>
                            <xsl:choose>
                                <!--S'il n'y a pas de variantes à l'intérieur, on crée les liens pour alignement-->
                                <xsl:when test="not(descendant::choice) and not(descendant::pb)">
                            <xsl:element name="a">
                            <xsl:attribute name="class">para</xsl:attribute>
                                <xsl:apply-templates mode="text2"/>
                        </xsl:element>
                    </xsl:when>
                     <xsl:otherwise>
                         <xsl:text>&lt;a class="para"&gt;</xsl:text>
                         <xsl:apply-templates mode="text2"/>
                         <xsl:text>&lt;/a&gt;</xsl:text>
                     </xsl:otherwise>
                </xsl:choose>
                            
                        </xsl:element>
    </xsl:template>
    <!--pour éviter le double affichage des @resp="orig", on désactive l'affichage en text2 et on appelle template @name='orig' à la place-->
    <xsl:template match="p[following-sibling::p[@resp='orig'][0]]" mode="text2">
        <xsl:text>&lt;/a&gt;&lt;/p&gt;</xsl:text><xsl:text>&lt;p&gt;</xsl:text><span class="porig">&#182; </span> <xsl:text>&lt;a class="para"&gt;</xsl:text>
        <xsl:apply-templates mode="text2"/>
        <xsl:text>&lt;/a&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="p[@resp ='orig']" mode="text2">
        <xsl:text>&lt;a class="para"&gt;</xsl:text>
        <xsl:apply-templates mode="text2"/>
        <xsl:text>&lt;/a&gt;</xsl:text>
        <xsl:text>&lt;/p&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="p[not(@resp='reg') and not(following-sibling::p[@resp='reg'][0])]" mode="text1">
        
        <xsl:element name="{local-name()}">
            <xsl:if test="@resp ='orig'"><xsl:attribute name="class">orig</xsl:attribute></xsl:if>
            <xsl:if test="@rend ='noindent'"><xsl:attribute name="class">noindent</xsl:attribute></xsl:if>
            <xsl:choose>
                <!--S'il n'y a pas de variantes à l'intérieur, on crée les liens pour alignement-->
                <xsl:when test="not(descendant::choice) and not(descendant::pb)">
                    <xsl:element name="a">
                        <xsl:attribute name="class">para</xsl:attribute>
                        <xsl:apply-templates mode="text1"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>&lt;a class="para"&gt;</xsl:text>
                    <xsl:apply-templates mode="text1"/>
                    <xsl:text>&lt;/a&gt;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="p[following-sibling::p[@resp='reg'][0]]" mode="text1">
        <xsl:text>&lt;/a&gt;&lt;/p&gt;</xsl:text><xsl:text>&lt;p&gt;</xsl:text><span class="preg">&#182; </span> <xsl:text>&lt;a class="para"&gt;</xsl:text>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        <xsl:text>&lt;/a&gt;</xsl:text>
        </xsl:template>
        
    <xsl:template match="p[@resp ='reg']" mode="text1">
        <xsl:text>&lt;a class="para"&gt;</xsl:text>
        <xsl:apply-templates mode="text1"/>
        <xsl:text>&lt;/a&gt;</xsl:text>
        <xsl:text>&lt;/p&gt;</xsl:text>
        </xsl:template>
    
    <xsl:template match="hi[@resp='orig']" mode="text1">
        <xsl:if test="@rend ='i'">
            <xsl:element name="em"><xsl:attribute name="class">orig</xsl:attribute>
                <xsl:apply-templates mode="text1"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='sc'">
            <xsl:element name="span"><xsl:attribute name="class">orig sc</xsl:attribute>
                <xsl:apply-templates mode="text1"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='b'">
            <xsl:element name="strong"><xsl:attribute name="class">orig</xsl:attribute>
                <xsl:apply-templates mode="text1"/></xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="hi[@resp='reg']" mode="text2">
        <xsl:if test="@rend ='i'">
            <xsl:element name="em"><xsl:attribute name="class">reg</xsl:attribute>
                <xsl:apply-templates mode="text2"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='sc'">
            <xsl:element name="span"><xsl:attribute name="class">reg sc</xsl:attribute>
                <xsl:apply-templates mode="text2"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='b'">
            <xsl:element name="strong"><xsl:attribute name="class">reg</xsl:attribute>
                <xsl:apply-templates mode="text2"/></xsl:element>
        </xsl:if>
    </xsl:template>
    <xsl:template match="hi[@resp='orig']" mode="text2"/>
    <xsl:template match="hi[@resp='reg']" mode="text1"/>
    
    <xsl:template match="hi" mode="text2">
        <xsl:if test="@rend ='i'">
            <xsl:element name="i">
                <xsl:apply-templates mode="text2"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='sc'">
            <xsl:element name="span"><xsl:attribute name="class">sc</xsl:attribute>
                <xsl:apply-templates mode="text2"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='b'">
            <xsl:element name="strong">
                <xsl:apply-templates mode="text2"/></xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="hi" mode="text1">
        <xsl:if test="@rend ='i'">
            <xsl:element name="i">
                <xsl:apply-templates mode="text1"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='sc'">
            <xsl:element name="span"><xsl:attribute name="class">sc</xsl:attribute>
                <xsl:apply-templates mode="text1"/></xsl:element>
        </xsl:if>
        <xsl:if test="@rend ='b'">
            <xsl:element name="strong">
                <xsl:apply-templates mode="text1"/></xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="note" mode="text1">
        <xsl:choose>
            <xsl:when test="@resp ='reg'"/>
            <xsl:otherwise><xsl:element name="a">
                <xsl:attribute name="href">#</xsl:attribute>
                <xsl:attribute name="class">note</xsl:attribute>
                <sup><xsl:value-of select="count(preceding::note)+1"/></sup>
                <span><xsl:apply-templates/></span>
            </xsl:element></xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template match="note" mode="text2">
        <xsl:choose>
            <xsl:when test="@resp ='orig'"/>
            <xsl:otherwise><xsl:element name="a">
                <xsl:attribute name="href">#</xsl:attribute>
                <xsl:attribute name="class">note</xsl:attribute>
                <sup><xsl:value-of select="count(preceding::note)+1"/></sup>
                <span><xsl:apply-templates/></span>
            </xsl:element></xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template match="pb" mode="text1">
        <xsl:text>&lt;/a&gt;</xsl:text>
        <xsl:choose>
            <xsl:when test="@resp='reg'"/>
            <xsl:when test="@resp='orig'"><xsl:text> </xsl:text>
                <xsl:element name="a">
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="class">pb_orig</xsl:attribute>
                    <xsl:if test="@facs"><xsl:attribute name="href"><xsl:value-of select="@facs"/></xsl:attribute></xsl:if>
                    <xsl:attribute name="title">Page n°<xsl:value-of select="@n"/></xsl:attribute>
                    <xsl:text>p. </xsl:text><xsl:value-of select="@n"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise><xsl:text> </xsl:text>
                <xsl:element name="a">
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="class">pb</xsl:attribute>
                    <xsl:if test="@facs"><xsl:attribute name="href"><xsl:value-of select="@facs"/></xsl:attribute></xsl:if>
                    <xsl:attribute name="title">Page n°<xsl:value-of select="@n"/></xsl:attribute>
                    <xsl:text>p. </xsl:text><xsl:value-of select="@n"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&lt;a class="para"&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="pb" mode="text2">
        <xsl:text>&lt;/a&gt;</xsl:text>
        <xsl:choose>
            <xsl:when test="@resp='reg'">
                <xsl:text> </xsl:text>
                <xsl:element name="a">
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="class">pb_reg</xsl:attribute>
                    <xsl:if test="@facs"><xsl:attribute name="href"><xsl:value-of select="@facs"/></xsl:attribute></xsl:if>
                    <xsl:attribute name="title">Page n°<xsl:value-of select="@n"/></xsl:attribute>
                    <xsl:text>p. </xsl:text><xsl:value-of select="@n"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
        <xsl:text>&lt;a class="para"&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="dateline" mode="text1">
        <xsl:element name="div">
            <xsl:attribute name="class">dateline</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dateline" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class">dateline</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
   
        <xsl:template match="*"/>
    </xsl:stylesheet>
        
