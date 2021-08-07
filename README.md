# printable-ascii

Output all the printable ASCII characters in various representations and formats.

# Install

A good way to install is pending. For now get `bin/printable-ascii` into your `$PATH` however you like.

# Usage

Running `printable-ascii` by itself will simply print all the printable ASCII characters in plaintext to your console.

```
$ printable-ascii | head

!
"
#
$
%
&
'
(
)
```

You can add additional representations of the characters with `-dbxo` as described in `--help`.

```
$ printable-ascii --decimal --hex --binary | head
CHARACTER   DECIMAL   HEXADECIMAL   BINARY
            32        20            100000
!           33        21            100001
"           34        22            100010
#           35        23            100011
$           36        24            100100
%           37        25            100101
&           38        26            100110
'           39        27            100111
(           40        28            101000
```

## JSON

JSON output is available with `--json`

```
$ printable-ascii --decimal --hex --binary --json | jq -c '.[]' | head
{"character":" ","decimal":"32","hexadecimal":"20","binary":"100000"}
{"character":"!","decimal":"33","hexadecimal":"21","binary":"100001"}
{"character":"\"","decimal":"34","hexadecimal":"22","binary":"100010"}
{"character":"#","decimal":"35","hexadecimal":"23","binary":"100011"}
{"character":"$","decimal":"36","hexadecimal":"24","binary":"100100"}
{"character":"%","decimal":"37","hexadecimal":"25","binary":"100101"}
{"character":"&","decimal":"38","hexadecimal":"26","binary":"100110"}
{"character":"'","decimal":"39","hexadecimal":"27","binary":"100111"}
{"character":"(","decimal":"40","hexadecimal":"28","binary":"101000"}
{"character":")","decimal":"41","hexadecimal":"29","binary":"101001"}
```

## Help text

```
Usage: ./bin/printable-ascii [options]
    -d, --decimal                    Output decimal representation
    -b, --binary                     Output binary representation
    -x, --hexadecimal                Output hexadecimal representation
    -o, --octal                      Output octal representation
        --header                     Include the header in output
        --no-header                  Omit the header from output
        --json                       JSON output
    -h, --help                       Show this message
        --version                    Show version
```

# Full Output why not?

```
$ printable-ascii --binary --octal --decimal --hexadecimal
CHARACTER   BINARY   OCTAL   DECIMAL   HEXADECIMAL
            100000   40      32        20
!           100001   41      33        21
"           100010   42      34        22
#           100011   43      35        23
$           100100   44      36        24
%           100101   45      37        25
&           100110   46      38        26
'           100111   47      39        27
(           101000   50      40        28
)           101001   51      41        29
*           101010   52      42        2a
+           101011   53      43        2b
,           101100   54      44        2c
-           101101   55      45        2d
.           101110   56      46        2e
/           101111   57      47        2f
0           110000   60      48        30
1           110001   61      49        31
2           110010   62      50        32
3           110011   63      51        33
4           110100   64      52        34
5           110101   65      53        35
6           110110   66      54        36
7           110111   67      55        37
8           111000   70      56        38
9           111001   71      57        39
:           111010   72      58        3a
;           111011   73      59        3b
<           111100   74      60        3c
=           111101   75      61        3d
>           111110   76      62        3e
?           111111   77      63        3f
@           1000000  100     64        40
A           1000001  101     65        41
B           1000010  102     66        42
C           1000011  103     67        43
D           1000100  104     68        44
E           1000101  105     69        45
F           1000110  106     70        46
G           1000111  107     71        47
H           1001000  110     72        48
I           1001001  111     73        49
J           1001010  112     74        4a
K           1001011  113     75        4b
L           1001100  114     76        4c
M           1001101  115     77        4d
N           1001110  116     78        4e
O           1001111  117     79        4f
P           1010000  120     80        50
Q           1010001  121     81        51
R           1010010  122     82        52
S           1010011  123     83        53
T           1010100  124     84        54
U           1010101  125     85        55
V           1010110  126     86        56
W           1010111  127     87        57
X           1011000  130     88        58
Y           1011001  131     89        59
Z           1011010  132     90        5a
[           1011011  133     91        5b
\           1011100  134     92        5c
]           1011101  135     93        5d
^           1011110  136     94        5e
_           1011111  137     95        5f
`           1100000  140     96        60
a           1100001  141     97        61
b           1100010  142     98        62
c           1100011  143     99        63
d           1100100  144     100       64
e           1100101  145     101       65
f           1100110  146     102       66
g           1100111  147     103       67
h           1101000  150     104       68
i           1101001  151     105       69
j           1101010  152     106       6a
k           1101011  153     107       6b
l           1101100  154     108       6c
m           1101101  155     109       6d
n           1101110  156     110       6e
o           1101111  157     111       6f
p           1110000  160     112       70
q           1110001  161     113       71
r           1110010  162     114       72
s           1110011  163     115       73
t           1110100  164     116       74
u           1110101  165     117       75
v           1110110  166     118       76
w           1110111  167     119       77
x           1111000  170     120       78
y           1111001  171     121       79
z           1111010  172     122       7a
{           1111011  173     123       7b
|           1111100  174     124       7c
}           1111101  175     125       7d
~           1111110  176     126       7e
```

