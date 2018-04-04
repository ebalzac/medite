from bs4 import BeautifulSoup
import urllib2
import re
import html5lib

"""remet les chevrons pour reconstituer le balisage (#=chevron ouvrant, +=chevron fermant)"""


def balisage(chaine):
    chaine = re.sub((r'\s*###\s*'), '<', chaine)
    chaine = re.sub(r'\s*\+\+\+\s*', '>', chaine)
    return chaine


"""trouve l'id du bloc commun suivant le deplacement ou l'insertion"""


def trouve_id(element):
    for s in t2:
        if s == element or s.find('span') == element:
            frere = s.next_sibling
            if str(frere['class']) == "[u'span_c']":
                if frere.find(frere.child, attrs={"class": u"span_d"}):
                    return trouve_id(frere)
                else:
                    return str(frere['id'][2:])
            else:
                return trouve_id(frere)


compile_rempl = {}


def compile_variantes(element, compilation):
    for s in t2:
        if s == element or s.find('span') == element:

            frere = s.next_sibling
            """si le frere suivant est un bloc commun, on regarde s'il ne s'agit pas de deplacement"""
            """s'il s'agit de deplacement, on l'ajoute a la compilation et on continue la recherche. Sinon, on renvoie la compilation"""
            """si le frere suivant est une insertion, on l'ajoute a la compilation et on continue la recherche."""
            """si le frere suivant est un remplacement, on l'ajoute comme clef dans compile_rempl et on definit la compilation comme sa valeur"""

            if str(frere['class']) == "[u'span_c']":
                if frere.find(frere.child, attrs={"class": u"span_d"}):
                    frere_compile = frere.find(frere.child).text.encode('utf-8')

                    frere_compile = balisage_dans_variantes(frere_compile, 'deplacement', 'reg')
                    compilation = compilation + frere_compile

                    return compile_variantes(frere, compilation)
                else:
                    return compilation



            elif str(frere['class']) == "[u'span_i']":
                frere_compile = frere.text.encode('utf-8')
                frere_compile = balisage_dans_variantes(frere_compile, 'insertion', 'reg')
                compilation = compilation+frere_compile
                return compile_variantes(frere, compilation)

            elif str(frere['class']) == "[u'span_r']":
                remplacement = frere
                compile_rempl[remplacement] = compilation

                return ('')
def balisage_dans_variantes(valeur, type, choice):
    elements_bal = re.split(r"###", valeur)
    resultat = ''
    print elements_bal
    for el in elements_bal:
        print el
        if re.search(r"/.+\+\+\+", el):
            word = re.findall(r'/.+\+\+\+([A-Z].+)', el)
            for w in word:
                print 'word '+w
            el = re.sub(r"\+\+\+", '> ', el)
            el = ' <' + el
            resultat = resultat+el

        elif re.search(r".+\+\+\+", el):
            el = re.sub(r"\+\+\+\s*", r' resp="'+choice+'"> ', el)
            el = " <" + el
            word = re.findall(r'/.+\+\+\+([A-Z].+)', el)
            for w in word:
                print 'word ' + w
            resultat = resultat + el
        elif len(el) > 0:
            if re.match(r'\s\s+', el):
                el = ""
                resultat = resultat+el
            elif type !='remplacement':
                el = """<choice ana=\""""+type+"""\"><"""""+choice+""">""" + el + """</"""+choice+"""></choice>"""
                resultat = resultat + el
            else:
                el= """"<"""""+choice+""">""" + el + """</"""+choice+""">"""
                resultat = resultat + el
    return resultat

fichier = open('balzac-01-M-maison-chat-pelote.xml', 'a')

"""Lecture des resultats MEDITE (html)"""
link = "file:////home/samuel/Bureau/comparaison.html"
f = urllib2.urlopen(link).read()

"""On met chaque texte dans une variable"""
soup = BeautifulSoup(f, "html5lib")
t1 = soup.find('div', attrs={"id": u"txt_window"})
t2 = soup.find('div', attrs={"id": u"txt_window_2"})

"""On met tous les fils <span> du texte1 dans un tableau"""
span = t1.findChildren('span')
span2 = t2.findChildren('span')

"""On cree une liste dans laquelle on met tous les remplacements presents dans le texte 2 (on ajoute au debut)"""

rempl = []
for r in t2.findAll('span', attrs={"class": u"span_r"}):
    valeur = r.text.encode('utf-8')
    """if re.search(r'#', valeur):
        r = balisage_dans_variantes(valeur, 'remplacement', 'reg')"""
    rempl.append(r)
print rempl
insert = {}

for item in t2.findAll('span', attrs={"class": u"span_i"}):
    frere_prec = item.previous_sibling
    v = item.text.encode('utf-8')

    if frere_prec.find('span'):

        insertion_texte = " "
    elif re.match('\s\s+', v):
        insertion_texte = re.sub('\s\s+', '', v)
        if len(insertion_texte)>0:
            if re.search(r'#', v):
                insertion_texte = balisage_dans_variantes(v, "insertion", "reg")


                insertion_texte = compile_variantes(item, insertion_texte)

                id = trouve_id(item)
                insert[id] = insertion_texte
    else:
        if re.search(r'#', v):
            insertion_texte = balisage_dans_variantes(v, "insertion", "reg")


            insertion_texte = compile_variantes(item, insertion_texte)

            id = trouve_id(item)
            insert[id] = insertion_texte


        else:
            insertion_texte = """<choice ana="insertion"><reg>""" + item.text.encode('utf-8') + """</reg></choice>"""
            insertion_texte = compile_variantes(item, insertion_texte)
            if (len(str(insertion_texte)) > 0):
                id = trouve_id(item)
                insert[id] = insertion_texte


