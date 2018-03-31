
# dplp-docker

This docker container allows you to build, install and run the
[DPLP RST discourse parser](https://github.com/jiyfeng/DPLP)
(Ji and Eisenstein 2014) in a docker container.


## Building / Installing DPLP

```
git clone https://github.com/NLPbox/dplp-docker
cd dplp-docker
docker build -t dplp .
```

## Running DPLP

To test if parser works, just run ``docker run dplp``.
To run the parser on the file ``/tmp/input.txt`` on your
local machine, run:

```
docker run -v /tmp:/tmp -ti dplp /tmp/input.txt
```

## Example Input

```
Henryk Szeryng (22 September 1918 - 8 March 1988) was a violin virtuoso
of Polish and Jewish heritage.

He was born in Zelazowa Wola, Poland. Henryk started piano and harmony
training with his mother when he was 5, and at age 7 turned to the
violin, receiving instruction from Maurice Frenkel. After studies with
Carl Flesch in Berlin (1929-32), he went to Paris to continue his
training with Jacques Thibaud at the Conservatory, graduating with a
premier prix in 1937.

He made his solo debut in 1933 playing the Brahms Violin Concerto. From
1933 to 1939 he studied composition in Paris with Nadia Boulanger, and
during World War II he worked as an interpreter for the Polish
government in exile (Szeryng was fluent in seven languages) and gave
concerts for Allied troops all over the world. During one of these
concerts in Mexico City he received an offer to take over the string
department of the university there.

In 1946, he became a naturalized citizen of Mexico.

Szeryng subsequently focused on teaching before resuming his concert
career in 1954. His debut in New York City brought him great acclaim,
and he toured widely for the rest of his life. He died in Kassel.

Szeryng made a number of recordings, including two of the complete
sonatas and partitas for violin by Johann Sebastian Bach, and several
of sonatas of Beethoven and Brahms with the pianist Arthur Rubinstein.
He also composed; his works include a number of violin concertos and
pieces of chamber music.

He owned the Del Gesu "Le Duc", the Stradivarius "King David" as well
as the Messiah Strad copy by Jean-Baptiste Vuillaume which he gave to
Prince Rainier III of Monaco. The "Le Duc" was the instrument on which
he performed and recorded mostly, while the latter ("King David" Strad)
was donated to the State of Israel.
```

## Example Output

```
0       1       Henryk  Henryk  NNP     compound        4       PERSON   (ROOT (FRAG (NP (NP (NNP Henryk)       1
0       2       Szeryng Szeryng NNP     compound        4       PERSON   (NNP Szeryng)  1
0       3       (22     (22     CD      nummod  4       NUMBER   (CD (22)       1
0       4       September       September       NNP     root    0       DATE     (NNP September))       1
0       5       1918    1918    CD      nummod  7       DATE     (SBAR (S (NP (NP (CD 1918)     1
0       6       -       -       :       punct   7       O        (: -)  2
0       7       8       8       CD      nsubj   12      DATE     (CD 8))        2
0       8       March   March   NNP     nmod:tmod       7       DATE     (NP-TMP (NNP March)    2
0       9       1988)   1988)   CD      nummod  8       DATE     (CD 1988))))   2
0       10      was     be      VBD     cop     12      O        (VP (VBD was)  3
0       11      a       a       DT      det     12      O        (NP (NP (DT a) 3
0       12      violin  violin  NN      acl:relcl       4       O        (NN violin)    3
0       13      virtuoso        virtuoso        JJ      amod    12      O        (JJ virtuoso)) 3
0       14      of      of      IN      case    18      O        (PP (IN of)    3
0       15      Polish  polish  JJ      amod    18      MISC     (NP (JJ Polish)        3
0       16      and     and     CC      cc      15      O        (CC and)       3
0       17      Jewish  jewish  JJ      conj    15      MISC     (JJ Jewish)    3
0       18      heritage.       heritage.       NN      nmod    12      O        (NN heritage.))))))))))        3

1       1       He      he      PRP     nsubjpass       3       O        (ROOT (S (NP (PRP He)) 4
1       2       was     be      VBD     auxpass 3       O        (VP (VBD was)  4
1       3       born    bear    VBN     root    0       O        (VP (VBN born) 4
1       4       in      in      IN      case    8       O        (PP (IN in)    4
1       5       Zelazowa        Zelazowa        NNP     compound        8       LOCATION         (NP (NP (NNP Zelazowa)4
1       6       Wola,   Wola,   NNP     compound        8       O        (NNP Wola,)    4
1       7       Poland. Poland. NNP     compound        8       O        (NNP Poland.)  4
1       8       Henryk  Henryk  NNP     nmod    3       PERSON   (NNP Henryk))  4
1       9       started start   VBD     acl:relcl       8       O        (SBAR (S (VP (VP (VBD started) 4
1       10      piano   piano   NN      compound        13      O        (NP (NN piano) 4
1       11      and     and     CC      cc      10      O        (CC and)       4
1       12      harmony harmony NN      conj    10      O        (NN harmony)   4
1       13      training        training        NN      dobj    9       O        (NN training)) 4
1       14      with    with    IN      case    16      O        (PP (IN with)  4
1       15      his     he      PRP$    nmod:poss       16      O        (NP (PRP$ his) 4
1       16      mother  mother  NN      nmod    9       O        (NN mother)))  4
1       17      when    when    WRB     advmod  20      O        (SBAR (WHADVP (WRB when))      5
1       18      he      he      PRP     nsubj   20      O        (S (NP (PRP he))       5
1       19      was     be      VBD     cop     20      O        (VP (VBD was)  5
1       20      5,      5,      CD      advcl   9       NUMBER   (NP (CD 5,))))))       5
1       21      and     and     CC      cc      9       O        (CC and)       5
1       22      at      at      IN      case    23      O        (VP (PP (IN at)        5
1       23      age     age     NN      nmod    25      O        (NP (NN age)   5
1       24      7       7       CD      nummod  23      NUMBER   (CD 7)))       5
1       25      turned  turn    VBD     conj    9       O        (VBD turned)   5
1       26      to      to      TO      case    28      O        (PP (TO to)    5
1       27      the     the     DT      det     28      O        (NP (DT the)   5
1       28      violin, violin, NN      nmod    25      O        (NN violin,))) 5
1       29      receiving       receive VBG     xcomp   25      O        (S (VP (VBG receiving) 5
1       30      instruction     instruction     NN      dobj    29      O        (NP (NN instruction))  5
1       31      from    from    IN      case    33      O        (PP (IN from)  5
1       32      Maurice Maurice NNP     compound        33      O        (NP (NP (NNP Maurice)  5
1       33      Frenkel.        Frenkel.        NNP     nmod    29      O        (NNP Frenkel.))        5
1       34      After   after   IN      case    35      O        (SBAR (S (PP (IN After)        5
1       35      studies study   NNS     nmod    43      O        (NP (NP (NNS studies)) 5
1       36      with    with    IN      case    38      O        (PP (IN with)  5
1       37      Carl    Carl    NNP     compound        38      PERSON   (NP (NP (NNP Carl)     5
1       38      Flesch  Flesch  NNP     nmod    35      PERSON   (NNP Flesch))  5
1       39      in      in      IN      case    40      O        (PP (IN in)    5
1       40      Berlin  Berlin  NNP     nmod    38      LOCATION         (NP (NNP Berlin)       5
1       41      (1929-32),      (1929-32),      CD      nummod  40      NUMBER   (CD (1929-32),)))))))  5
1       42      he      he      PRP     nsubj   43      O        (NP (PRP he))  5
1       43      went    go      VBD     acl:relcl       33      O        (VP (VBD went) 5
1       44      to      to      TO      case    45      O        (PP (TO to)    5
1       45      Paris   Paris   NNP     nmod    43      LOCATION         (NP (NNP Paris)))      5
1       46      to      to      TO      mark    47      O        (S (VP (TO to) 5                                                                                                                                                   [239/1808]
1       47      continue        continue        VB      xcomp   43      O        (VP (VB continue)      5
1       48      his     he      PRP$    nmod:poss       49      O        (NP (PRP$ his) 5
1       49      training        training        NN      dobj    47      O        (NN training)) 5
1       50      with    with    IN      case    52      O        (PP (IN with)  6
1       51      Jacques Jacques NNP     compound        52      PERSON   (NP (NNP Jacques)      6
1       52      Thibaud Thibaud NNP     nmod    47      PERSON   (NNP Thibaud)))        6
1       53      at      at      IN      case    55      O        (PP (IN at)    6
1       54      the     the     DT      det     55      O        (NP (NP (DT the)       6
1       55      Conservatory,   conservatory,   NN      nmod    47      O        (NN Conservatory,))    6
1       56      graduating      graduate        VBG     acl     55      O        (VP (VBG graduating)   7
1       57      with    with    IN      case    60      O        (PP (IN with)  7
1       58      a       a       DT      det     60      O        (NP (NP (DT a) 7
1       59      premier premier NN      compound        60      O        (NN premier)   7
1       60      prix    prix    NN      nmod    56      O        (NN prix))     7
1       61      in      in      IN      case    62      O        (PP (IN in)    7
1       62      1937.   1937.   CD      nmod    60      DATE     (NP (CD 1937.))))))))))))))))))))))))))))      7

2       1       He      he      PRP     nsubj   2       O        (ROOT (S (NP (PRP He)) 8
2       2       made    make    VBD     root    0       O        (VP (VBD made) 8
2       3       his     he      PRP$    nmod:poss       5       O        (NP (PRP$ his) 8
2       4       solo    solo    NN      compound        5       O        (NN solo)      8
2       5       debut   debut   NN      dobj    2       O        (NN debut))    8
2       6       in      in      IN      case    7       O        (PP (IN in)    8
2       7       1933    1933    CD      nmod    2       DATE     (NP (CD 1933)))        8
2       8       playing play    VBG     xcomp   2       O        (S (VP (VBG playing)   9
2       9       the     the     DT      det     12      O        (NP (NP (DT the)       9
2       10      Brahms  Brahms  NNP     compound        12      O        (NNP Brahms)   9
2       11      Violin  Violin  NNP     compound        12      O        (NNP Violin)   9
2       12      Concerto.       Concerto.       NNP     dobj    8       O        (NNP Concerto.))       9
2       13      From    from    IN      case    16      O        (SBAR (S (S (PP (IN From)      9
2       14      1933    1933    CD      nummod  16      DATE     (NP (CD 1933)  9
2       15      to      to      TO      dep     16      O        (TO to)        9
2       16      1939    1939    CD      nmod    18      DATE     (CD 1939)))    9
2       17      he      he      PRP     nsubj   18      O        (NP (PRP he))  9
2       18      studied study   VBD     acl:relcl       12      O        (VP (VBD studied)      9
2       19      composition     composition     NN      dobj    18      O        (NP (NN composition))  9
2       20      in      in      IN      case    21      O        (PP (IN in)    9
2       21      Paris   Paris   NNP     nmod    18      LOCATION         (NP (NNP Paris)))      9
2       22      with    with    IN      case    24      O        (PP (IN with)  9
2       23      Nadia   Nadia   NNP     compound        24      O        (NP (NNP Nadia)        9
2       24      Boulanger,      Boulanger,      NNP     nmod    18      O        (NNP Boulanger,)))))   9
2       25      and     and     CC      cc      18      O        (CC and)       9
2       26      during  during  IN      case    29      O        (S (PP (IN during)     9
2       27      World   World   NNP     compound        29      MISC     (NP (NNP World)        9
2       28      War     War     NNP     compound        29      MISC     (NNP War)      9
2       29      II      II      NNP     nmod    31      MISC     (NNP II)))     9
2       30      he      he      PRP     nsubj   31      O        (NP (PRP he))  9
2       31      worked  work    VBD     conj    18      O        (VP (VBD worked)       9
2       32      as      as      IN      mark    43      O        (SBAR (IN as)  10
2       33      an      a       DT      det     34      O        (S (NP (NP (DT an)     10
2       34      interpreter     interpreter     NN      nsubj   43      O        (NN interpreter))      10
2       35      for     for     IN      case    38      O        (PP (IN for)   10
2       36      the     the     DT      det     38      O        (NP (NP (DT the)       10
2       37      Polish  polish  JJ      amod    38      MISC     (JJ Polish)    10
2       38      government      government      NN      nmod    34      O        (NN government))       10
2       39      in      in      IN      case    41      O        (PP (IN in)    10
2       40      exile   exile   NN      compound        41      O        (NP (NN exile) 10
2       41      (Szeryng        (szeryng        NN      nmod    38      O        (NN (Szeryng))))))     10
2       42      was     be      VBD     cop     43      O        (VP (VP (VBD was)      10
2       43      fluent  fluent  JJ      advcl   31      O        (ADJP (JJ fluent))     10
2       44      in      in      IN      case    46      O        (PP (IN in)    10
2       45      seven   seven   CD      nummod  46      NUMBER   (NP (CD seven) 10
2       46      languages)      languages)      NN      nmod    43      O        (NN languages)))))     10
2       47      and     and     CC      cc      43      O        (CC and)       10
2       48      gave    give    VBD     conj    43      O        (VP (VBD gave) 10                                                                                                                                                  [174/1808]
2       49      concerts        concert NNS     iobj    48      O        (NP (NP (NNS concerts))        10
2       50      for     for     IN      case    52      O        (PP (IN for)   10
2       51      Allied  Allied  NNP     compound        52      MISC     (NP (NNP Allied)       10
2       52      troops  troops  NNS     nmod    49      O        (NNS troops))))        10
2       53      all     all     DT      dobj    48      O        (NP (NP (DT all))      10
2       54      over    over    IN      case    56      O        (PP (IN over)  10
2       55      the     the     DT      det     56      O        (NP (DT the)   10
2       56      world.  world.  NNP     nmod    53      O        (NNP world.))))))))))  10
2       57      During  during  IN      case    58      O        (PP (IN During)        11
2       58      one     one     CD      nmod    18      NUMBER   (NP (CD one)))))       11
2       59      of      of      IN      case    61      O        (PP (IN of)    11
2       60      these   these   DT      det     61      O        (NP (NP (DT these)     11
2       61      concerts        concert NNS     nmod    12      O        (NNS concerts))        11
2       62      in      in      IN      case    64      O        (PP (IN in)    11
2       63      Mexico  Mexico  NNP     compound        64      LOCATION         (NP (NP (NNP Mexico)   11
2       64      City    City    NNP     nmod    61      LOCATION         (NNP City))    11
2       65      he      he      PRP     nsubj   66      O        (SBAR (S (NP (PRP he)) 12
2       66      received        receive VBD     acl:relcl       64      O        (VP (VBD received)     12
2       67      an      a       DT      det     68      O        (NP (DT an)    12
2       68      offer   offer   NN      dobj    66      O        (NN offer)     12
2       69      to      to      TO      mark    70      O        (S (VP (TO to) 13
2       70      take    take    VB      acl     68      O        (VP (VB take)  13
2       71      over    over    RP      compound:prt    70      O        (PRT (RP over))        13
2       72      the     the     DT      det     74      O        (NP (NP (DT the)       13
2       73      string  string  NN      compound        74      O        (NN string)    13
2       74      department      department      NN      dobj    70      O        (NN department))       13
2       75      of      of      IN      case    77      O        (PP (IN of)    13
2       76      the     the     DT      det     77      O        (NP (DT the)   13
2       77      university      university      NN      nmod    74      O        (NN university))))     13
2       78      there.  there.  IN      nmod    70      O        (PP (IN there.)))))))))))))))))))      13

3       1       In      in      IN      case    2       O        (ROOT (S (PP (IN In)   14
3       2       1946,   1946,   CD      nmod    4       NUMBER   (NP (CD 1946,)))       14
3       3       he      he      PRP     nsubj   4       O        (NP (PRP he))  14
3       4       became  become  VBD     root    0       O        (VP (VBD became)       14
3       5       a       a       DT      det     7       O        (NP (NP (DT a) 14
3       6       naturalized     naturalized     JJ      amod    7       O        (JJ naturalized)       14
3       7       citizen citizen NN      xcomp   4       O        (NN citizen))  14
3       8       of      of      IN      case    9       O        (PP (IN of)    14
3       9       Mexico. Mexico. NNP     nmod    7       O        (NP (NNP Mexico.)))))))        14

4       1       Szeryng Szeryng NNP     nsubj   3       PERSON   (ROOT (S (NP (NNP Szeryng))    15
4       2       subsequently    subsequently    RB      advmod  3       O        (VP (ADVP (RB subsequently))   15
4       3       focused focus   VBD     root    0       O        (VBD focused)  15
4       4       on      on      IN      case    5       O        (PP (IN on)    15
4       5       teaching        teaching        NN      nmod    3       O        (NP (NN teaching)))    15
4       6       before  before  IN      mark    19      O        (SBAR (IN before)      16
4       7       resuming        resume  VBG     csubj   19      O        (S (S (S (VP (VBG resuming)    16
4       8       his     he      PRP$    nmod:poss       10      O        (NP (PRP$ his) 16
4       9       concert concert NN      compound        10      O        (NN concert)   16
4       10      career  career  NN      dobj    7       O        (NN career))   16
4       11      in      in      IN      case    12      O        (PP (IN in)    16
4       12      1954.   1954.   CD      nmod    7       DATE     (NP (CD 1954.)))       16
4       13      His     he      PRP$    nmod:poss       14      O        (NP-TMP (NP (PRP$ His) 16
4       14      debut   debut   NN      nmod:tmod       7       O        (NN debut))    16
4       15      in      in      IN      case    18      O        (PP (IN in)    16
4       16      New     New     NNP     compound        18      LOCATION         (NP (NNP New)  16
4       17      York    York    NNP     compound        18      LOCATION         (NNP York)     16
4       18      City    City    NNP     nmod    14      LOCATION         (NNP City))))))        16
4       19      brought bring   VBD     advcl   3       O        (VP (VBD brought)      16
4       20      him     he      PRP     dep     22      O        (NP (PRP him)  16
4       21      great   great   JJ      amod    22      O        (JJ great)     16
4       22      acclaim,        acclaim,        NN      dobj    19      O        (NN acclaim,))))       16
4       23      and     and     CC      cc      19      O        (CC and)       17
4       24      he      he      PRP     nsubj   25      O        (S (NP (PRP he))       17                                                                                                                                          [109/1808]
4       25      toured  tour    VBD     conj    19      O        (VP (VBD toured)       17
4       26      widely  widely  RB      advmod  25      O        (ADVP (RB widely))     17
4       27      for     for     IN      case    29      O        (PP (IN for)   17
4       28      the     the     DT      det     29      O        (NP (NP (DT the)       17
4       29      rest    rest    NN      nmod    25      O        (NN rest))     17
4       30      of      of      IN      case    32      O        (PP (IN of)    17
4       31      his     he      PRP$    nmod:poss       32      O        (NP (NP (PRP$ his)     17
4       32      life.   life.   NN      nmod    29      O        (NN life.))    17
4       33      He      he      PRP     nsubj   34      O        (SBAR (S (NP (PRP He)) 18
4       34      died    die     VBD     acl:relcl       32      O        (VP (VBD died) 18
4       35      in      in      IN      case    36      O        (PP (IN in)    19
4       36      Kassel. Kassel. NNP     nmod    34      LOCATION         (NP (NNP Kassel.)))))))))))))))))      19

5       1       Szeryng Szeryng NNP     nsubj   2       PERSON   (ROOT (S (NP (NNP Szeryng))    20
5       2       made    make    VBD     root    0       O        (VP (VBD made) 20
5       3       a       a       DT      det     4       O        (NP (NP (DT a) 20
5       4       number  number  NN      dobj    2       O        (NN number))   20
5       5       of      of      IN      case    6       O        (PP (IN of)    20
5       6       recordings,     recordings,     NN      nmod    4       O        (NP (NP (NN recordings,))      20
5       7       including       include VBG     case    8       O        (PP (VBG including)    21
5       8       two     two     CD      nmod    6       NUMBER   (NP (NP (CD two))      21
5       9       of      of      IN      case    12      O        (PP (IN of)    21
5       10      the     the     DT      det     12      O        (NP (NP (DT the)       21
5       11      complete        complete        JJ      amod    12      O        (JJ complete)  21
5       12      sonatas sonata  NNS     nmod    8       O        (NNS sonatas)  21
5       13      and     and     CC      cc      12      O        (CC and)       21
5       14      partitas        partita NNS     conj    12      O        (NNS partitas))        21
5       15      for     for     IN      case    16      O        (PP (IN for)   22
5       16      violin  violin  NN      nmod    12      O        (NP (NN violin))))))))))       22
5       17      by      by      IN      case    20      O        (PP (IN by)    22
5       18      Johann  Johann  NNP     compound        20      PERSON   (NP (NP (NNP Johann)   22
5       19      Sebastian       Sebastian       NNP     compound        20      PERSON   (NNP Sebastian)        22
5       20      Bach,   Bach,   NNP     nmod    2       PERSON   (NNP Bach,))   22
5       21      and     and     CC      cc      20      O        (CC and)       22
5       22      several several JJ      conj    20      O        (NP (NP (JJ several))  22
5       23      of      of      IN      case    24      O        (PP (IN of)    22
5       24      sonatas sonata  NNS     nmod    22      O        (NP (NP (NNS sonatas)) 22
5       25      of      of      IN      case    26      O        (PP (IN of)    22
5       26      Beethoven       Beethoven       NNP     nmod    24      PERSON   (NP (NNP Beethoven)    22
5       27      and     and     CC      cc      26      O        (CC and)       22
5       28      Brahms  Brahms  NNP     conj    26      PERSON   (NNP Brahms))))))))    22
5       29      with    with    IN      case    33      O        (PP (IN with)  22
5       30      the     the     DT      det     33      O        (NP (NP (DT the)       22
5       31      pianist pianist NN      compound        33      O        (NN pianist)   22
5       32      Arthur  Arthur  NNP     compound        33      PERSON   (NNP Arthur)   22
5       33      Rubinstein.     Rubinstein.     NNP     nmod    2       O        (NNP Rubinstein.))     22
5       34      He      he      PRP     nsubj   36      O        (SBAR (S (NP (PRP He)) 22
5       35      also    also    RB      advmod  36      O        (ADVP (RB also))       22
5       36      composed;       composed;       VBD     acl:relcl       33      O        (VP (VBD composed;)    22
5       37      his     he      PRP$    nmod:poss       38      O        (SBAR (S (NP (PRP$ his)        22
5       38      works   work    NNS     nsubj   39      O        (NNS works))   22
5       39      include include VBP     ccomp   36      O        (VP (VBP include)      22
5       40      a       a       DT      det     41      O        (NP (NP (DT a) 22
5       41      number  number  NN      dobj    39      O        (NN number))   22
5       42      of      of      IN      case    44      O        (PP (IN of)    23
5       43      violin  violin  NN      compound        44      O        (NP (NN violin)        23
5       44      concertos       concerto        NNS     nmod    41      O        (NNS concertos)        23
5       45      and     and     CC      cc      44      O        (CC and)       23
5       46      pieces  piece   NNS     conj    44      O        (NNS pieces))) 23
5       47      of      of      IN      case    49      O        (PP (IN of)    23
5       48      chamber chamber NN      compound        49      O        (NP (NN chamber)       23
5       49      music.  music.  NN      nmod    41      O        (NN music.)))))))))))))))      23

6       1       He      he      PRP     nsubj   2       O        (ROOT (S (NP (PRP He)) 24
6       2       owned   own     VBD     root    0       O        (VP (VBD owned)        24                                                                                                                                           [44/1808]
6       3       the     the     DT      det     7       O        (NP (NP (NP (DT the)   24
6       4       Del     Del     NNP     compound        7       MISC     (NNP Del)      24
6       5       Gesu    Gesu    NNP     compound        7       MISC     (NNP Gesu)     24
6       6       "Le     "Le     NNP     compound        7       O        (NNP "Le)      24
6       7       Duc",   Duc",   NNP     dobj    2       O        (NNP Duc",))   24
6       8       the     the     DT      det     11      O        (NP (DT the)   24
6       9       Stradivarius    Stradivarius    NNP     compound        11      O        (NNP Stradivarius)     24
6       10      "King   "king   NN      compound        11      O        (NN "King)     24
6       11      David"  david"  NN      dep     7       O        (NN David")))  24
6       12      as      as      RB      cc      7       O        (CONJP (RB as) 24
6       13      well    well    RB      mwe     12      O        (RB well)      24
6       14      as      as      IN      mwe     12      O        (IN as))       24
6       15      the     the     DT      det     18      O        (NP (DT the)   24
6       16      Messiah Messiah NNP     compound        18      O        (NNP Messiah)  24
6       17      Strad   Strad   NNP     compound        18      O        (NNP Strad)    24
6       18      copy    copy    NN      conj    7       O        (NN copy)))    24
6       19      by      by      IN      case    21      O        (PP (IN by)    24
6       20      Jean-Baptiste   Jean-Baptiste   NNP     compound        21      PERSON   (NP (NP (NNP Jean-Baptiste)  24
6       21      Vuillaume       Vuillaume       NNP     nmod    2       PERSON   (NNP Vuillaume))       25
6       22      which   which   WDT     dobj    24      O        (SBAR (WHNP (WDT which))       25
6       23      he      he      PRP     nsubj   24      O        (S (NP (PRP he))       25
6       24      gave    give    VBD     acl:relcl       21      O        (VP (VBD gave) 25
6       25      to      to      TO      case    28      O        (PP (TO to)    25
6       26      Prince  Prince  NNP     compound        28      PERSON   (NP (NP (NNP Prince)   25
6       27      Rainier Rainier NNP     compound        28      PERSON   (NNP Rainier)  25
6       28      III     III     NNP     nmod    24      PERSON   (NNP III))     25
6       29      of      of      IN      case    30      O        (PP (IN of)    25
6       30      Monaco. Monaco. NNP     nmod    28      O        (NP (NNP Monaco.)))))  25
6       31      The     the     DT      det     33      O        (SBAR (S (NP (DT The)  25
6       32      "Le     "le     NN      compound        33      O        (NN "Le)       25
6       33      Duc"    duc"    NN      nsubj   36      O        (NN Duc"))     25
6       34      was     be      VBD     cop     36      O        (VP (VBD was)  25
6       35      the     the     DT      det     36      O        (NP (NP (DT the)       25
6       36      instrument      instrument      NN      ccomp   24      O        (NN instrument))       25
6       37      on      on      IN      case    38      O        (SBAR (WHPP (IN on)    26
6       38      which   which   WDT     nmod    40      O        (WHNP (WDT which)))    26
6       39      he      he      PRP     nsubj   40      O        (S (NP (PRP he))       26
6       40      performed       perform VBD     acl:relcl       36      O        (VP (VBD performed)    26
6       41      and     and     CC      cc      40      O        (CC and)       26
6       42      recorded        record  VBD     conj    40      O        (VBD recorded) 26
6       43      mostly, mostly, JJS     dobj    40      O        (NP (NP (JJS mostly,)) 26
6       44      while   while   IN      mark    51      O        (SBAR (IN while)       27
6       45      the     the     DT      det     49      O        (S (NP (DT the)        27
6       46      latter  latter  JJ      amod    49      O        (JJ latter)    27
6       47      ("King  ("king  NN      compound        49      O        (NN ("King)    27
6       48      David"  david"  NN      compound        49      O        (NN David")    27
6       49      Strad)  strad)  NN      nsubjpass       51      O        (NN Strad)))   27
6       50      was     be      VBD     auxpass 51      O        (VP (VBD was)  27
6       51      donated donate  VBN     dep     43      O        (VP (VBN donated)      27
6       52      to      to      TO      case    54      O        (PP (TO to)    27
6       53      the     the     DT      det     54      O        (NP (NP (DT the)       27
6       54      State   state   NN      nmod    51      O        (NN State))    27
6       55      of      of      IN      case    56      O        (PP (IN of)    27
6       56      Israel. Israel. NNP     nmod    54      O        (NP (NNP Israel.)))))))))))))))))))))))))      27

((1, 1), 'Nucleus', 'span')
((2, 2), 'Satellite', 'elaboration')
((1, 2), 'Nucleus', 'same_unit')
((3, 3), 'Nucleus', 'same_unit')
((1, 3), 'Nucleus', 'textualorganization')
((4, 4), 'Nucleus', 'span')
((5, 5), 'Nucleus', 'span')
((6, 6), 'Nucleus', 'span')
((7, 7), 'Satellite', 'elaboration')
((6, 7), 'Satellite', 'elaboration')
((5, 7), 'Nucleus', 'span')
((8, 8), 'Nucleus', 'span')
((9, 9), 'Nucleus', 'textualorganization')
((10, 10), 'Nucleus', 'span')
((11, 11), 'Nucleus', 'span')
((12, 12), 'Nucleus', 'span')
((13, 13), 'Satellite', 'purpose')
((12, 13), 'Satellite', 'elaboration')
((11, 13), 'Nucleus', 'same_unit')
((14, 14), 'Nucleus', 'textualorganization')
((15, 15), 'Nucleus', 'textualorganization')
((16, 16), 'Nucleus', 'list')
((17, 17), 'Nucleus', 'span')
((18, 18), 'Nucleus', 'textualorganization')
((19, 19), 'Nucleus', 'textualorganization')
((20, 20), 'Nucleus', 'span')
((21, 21), 'Nucleus', 'span')
((22, 22), 'Nucleus', 'span')
((23, 23), 'Satellite', 'elaboration')
((22, 23), 'Nucleus', 'span')
((24, 24), 'Nucleus', 'span')
((25, 25), 'Nucleus', 'span')
((26, 26), 'Satellite', 'elaboration')
((25, 26), 'Nucleus', 'span')
((27, 27), 'Satellite', 'temporal')
((25, 27), 'Satellite', 'elaboration')
((24, 27), 'Satellite', 'elaboration')
((22, 27), 'Satellite', 'elaboration')
((21, 27), 'Satellite', 'elaboration')
((20, 27), 'Nucleus', 'textualorganization')
((19, 27), 'Nucleus', 'textualorganization')
((18, 27), 'Satellite', 'elaboration')
((17, 27), 'Nucleus', 'list')
((16, 27), 'Nucleus', 'textualorganization')
((15, 27), 'Nucleus', 'textualorganization')
((14, 27), 'Nucleus', 'same_unit')
((11, 27), 'Satellite', 'elaboration')
((10, 27), 'Nucleus', 'textualorganization')
((9, 27), 'Satellite', 'elaboration')
((8, 27), 'Satellite', 'elaboration')
((5, 27), 'Satellite', 'circumstance')
((4, 27), 'Nucleus', 'textualorganization')
```

# Citation

Yangfeng Ji, Jacob Eisenstein (2014).
[Representation Learning for Text-level Discourse Parsing](http://www.anthology.aclweb.org/P/P14/P14-1002.pdf).
Proceedings of the 52nd Annual Meeting of the Association for Computational Linguistics, pages 13-24.
