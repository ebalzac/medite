<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
        <xsl:output encoding="UTF-8" method="html"/>
    <xsl:strip-space elements="*"/>
    
    
    <xsl:variable name="esp">&#160;</xsl:variable>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <link href="medite.css" rel="stylesheet" type="text/css" title="style par défaut"/>
                        <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet"/>
                <title><xsl:value-of select="//titleStmt/title[@type='orig']"/> : <xsl:value-of select="//titleStmt/title[@type='reg']"/></title>
                            <link rel="stylesheet" href="css/style.css" type="text/css"/>
                <script type="text/javascript" src="js/jquery-min.js"/>
                                <script type="text/javascript" src="js/js.cookie.js"></script><script type="text/javascript" src="js/easing-min.js"/><script type="text/javascript" src="js/jquery.scrollTo-min.js"/>
                                
                                <script>function align(a){
                                    document.getElementById(a).click()}</script></head>
            <body>
                                <article class="comparaison-html">
                                    <article id="windows">
                                        
                                        <article class="txt_container left">
                                            <div id="txt_title1"><xsl:value-of select="//titleStmt/title[@type='orig']"/></div>
                                            <article id="txt_window">
                                                <xsl:apply-templates select="//text" mode="text1"/>
                                                <!--</form>--></article>
                                        </article>
                                        <article class="txt_container right">
                                            <div id="txt_title2"><xsl:value-of select="//titleStmt/title[@type='reg']"/></div>
                                            <article id="txt_window_2">
                    <xsl:apply-templates select="//text" mode="text2"/>
                <!--</form>--></article>
                                        </article>
                                        <div id="modifications">
                                            <div id="rempl_ins_supp">
                                                <div id="remplacements"><h4><img src="img/blue_dot.png" alt=""/> Remplacements <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='remplacement'])"/>]</span></h4>
                                                    <ul id="remplacements_carousel">
                                                        <xsl:for-each select="//choice[@ana='remplacement']">
                                                            <li>
                                                                <span class="counter">[<xsl:value-of select="count(preceding::choice[@ana='remplacement'])+1"/>]</span>
                                                                <span class="r_highlight">
                                                                    <xsl:element name="a">
                                                                        <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                                                        <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                                                        <xsl:attribute name="title"><xsl:value-of select="translate(descendant::orig,' ', $esp)"/><xsl:text>→</xsl:text><xsl:value-of select="translate(descendant::reg,' ', '&#160;')"/></xsl:attribute>
                                                                        
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
                                                                    </xsl:element>
                                                                </span>
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                    <div class="remplacements_prev_btn"><a>Précédent</a></div>
                                                    <div class="remplacements_next_btn"><a>Suivant</a></div>
                                                </div>
                                                <div id="insertions"><h4><img src="img/green_dot.png" alt=""/> Insertions <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='insertion'])+count(//p[@resp='reg'])"/>]</span></h4>
                                                    <ul id="insertions_carousel">
                                                        
                                                        <xsl:for-each select="//choice[@ana='insertion']">
                                                            <li style="text-align:justify;">
                                                                <span class="counter">[<xsl:value-of select="count(preceding::choice[@ana='insertion'])+1"/>]</span>
                                                                <span class="entries i_highlight">
                                                                    <xsl:element name="a">
                                                                        <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                                                        <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                                                        <xsl:attribute name="title"><xsl:value-of select="translate(descendant::reg,' ', $esp)"/></xsl:attribute>
                                                                        
                                                                        <xsl:value-of select="translate(substring(descendant::reg,0,20),' ', $esp)"/>
                                                                        <xsl:if test="string-length(substring(descendant::reg, 20)) > 0"><xsl:element name="span">
                                                                            <xsl:attribute name="class">light</xsl:attribute>
                                                                            <xsl:text>...</xsl:text>
                                                                        </xsl:element>
                                                                        </xsl:if></xsl:element>
                                                                </span>
                                                            </li>
                                                        </xsl:for-each>
                                                        <li style="text-align:justify">
                                                            <span class="counter">¶[<xsl:value-of select="count(//p[@resp='reg'])"/>]</span>
                                                            <xsl:for-each select="//p[@resp='reg']">
                                                                
                                                                <li style="display:inline-block;">
                                                                    <xsl:element name="a">
                                                                        <xsl:attribute name="href">#reg<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                                                                        <xsl:attribute name="onclick">align('orig<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                                                                        <xsl:attribute name="title"><xsl:value-of select="count(preceding::p[@resp='reg'])+1"/></xsl:attribute>
                                                                        <xsl:value-of select="count(preceding::p[@resp='reg'])+1"/>
                                                                    </xsl:element>
                                                                </li>
                                                                
                                                                <span class="separator">⚫</span>
                                                            </xsl:for-each>
                                                        </li>
                                                    </ul>
                                                    <div class="insertions_prev_btn"><a>Précédent</a></div>
                                                    <div class="insertions_next_btn"><a>Suivant</a></div>
                                                </div>
                                                <div id="suppressions"><h4><img src="img/red.png" alt=""/> Supressions <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='suppression'])+count(//p[@resp='orig'])"/>]</span></h4>
                                                    <ul id="suppressions_carousel">
                                                        
                                                        <xsl:for-each select="//choice[@ana='suppression']">
                                                            <li style="text-align:justify;">
                                                                <span class="counter">[<xsl:value-of select="count(preceding::choice[@ana='suppression'])+1"/>]</span>
                                                                <span class="entries i_highlight">
                                                                    <xsl:element name="a">
                                                                        <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                                                        <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                                                        <xsl:attribute name="title"><xsl:value-of select="translate(descendant::orig,' ', $esp)"/></xsl:attribute>
                                                                        
                                                                        <xsl:value-of select="translate(substring(orig,0,20),' ', $esp)"/>
                                                                        <xsl:if test="string-length(substring(orig, 20)) > 0"><xsl:element name="span">
                                                                            <xsl:attribute name="class">light</xsl:attribute>
                                                                            <xsl:text>...</xsl:text>
                                                                        </xsl:element>
                                                                        </xsl:if></xsl:element>
                                                                </span>
                                                            </li>
                                                        </xsl:for-each>
                                                        <li style="text-align:justify">
                                                            <span class="counter">¶[<xsl:value-of select="count(//p[@resp='orig'])"/>]</span>
                                                            <xsl:for-each select="//p[@resp='orig']">
                                                                
                                                                <li style="display:inline-block;">
                                                                    <xsl:element name="a">
                                                                        <xsl:attribute name="href">#orig<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                                                                        <xsl:attribute name="onclick">align('reg<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                                                                        <xsl:attribute name="title"><xsl:value-of select="count(preceding::p[@resp='orig'])+1"/></xsl:attribute>
                                                                        <xsl:value-of select="count(preceding::p[@resp='orig'])+1"/>
                                                                    </xsl:element>
                                                                </li>
                                                                <span class="separator">⚫</span>
                                                            </xsl:for-each>
                                                        </li>
                                                    </ul>
                                                    <div class="suppressions_prev_btn"><a>Précédent</a></div>
                                                    <div class="suppressions_next_btn"><a>Suivant</a></div>
                                                </div> 
                                            </div>
                                            <div id="depl">
                                                <div id="deplacements">
                                                    <h4><img src="img/grey_dot.png" alt=""/> Déplacements <span class="nbr_occurences">[<xsl:value-of select="count(//choice[@ana='deplacement']) div 2"/>]</span></h4>
                                                    <ul id="suppressions_carousel">
                                                        
                                                        <xsl:for-each select="//choice[@ana='deplacement']">
                                                            <xsl:choose>
                                                                <xsl:when test=". =preceding::choice[@ana='deplacement']"></xsl:when>
                                                                <xsl:otherwise><li style="text-align:justify;">
                                                                    <span class="counter">[<xsl:value-of select="(count(preceding::choice[@ana='deplacement']) div 2)+1"/>]</span>
                                                                    <span class="entries d_highlight">
                                                                        <xsl:element name="a">
                                                                            <xsl:attribute name="href">#d<xsl:value-of select="count(preceding::choice)"/></xsl:attribute>
                                                                            <xsl:attribute name="onclick">align('g<xsl:value-of select="count(preceding::choice)"/>')</xsl:attribute>
                                                                            <xsl:attribute name="title"><xsl:value-of select="translate(descendant::*[text()],' ', $esp)"/></xsl:attribute>
                                                                            
                                                                            <xsl:value-of select="translate(substring(descendant::*[text()],0,10),' ', $esp)"/>
                                                                            <xsl:if test="string-length(substring(descendant::*[text()], 10)) > 0"><xsl:element name="span">
                                                                                <xsl:attribute name="class">light</xsl:attribute>
                                                                                <xsl:text>...</xsl:text>
                                                                            </xsl:element>
                                                                            </xsl:if></xsl:element>
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
                                    </article>
                                </article>
                <script>
                    function toggle_modifications(){
                    $('#modifications').toggleClass('active');
                    Cookies.set('panneau-modifications', $('#modifications').hasClass('active'));
                    }
                    
                    $(document).ready(function(){
                    $('#rempl_ins_supp > div > h4, #depl > div > h4').on('click touch', function(){
                    $parent = $(this).parent();
                    $('.liste-visible').not($parent).removeClass('liste-visible');
                    $parent.toggleClass('liste-visible');
                    });
                    
                    var scroll_options = {
                    interrupt: true
                    };
                    
                    $('#txt_title_1').html( $('#version_base').val() );
                    $('#txt_title_2').html( $('#version_destination').val() );
                    $('#txt_title_1, #txt_title_2').on('click touch', function(){
                    var $titre = $(this);
                    $titre.parents('#windows').toggleClass('large');
                    $('body > section').scrollTo( $titre, 250, {});
                    });
                    
                    $('.comparaison-html [id*="txt_window"]').each(function(){
                    var $bloc_texte = $(this);
                    var $bloc_texte_opposee = $(this).parent().siblings().find('[id*="txt_window"]');
                    $('.span_c', $bloc_texte).each(function(){
                    var $span   = $(this);
                    var attr_id = $span.attr('id');
                    var lettre  = attr_id.substr(0,1) == 'c'
                    ? 'b'
                    : 'c';
                    var cible   = '#' + lettre + attr_id.substr(1);
                    $span.attr('data-cible', cible);
                    });
                    $('.span_c', $bloc_texte).on('mouseenter', function(){
                    var $span   = $(this);
                    var $cible  = $( $span.attr('data-cible') );
                    $cible.addClass('survol-cible');
                    });
                    $('.span_c', $bloc_texte).on('mouseleave', function(){
                    var $span   = $(this);
                    var $cible  = $( $span.attr('data-cible') );
                    $cible.removeClass('survol-cible');
                    });
                    $('.span_c', $bloc_texte).on('click touch', function(){
                    var $span   = $(this);
                    var $cible  = $( $span.attr('data-cible') );
                    $bloc_texte_opposee.scrollTo( $cible, 250, scroll_options );
                    $bloc_texte.scrollTo( $span, 250, scroll_options );
                    });
                    });
                    
                    if ( Cookies.get('panneau-modifications') == 'true' ){
                    $('#modifications').addClass('active');
                    }
                    
                    setTimeout(function(){
                    if ( typeof(Cookies.get('panneau-modifications')) == 'undefined' ){
                    $('#modifications').addClass('active');
                    setTimeout(function(){
                    $('#modifications').removeClass('active');
                    },3000)
                    }
                    $(".svg-loader").addClass('hidden');
                    $(".comparaison-html").show();
                    $(".hamburger-modifications").show();
                    });
                    
                    });
                    
                    $('.pb').each(function(){
                    var $lien     = $(this);
                    var url_image;
                    if ( $lien.hasClass('facs') ){
                    url_image = $lien.attr('href');
                    }else{
                    url_image = 'https://www.ebalzac.com/romans/' + version + '/furne-corrige/scans/' + $lien.attr('id') + '.jpg';
                    }
                    
                    var identifiant = $lien.attr('id');
                    $lien.attr( 'href', url_image );
                    $lien.attr('title', 'Page n°' + identifiant.substr(1) );
                    $lien.attr('data-caption', 'Page n°' + identifiant.substr(1) + '<br />' + '<a href="' + url_image + '" target="_blank">Voir l’image</a>' );
                    $lien.attr('target', '_blank');
                    $lien.html( $lien.html().replace(/\{|\}/g,'') );
                    $lien.on('click touch', function(e){
                    $('.apercu-page > img').attr('src', url_image );
                    $('.apercu-page').addClass('apercu-visible');
                    e.stopPropagation();
                    e.preventDefault();
                    });
                    });</script>
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
    <xsl:template match="body/div/div" mode="text1">
        <xsl:element name="section">
            <xsl:attribute name="class">div level3</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body/div/div" mode="text2">
        <xsl:element name="section">
            <xsl:attribute name="class">div level3</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body/div/div/div" mode="text1">
        <xsl:element name="section">
            <xsl:attribute name="class">div level4</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="body/div/div/div" mode="text2">
        <xsl:element name="section">
            <xsl:attribute name="class">div level4</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    <xsl:template match="signed" mode="text1">
        <xsl:element name="div">
            <xsl:attribute name="class">signed</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="signed" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class">signed</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="head" mode="text1">
        <xsl:element name="h2">
            <xsl:attribute name="class">head</xsl:attribute>
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="head" mode="text2">
        <xsl:element name="h2">
            <xsl:attribute name="class">head</xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lb" mode="#all">
        <xsl:element name="br"/>
    </xsl:template>
    
    <xsl:template match="q"></xsl:template>
        
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
        <xsl:element name="span">
            <xsl:attribute name="id"><xsl:text>b_</xsl:text><xsl:value-of select="count(preceding::span)"/></xsl:attribute>
            <xsl:attribute name="class">span_c</xsl:attribute>
            <xsl:attribute name="data-cible"><xsl:text>#c_</xsl:text><xsl:value-of select="count(preceding::span)"/></xsl:attribute>
            <xsl:apply-templates mode="text2"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="span" mode="text1">
        <xsl:element name="span">
            <xsl:attribute name="id"><xsl:text>c_</xsl:text><xsl:value-of select="count(preceding::span)"/></xsl:attribute>
            <xsl:attribute name="class">span_c</xsl:attribute>
            <xsl:attribute name="data-cible"><xsl:text>#b_</xsl:text><xsl:value-of select="count(preceding::span)"/></xsl:attribute>
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
     
   <!-- <xsl:template match="*" mode="orig">
        <xsl:apply-templates mode="text2"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="*" mode="reg">
        <xsl:apply-templates mode="text1"></xsl:apply-templates>
    </xsl:template>-->
    
   <!-- <xsl:template match="p[not(@resp='orig') and not(following-sibling::p[@resp='orig'][1])]" mode="text2">
                
                        <xsl:element name="{local-name()}">
                            <xsl:if test="@resp ='reg'"><xsl:attribute name="class">reg</xsl:attribute><span class="preg"><xsl:value-of select="$esp"/></span></xsl:if>
                            <xsl:if test="@rend"><xsl:attribute name="class"><xsl:value-of select="."/></xsl:attribute></xsl:if>
                                <xsl:apply-templates mode="text2"/>
                        </xsl:element>
    </xsl:template>
    <!-\-pour éviter le double affichage des @resp="orig", on désactive l'affichage en text2 et on appelle template @name='orig' à la place-\->
    <xsl:template match="p[following-sibling::p[@resp='orig'][1] and not(@resp='orig')]" mode="text2">
        <xsl:text>&lt;/p&gt;</xsl:text><xsl:text>&lt;p</xsl:text>
        <xsl:if test="@resp ='reg'"><xsl:text> class="reg"</xsl:text></xsl:if>
        <xsl:text>&gt;</xsl:text>
        <xsl:if test="@resp ='reg'"><span class="preg"><xsl:value-of select="$esp"/></span></xsl:if>
        <xsl:apply-templates mode="text2"/>
        <xsl:text></xsl:text>
    </xsl:template>
    
    <xsl:template match="p[@resp ='orig']" mode="text2">
        <xsl:text> </xsl:text><xsl:apply-templates mode="text2"/>
        <xsl:if test="not(following-sibling::p[@resp='orig'][1])"><xsl:text>&lt;/p&gt;</xsl:text></xsl:if>
    </xsl:template>
    
    <xsl:template match="p[not(@resp='reg') and not(following-sibling::p[@resp='reg'][1])]" mode="text1">
        
        <xsl:element name="{local-name()}">
            <xsl:if test="@resp ='orig'"><xsl:attribute name="class">orig</xsl:attribute><span class="porig"><xsl:value-of select="$esp"/></span></xsl:if>
            <xsl:if test="@rend ='noindent'"><xsl:attribute name="class">autofirst</xsl:attribute></xsl:if>
           
                        <xsl:apply-templates mode="text1"/>
                    
            
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="p[following-sibling::p[@resp='reg'][1] and not(@resp='reg')]" mode="text1">
        <xsl:text>&lt;/p&gt;</xsl:text><xsl:text>&lt;p</xsl:text>
        <xsl:if test="@rend ='orig'"><xsl:text> class="orig"</xsl:text></xsl:if>
        <xsl:text>&gt;</xsl:text>
        <xsl:if test="@rend ='orig'"><span class="porig"><xsl:value-of select="$esp"/></span></xsl:if>
        <xsl:apply-templates mode="text1"/>
        <xsl:text></xsl:text>
    </xsl:template>
    
    <xsl:template match="p[@resp ='reg']" mode="text1">
        <xsl:text> </xsl:text><xsl:apply-templates mode="text1"/>
        <xsl:if test="not(following-sibling::p[@resp='reg'][1])"><xsl:text>&lt;/p&gt;</xsl:text></xsl:if>
    </xsl:template>-->
    
    <xsl:template match="p[not(@resp='reg')]" mode="text1">
        <xsl:choose>
            <xsl:when test="not(following-sibling::p[1][@resp='reg'])">
                <xsl:element name="p">
                    <xsl:if test="@rend"><xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@resp">
                        <xsl:element name="a">
                            <xsl:attribute name="class">porig</xsl:attribute>
                            <xsl:attribute name="id">orig<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                            <xsl:attribute name="href">#reg<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                            <xsl:attribute name="onclick">align('reg<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                            <xsl:value-of select="$esp"/>
                        </xsl:element></xsl:if>
                    <xsl:apply-templates mode="text1"/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="following-sibling::p[1][@resp='reg']">
                <xsl:element name="p">
                    <xsl:apply-templates mode="text1"/>
                    <xsl:element name="a">
                        <xsl:attribute name="class">porig</xsl:attribute>
                        <xsl:attribute name="id">orig<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                        <xsl:attribute name="href">#reg<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                        <xsl:attribute name="onclick">align('reg<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                    </xsl:element>
                    <xsl:apply-templates select="following-sibling::p[1][@resp='reg']" mode="orig"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="p[@resp='reg']" mode="orig">
        <xsl:apply-templates mode="text1"/>
        <xsl:if test="following-sibling::p[1][@resp='reg']">
            <xsl:element name="a">
                <xsl:attribute name="class">porig</xsl:attribute>
                <xsl:attribute name="id">orig<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                <xsl:attribute name="href">#reg<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                <xsl:attribute name="onclick">align('reg<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                <xsl:value-of select="$esp"/>
            </xsl:element>
            <xsl:apply-templates select="following-sibling::p[1][@resp='reg']" mode="orig"/>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="p[not(@resp='orig')]" mode="text2">
        <xsl:choose>
            <xsl:when test="not(following-sibling::p[1][@resp='orig'])">
                <xsl:element name="p">
                    <xsl:if test="@rend"><xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@resp">
                        <xsl:element name="a">
                            <xsl:attribute name="class">preg</xsl:attribute>
                            <xsl:attribute name="id">reg<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                            <xsl:attribute name="href">#orig<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                            <xsl:attribute name="onclick">align('orig<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                            <xsl:value-of select="$esp"/>
                        </xsl:element></xsl:if>
                    <xsl:apply-templates mode="text2"/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="following-sibling::p[@resp='orig'][1]">
                <xsl:element name="p">
                    <xsl:apply-templates mode="text2"/>
                    <xsl:element name="a">
                        <xsl:attribute name="class">preg</xsl:attribute>
                        <xsl:attribute name="id">reg<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                        <xsl:attribute name="href">#orig<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                        <xsl:attribute name="onclick">align('orig<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                        <xsl:value-of select="$esp"/>
                    </xsl:element>
                    <xsl:apply-templates select="following-sibling::p[1][@resp='orig']" mode="reg"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="p[@resp='orig']" mode="reg">
        <xsl:apply-templates mode="text2"/>
        <xsl:if test="following-sibling::p[1][@resp='orig']">
            <xsl:element name="a">
                <xsl:attribute name="class">preg</xsl:attribute>
                <xsl:attribute name="id">reg<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                <xsl:attribute name="href">#orig<xsl:value-of select="count(preceding::p[@resp])"/></xsl:attribute>
                <xsl:attribute name="onclick">align('orig<xsl:value-of select="count(preceding::p[@resp])"/>')</xsl:attribute>
                <xsl:value-of select="$esp"/>
            </xsl:element>
            <xsl:apply-templates select="following-sibling::p[1][@resp='orig']" mode="reg"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="p[@resp='reg']" mode="text1"/>
    <xsl:template match="p[@resp='orig']" mode="text2"/>
    
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
                <xsl:value-of select="$esp"/></xsl:element></xsl:otherwise>
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
            <xsl:value-of select="$esp"/></xsl:element></xsl:otherwise>
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
                    <xsl:text>[p.</xsl:text><xsl:value-of select="$esp"/><xsl:value-of select="@n"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise><xsl:text> </xsl:text>
                <xsl:element name="a">
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="class">pb</xsl:attribute>
                    <xsl:if test="@facs"><xsl:attribute name="href"><xsl:value-of select="@facs"/></xsl:attribute></xsl:if>
                    <xsl:attribute name="title">Page n°<xsl:value-of select="@n"/></xsl:attribute>
                    <xsl:text>[p.</xsl:text><xsl:value-of select="$esp"/><xsl:value-of select="@n"/><xsl:text>]</xsl:text>
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
                        <xsl:text>[p.</xsl:text><xsl:value-of select="$esp"/><xsl:value-of select="@n"/><xsl:text>]</xsl:text>
                    </xsl:element>
                </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="dateline" mode="text1">
        <xsl:element name="div">
            <xsl:attribute name="class">dateline<xsl:if test="@rend"> <xsl:value-of select="@rend"/></xsl:if></xsl:attribute>
            
            <xsl:apply-templates mode="text1"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="dateline" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class">dateline<xsl:if test="@rend"> <xsl:value-of select="@rend"/></xsl:if></xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="q" mode="text1">
        <xsl:element name="div">
            <xsl:attribute name="class"><xsl:value-of select="@type"/><xsl:text> q</xsl:text></xsl:attribute>
            <xsl:apply-templates mode="text1"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="q" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class"><xsl:value-of select="@type"/><xsl:text> q</xsl:text></xsl:attribute>
            <xsl:apply-templates mode="text2"/>
        </xsl:element>
    </xsl:template>
   
   <xsl:template match="closer | postscript | opener |l|lg" mode="text1">
       <xsl:element name="div">
           <xsl:attribute name="class"><xsl:value-of select="local-name()"/><xsl:if test="@rend"><xsl:text> </xsl:text><xsl:value-of select="@rend"/></xsl:if></xsl:attribute>
           <xsl:apply-templates mode="text1"></xsl:apply-templates>
       </xsl:element>
   </xsl:template>
    
    <xsl:template match="closer | postscript | opener| l|lg" mode="text2">
        <xsl:element name="div">
            <xsl:attribute name="class"><xsl:value-of select="local-name()"/><xsl:if test="@rend"><xsl:text> </xsl:text><xsl:value-of select="@rend"/></xsl:if></xsl:attribute>
            <xsl:apply-templates mode="text2"></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="quote" mode="text1">
        <xsl:element name="blockquote">
            <xsl:attribute name="class"><xsl:value-of select="local-name()"/></xsl:attribute>
            <xsl:apply-templates mode="text1"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="quote" mode="text2">
        <xsl:element name="blockquote">
            <xsl:attribute name="class"><xsl:value-of select="local-name()"/></xsl:attribute>
            <xsl:apply-templates mode="text2"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="label" mode="text1">
        <xsl:element name="p">
            <xsl:element name="label">
                <xsl:apply-templates mode="text1"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="label" mode="text2">
        <xsl:element name="p">
            <xsl:element name="label">
                <xsl:apply-templates mode="text2"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!--<xsl:template match="p[@rend]" mode="text1">
        <xsl:element name="p">
            <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
            <xsl:apply-templates mode="text1"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p[@rend]" mode="text2">
        <xsl:element name="p">
            <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
            <xsl:apply-templates mode="text2"/>
        </xsl:element>
    </xsl:template>-->
    
    </xsl:stylesheet>
        