depl = {}
for d in t2.findAll('span', attrs={"class": u"span_d"}):
    frere_prec = d.parent.previous_sibling
    v= d.text.encode('utf-8')
    if str(frere_prec['class']) == "[u'span_i']":

        deplacement_texte= ''
    elif re.match('\s\s+', v):
        deplacement_texte = re.sub('\s\s+', '', v)
        if len(deplacement_texte) > 0:
                if re.search(r'#', v):
                    deplacement_texte = balisage_dans_variantes(v, "deplacement", "reg")
                    deplacement_texte = compile_variantes(d, deplacement_texte)

                    ID = trouve_id(depl)
                    depl[ID] = deplacement_texte

    else:
        if re.search(r'#', v):

            deplacement_texte = balisage_dans_variantes(v, "deplacement", "reg")
            deplacement_texte = compile_variantes(d, deplacement_texte)
            if (len(deplacement_texte) > 0):
                ID = trouve_id(d)
                depl[ID] = deplacement_texte
        else:
            deplacement_texte = """<choice ana="deplacement"><reg>""" + d.text.encode('utf-8') + """</reg></choice>"""
            deplacement_texte = compile_variantes(d, deplacement_texte)
            if (len(deplacement_texte) > 0):
                ID = trouve_id(d)
                depl[ID] = deplacement_texte

i = 0
text = ''
while (i < len(span)):
    if (str(span[i]['class'])) == "[u'span_r']":
        reg = rempl.__getitem__(0)
        del rempl[0]
        for c, v in compile_rempl.items():
            if reg == c:
                text = text + v
        valeur = span[i].text.encode('utf-8')
        reg = reg.text.encode('utf-8')
        if re.search('#', valeur):
            valeur = balisage_dans_variantes(valeur, 'remplacement', 'orig')
            if re.search ('#', reg):
                reg = balisage_dans_variantes(reg, 'remplacement', 'reg')
                valeur = "choice ana=\"remplacement\">"+valeur + reg+"""</choice>"""
            else:
                valeur = "choice ana=\"remplacement\">" +valeur + """<reg>"""+reg + """</reg></choice>"""
        else:
            if re.search ('#', reg):
                reg = balisage_dans_variantes(reg, 'remplacement', 'reg')
                valeur = "<choice ana=\"remplacement\"><orig>"""+valeur+"""</orig>"""+reg+"""</choice>"""
            else:
                valeur = "<choice ana=\"remplacement\"><orig>"""+valeur+"""</orig><reg>"""+reg+"""</reg></choice>"""
        print valeur
        text = text + valeur

    elif (str(span[i]['class'])) == "[u'span_s']":
        valeur = span[i].text.encode('utf-8')
        if re.search(r'#', valeur):
            valeur = balisage_dans_variantes(valeur, 'supression', 'orig')

        elif re.match('\s+\W', valeur):
            valeur = ''
        else:
            valeur = """<choice ana="supression"><orig>""" + valeur + """</orig></choice>"""

        text = text+valeur
    elif (str(span[i]['class'])) == "[u'span_c']":
        for c, v in insert.items():
            if span[i]['id'][2:] == c:
                text = text + v
        for C, V in depl.items():
            if span[i]['id'][2:] == C:
                text = text + V
        for child in span[i].children:

            if child.name == 'span':

                child = """<choice ana="deplacement"><orig>""" + child.text.encode(
                    'utf-8') + """</orig></choice>"""
            elif child.encode('utf-8') == '<br/>':
                child = ""
            else:
                child = child.encode('utf-8')
                child = balisage(child)
            text = text + child

    i = i + 1


"""Gere le probleme des variantes dans l'element page break"""
pb = re.findall(r'<pb.+?/>{1}', text)

for e in pb:
    m = re.findall(r'<pb(.+?)/>', e)

    if re.search(r'choice', m[0]):
        balise_orig = re.findall(r'<orig>(.+?)</orig>', m[0])
        balise_reg = re.findall(r'<reg>(.+?)</reg>', m[0])
        sans_choice = re.sub(r'</?choice.*?>', '', e)
        ajdi = re.findall('xml:id="(.+?)"', sans_choice)

        pb_orig = re.sub('^<pb', '<pb resp="orig"', sans_choice)
        pb_orig = ''
        for borg in balise_orig:
            pb_orig = re.sub('<orig>.+?</orig>', borg, pb_orig)
        for breg in balise_reg:
            pb_orig = re.sub(breg, '', pb_orig)
            pb_orig = re.sub(r'<reg></reg>', '', pb_orig)

        pb_reg = re.sub('^<pb', '<pb resp="reg"', sans_choice)
        id_reg = ajdi[0] + '_reg'
        pb_reg = re.sub(ajdi[0], id_reg, pb_reg)
        for breg in balise_reg:
            pb_reg = re.sub('<reg>.+?</reg>', breg, pb_reg)
        for borig in balise_orig:
            pb_reg = re.sub(borig, '', pb_reg)
            pb_reg = re.sub(r'<orig></orig>', '', pb_reg)

        h = pb_orig + pb_reg
        text = re.sub(e, h, text)
print (text)
fichier.write(text)
fichier.close()
