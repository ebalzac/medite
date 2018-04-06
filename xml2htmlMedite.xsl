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
        
        <html lang="fr">
            <head>
                <meta charset="utf-8"/>
                    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                        <meta name="viewport" content="width=device-width, initial-scale=1"/>
                            
                            <title>    Comparaison des versions Furne (1842) et Furne corrigé
                                de “Le Bal de Sceaux” :: Phoebus
                            </title>
                            
                            <meta name="description" content="" />
                            <meta name="description" content="" />
                            
                            <meta property="og:title"            content="" />
                            <meta property="og:description"      content="" />
                            <meta property="og:image"            content="/favicon.png" />
                            <meta property="og:url"              content="https://ebalzac.com/genetique/02-bal-sceaux/furne/furne-corrige" />
                            
                            <meta property="twitter:title"       content="" />
                            <meta property="twitter:site"        content="" />
                            <meta property="twitter:description" content="" />
                            <meta property="twitter:image"       content="/favicon.png" />
                            <meta property="twitter:card"        content="summary" />
                            <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/favicons/apple-touch-icon-144x144.png" />
                            <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/favicons/apple-touch-icon-152x152.png" />
                            <link rel="icon" type="image/png" href="/favicons/favicon-32x32.png" sizes="32x32" />
                            <link rel="icon" type="image/png" href="/favicons/favicon-16x16.png" sizes="16x16" />
                            <meta name="application-name" content="Phoebus"/>
                            <meta name="msapplication-TileColor" content="#FFFFFF" />
                            <meta name="msapplication-TileImage" content="/favicons/mstile-144x144.png" />
                            <meta name="theme-color" content="#ffffff" />
                            <link rel="shortcut icon" href="/favicon.ico"/>
                                
                                <link href="/css/font-montserrat.min.css" rel="stylesheet" type="text/css"/>
                                    <link href="/css/font-playfair.min.css" rel="stylesheet" type="text/css"/>
                                        <link href="/css/front.min.css" rel="stylesheet" type="text/css"/>
                                            
                                            
            </head>
            <body class="page-genetique bleu">
                <aside class="cadre-colore">
                    <img class="logo-header" src="/images/front/logo-texte.svg" alt="Logo mobile eBalzac" />
                </aside>
                <header class="menu">
                    <button class="hamburger" onclick="toggle_menu()">
                        <img src="/images/front/menu.svg" />
                    </button>
                    
                    <button class="hamburger hamburger-modifications"
                        onclick="toggle_modifications()"
                        title="Afficher/Masquer les modifications"
                        style="display:none">
                        <img src="/images/front/menu-modifications.svg" />
                    </button>
                    <ul>
                        <li class=" univers-jaune">
                            <a href="/">
                                Accueil
                            </a>
                        </li>
                        <li class=" univers-jaune">
                            <a href="/presentation">
                                Le projet eBalzac
                            </a>
                            <ul>
                                <li class="">
                                    <a href="/presentation">
                                        Présentation détaillée
                                    </a>
                                </li>
                                <li class="">
                                    <a href="/membres">
                                        Membres
                                    </a>
                                </li>
                                <li class="">
                                    <a href="/activites">
                                        Activités
                                    </a>
                                </li>
                                <li class="">
                                    <a href="/partenaires">
                                        Partenaires
                                    </a>
                                </li>
                                <li class="">
                                    <a href="/contact">
                                        Contact
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class=" univers-vert">
                            <a href="/edition">
                                Édition
                            </a>
                            <ul>
                                <li class="">
                                    <a href="/edition">
                                        Présentation de l’édition
                                    </a>
                                </li>
                                <li class="">
                                    <a href="/editions/la-comedie-humaine">
                                        La Comédie humaine
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="active univers-bleu">
                            <a href="/genetique">
                                Génétique
                            </a>
                        </li>
                        <li class=" univers-rouge">
                            <a href="/hypertexte">
                                Hypertexte
                            </a>
                        </li>
                    </ul>
                    
                </header>
                <section>
                    <img class="logo-texte" src="/images/front/logo-texte.svg" alt="Logo eBalzac" />
                    <div class="contenu">
                        
                        <div class="pave-comparaison">
                            <div class="pave-large pave-comparaison-haut">
                                <h1>Le Bal de Sceaux</h1>
                                
                                <input type="hidden" id="version_base" value="Furne (1842)" />
                                <input type="hidden" id="version_destination" value="Furne corrigé" />
                                <div class="filtres">
                                    <a href="/genetique">Retour à la liste</a>
                                </div>
                                <div class="svg-loader">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">
                                        <path fill="#EEE" d="M20,4C11.2,4,4,11.2,4,20c0,8.8,7.2,16,16,16s16-7.2,16-16C36,11.2,28.8,4,20,4z M20,32.5
                                            c-6.9,0-12.5-5.6-12.5-12.5c0-6.9,5.6-12.5,12.5-12.5S32.5,13.1,32.5,20C32.5,26.9,26.9,32.5,20,32.5z"/>
                                        <path fill="#4caf50" d="M20,7.5c3.5,0,6.6,1.4,8.8,3.7l2.5-2.5C28.4,5.8,24.4,4,20,4V7.5z"/>
                                    </svg>
                                </div>
                            </div>
                            <div class="pave-comparaison-bas">
                                <div style="display:none" class="comparaison-html">
                                    <div id="windows">
                                        <div class="txt_container right"> <!--A finir à partir d'ici!!-->
                    <xsl:apply-templates select="//text" mode="text1"/>
                <!--</form>--></div>
                <div class="txt_droite">
                    <xsl:apply-templates select="//text" mode="text2"/>
                    <!--</form>--></div><xsl:variable name="esp">&#160;</xsl:variable>
                <div id="modifications">
                    <div id="rempl_ins_supp">
                        <div id="remplacements"><h4><img src="img/blue_dot.png" alt=""/> Remplacements <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='remplacement'])+1"/>]</span></h4>
                            <ul id="remplacements_carousel">
                                <xsl:for-each select="//choice[@ana='remplacement']">
                                    <li>
                                        <span class="counter">[<xsl:value-of select="count(preceding::choice[@ana='remplacement'])+1"/>]</span>
                                    <span class="r_highlight">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                        <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                        <xsl:attribute name="title"><xsl:value-of select="translate(descendant::orig,' ', $esp)"/><xsl:text>→</xsl:text><xsl:value-of select="translate(descendant::reg,' ', '&#160;')"/></xsl:attribute>
                                    </xsl:element>
                                        <xsl:value-of select="translate(substring(orig,0,10),' ', $esp)"/>
                                            <xsl:if test="string-length(substring(orig, 10)) > 0"><xsl:element name="span">
                                                <xsl:attribute name="class">light</xsl:attribute>
                                            <xsl:text>...</xsl:text>
                                            </xsl:element>
                                            </xsl:if>
                                        <xsl:element name="span">
                                            <xsl:attribute name="class">light</xsl:attribute>
                                            <xsl:text>→</xsl:text>
                                        </xsl:element>
                                        <xsl:value-of select="translate(substring(reg,0,10),' ', $esp)"/>
                                        <xsl:if test="string-length(substring(orig, 10)) > 0"><xsl:element name="span">
                                            <xsl:attribute name="class">light</xsl:attribute>
                                            <xsl:text>...</xsl:text>
                                        </xsl:element>
                                        </xsl:if>
                                    </span>
                                </li>
                                </xsl:for-each>
                            </ul>
                            <div class="remplacements_prev_btn"><a>Précédent</a></div>
                            <div class="remplacements_next_btn"><a>Suivant</a></div>
                        </div>
                        <div id="insertions"><h4><img src="img/green_dot.png" alt=""/> Insertions <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='insertion'])+1"/>]</span></h4>
                        <ul id="insertions_carousel">
                            
                            <xsl:for-each select="//choice[@ana='insertion']">
                                <li style="text-align:justify;">
                                    <span class="counter">[<xsl:value-of select="count(preceding::choice[@ana='insertion'])+1"/>]</span>
                                    <span class="entries i_highlight">
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                            <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                            <xsl:attribute name="title"><xsl:value-of select="translate(descendant::orig,' ', $esp)"/></xsl:attribute>
                                        </xsl:element>
                                        <xsl:value-of select="translate(substring(orig,0,10),' ', $esp)"/>
                                        <xsl:if test="string-length(substring(orig, 10)) > 0"><xsl:element name="span">
                                            <xsl:attribute name="class">light</xsl:attribute>
                                            <xsl:text>...</xsl:text>
                                        </xsl:element>
                                        </xsl:if>
                                    </span>
                                </li>
                            </xsl:for-each>
                        </ul>
                            <div class="insertions_prev_btn"><a>Précédent</a></div>
                            <div class="insertions_next_btn"><a>Suivant</a></div>
                        </div>
                        <div id="supressions"><h4><img src="img/red.png" alt=""/> Supressions <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='supression'])+1"/>]</span></h4>
                            <ul id="supressions_carousel">
                                
                                <xsl:for-each select="//choice[@ana='supression']">
                                    <li style="text-align:justify;">
                                        <span class="counter">[<xsl:value-of select="count(preceding::choice[@ana='supression'])+1"/>]</span>
                                        <span class="entries i_highlight">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                                <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                                <xsl:attribute name="title"><xsl:value-of select="translate(descendant::reg,' ', $esp)"/></xsl:attribute>
                                            </xsl:element>
                                            <xsl:value-of select="translate(substring(reg,0,10),' ', $esp)"/>
                                            <xsl:if test="string-length(substring(reg, 10)) > 0"><xsl:element name="span">
                                                <xsl:attribute name="class">light</xsl:attribute>
                                                <xsl:text>...</xsl:text>
                                            </xsl:element>
                                            </xsl:if>
                                        </span>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            <div class="supressions_prev_btn"><a>Précédent</a></div>
                            <div class="supressions_next_btn"><a>Suivant</a></div>
                        </div> 
                    </div>
                    <div id="depl">
                    <div id="deplacements">
                        <h4><img src="img/grey_dot.png" alt=""/> Déplacements <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='deplacement']) div 2"/>]</span></h4>
                        <ul id="supressions_carousel">
                            
                            <xsl:for-each select="//choice[@ana='deplacement']">
                                <xsl:choose>
                                    <xsl:when test=". =preceding::choice[@ana='deplacement']"></xsl:when>
                                    <xsl:otherwise><li style="text-align:justify;">
                                        <span class="counter">[<xsl:value-of select="(count(preceding::choice[@ana='deplacement']) div 2)+1"/>]</span>
                                        <span class="entries d_highlight">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                                <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                                <xsl:attribute name="title"><xsl:value-of select="translate(descendant::*,' ', $esp)"/></xsl:attribute>
                                            </xsl:element>
                                            <xsl:value-of select="translate(substring(descendant::*,0,10),' ', $esp)"/>
                                            <xsl:if test="string-length(substring(descendant::*, 10)) > 0"><xsl:element name="span">
                                                <xsl:attribute name="class">light</xsl:attribute>
                                                <xsl:text>...</xsl:text>
                                            </xsl:element>
                                            </xsl:if>
                                        </span>
                                    </li></xsl:otherwise>
                                </xsl:choose>
                                
                            </xsl:for-each>
                        </ul></div>
                    </div>
                        <div id="deplacements_buttons">
                        <div class="deplacements_prev_btn"><a>Précédent</a></div>
                        <div class="deplacements_next_btn"><a>Suivant</a></div></div>
                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section><!--voir si tout va bien ici-->
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
    
    <xsl:template match="span" mode="text2">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:text>#g</xsl:text><xsl:value-of select="count(preceding::span)"/><xsl:text>para</xsl:text></xsl:attribute>
            <xsl:attribute name="id"><xsl:text>d</xsl:text><xsl:value-of select="count(preceding::span)"/><xsl:text>para</xsl:text></xsl:attribute>
            <xsl:attribute name="class">para</xsl:attribute>
            <xsl:attribute name="onclick">align('<xsl:text>g</xsl:text><xsl:value-of select="count(preceding::span)"/><xsl:text>para')</xsl:text></xsl:attribute>
            <xsl:apply-templates mode="text2"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="span" mode="text1">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:text>#d</xsl:text><xsl:value-of select="count(preceding::span)"/><xsl:text>para</xsl:text></xsl:attribute>
            <xsl:attribute name="id"><xsl:text>g</xsl:text><xsl:value-of select="count(preceding::span)"/><xsl:text>para</xsl:text></xsl:attribute>
            <xsl:attribute name="class">para</xsl:attribute>
            <xsl:attribute name="onclick">align('<xsl:text>d</xsl:text><xsl:value-of select="count(preceding::span)"/><xsl:text>para')</xsl:text></xsl:attribute>
            <xsl:apply-templates mode="text1"/>
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
                <xsl:apply-templates select="orig" mode="text1"/>
        </xsl:template>
    
    <xsl:template match="choice" mode="name">
        <xsl:value-of select="@ana"/>
    </xsl:template>
    
        <xsl:template match="choice[descendant::orig and descendant::reg]" mode="text2">
                <xsl:apply-templates select="reg" mode="text2"/>
        </xsl:template>
    
        <xsl:template match="choice[descendant::orig and not(descendant::reg)]" mode="text1">
                <xsl:apply-templates select="orig" mode="text1"/>
        </xsl:template>
    
        <xsl:template match="choice[descendant::orig and not(descendant::reg)]" mode="text2">
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:text>#g</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                        <xsl:attribute name="id"><xsl:text>d</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                        <xsl:attribute name="class"><xsl:value-of select="@ana"/></xsl:attribute>
                        <xsl:attribute name="onclick">align('<xsl:text>g</xsl:text><xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                    </xsl:element>
        </xsl:template>
        
    <xsl:template match="choice[descendant::reg and not(descendant::orig)]" mode="text1">
        <xsl:element name="a">
                <xsl:attribute name="href"><xsl:text>#d</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
            <xsl:attribute name="id"><xsl:text>g</xsl:text><xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                <xsl:attribute name="class"><xsl:value-of select="@ana"/></xsl:attribute>
            <xsl:attribute name="onclick">align('<xsl:text>d</xsl:text><xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
            </xsl:element>
    </xsl:template>
     
    <xsl:template match="*" mode="orig">
        <xsl:apply-templates mode="text2"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="*" mode="reg">
        <xsl:apply-templates mode="text1"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="p[not(@resp='orig') and not(following-sibling::p[@resp='orig'][1])]" mode="text2">
                
                        <xsl:element name="{local-name()}">
                            <xsl:if test="@resp ='reg'"><xsl:attribute name="class">reg</xsl:attribute><span class="preg">&#182; </span></xsl:if>
                            <xsl:if test="@rend ='noindent'"><xsl:attribute name="class">noindent</xsl:attribute></xsl:if>
                                <xsl:apply-templates mode="text2"/>
                        </xsl:element>
    </xsl:template>
    <!--pour éviter le double affichage des @resp="orig", on désactive l'affichage en text2 et on appelle template @name='orig' à la place-->
    <xsl:template match="p[following-sibling::p[@resp='orig'][1] and not(@resp='orig')]" mode="text2">
        <xsl:text>&lt;/p&gt;</xsl:text><xsl:text>&lt;p</xsl:text>
        <xsl:if test="@resp ='reg'"><xsl:text> class="reg"</xsl:text></xsl:if>
        <xsl:text>&gt;</xsl:text>
        <xsl:if test="@resp ='reg'"><span class="preg">&#182; </span></xsl:if>
        <xsl:apply-templates mode="text2"/>
        <xsl:text></xsl:text>
    </xsl:template>
    
    <xsl:template match="p[@resp ='orig']" mode="text2">
        <xsl:apply-templates mode="text2"/>
        <xsl:if test="not(following-sibling::p[@resp='orig'][1])"><xsl:text>&lt;/p&gt;</xsl:text></xsl:if>
    </xsl:template>
    
    <xsl:template match="p[not(@resp='reg') and not(following-sibling::p[@resp='reg'][1])]" mode="text1">
        
        <xsl:element name="{local-name()}">
            <xsl:if test="@resp ='orig'"><xsl:attribute name="class">orig</xsl:attribute><span class="porig">&#182; </span></xsl:if>
            <xsl:if test="@rend ='noindent'"><xsl:attribute name="class">noindent</xsl:attribute></xsl:if>
           
                        <xsl:apply-templates mode="text1"/>
                    
            
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="p[following-sibling::p[@resp='reg'][1] and not(@resp='reg')]" mode="text1">
        <xsl:text>&lt;/p&gt;</xsl:text><xsl:text>&lt;p</xsl:text>
        <xsl:if test="@rend ='orig'"><xsl:text> class="orig"</xsl:text></xsl:if>
        <xsl:text>&gt;</xsl:text>
        <xsl:if test="@rend ='orig'"><span class="porig">&#182; </span></xsl:if>
        <xsl:apply-templates mode="text1"/>
        <xsl:text></xsl:text>
    </xsl:template>
    
    <xsl:template match="p[@resp ='reg']" mode="text1">
        <xsl:apply-templates mode="text1"/>
        <xsl:if test="not(following-sibling::p[@resp='reg'][1])"><xsl:text>&lt;/p&gt;</xsl:text></xsl:if>
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
            <xsl:element name="em">
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
            <xsl:element name="em">
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
                    <xsl:text>[p. </xsl:text><xsl:value-of select="@n"/><xsl:text>]</xsl:text>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="pb" mode="text2">
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
                <xsl:otherwise><xsl:text> </xsl:text>
                    <xsl:element name="a">
                        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                        <xsl:attribute name="class">pb</xsl:attribute>
                        <xsl:if test="@facs"><xsl:attribute name="href"><xsl:value-of select="@facs"/></xsl:attribute></xsl:if>
                        <xsl:attribute name="title">Page n°<xsl:value-of select="@n"/></xsl:attribute>
                        <xsl:text>[p. </xsl:text><xsl:value-of select="@n"/><xsl:text>]</xsl:text>
                    </xsl:element>
                </xsl:otherwise>
            
        </xsl:choose>
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
        
