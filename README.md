# printable-ascii

Output all the printable ASCII characters in various representations and formats.

# Install

Get `bin/printable-ascii` into your `$PATH` however you like.

If you'd like to use Homebrew while addition to Homebrew is pending you can install from this local formula.

```
brew install --formula ./Formula/printable-ascii.rb
```

# Docker

There's a [printable-ascii docker repo](https://hub.docker.com/r/sdball/printable-ascii) up on docker hub.

To run printable-ascii via Docker:

```
$ docker run sdball/printable-ascii

$ docker run sdball/printable-ascii --json --decimal
```

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

## Help text

Help is accessible with `-h` or `--help`

## Representations

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

Fun fact, you can add as many duplicate representations as you want!

```
$ printable-ascii -ooddxx --start-at 65 --end-at 71
CHARACTER   OCTAL   OCTAL   DECIMAL   DECIMAL   HEXADECIMAL   HEXADECIMAL
A           101     101     65        65        41            41
B           102     102     66        66        42            42
C           103     103     67        67        43            43
D           104     104     68        68        44            44
E           105     105     69        69        45            45
F           106     106     70        70        46            46
G           107     107     71        71        47            47
```

## Header

In default usage the header row shows up when you add additional representations.

You can force the header to appear with `--header`

```
$ printable-ascii --header | head
CHARACTER

!
"
#
$
%
&
'
(
```

You can force the header to be omitted with `--no-header`.

```
$ printable-ascii --no-header -dxo | head
            32        20            40
!           33        21            41
"           34        22            42
#           35        23            43
$           36        24            44
%           37        25            45
&           38        26            46
'           39        27            47
(           40        28            50
)           41        29            51
```

The header declarations have no effect on the JSON output.

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

## Start and End

You can start/end the output at any ASCII integer within the printable range in base10 (32-126) or at any single ASCII character.

```
$ printable-ascii --start-at 65 --end-at 75
A
B
C
D
E
F
G
H
I
J
K
```

```
$ printable-ascii --start-at A --end-at K
A
B
C
D
E
F
G
H
I
J
K
```

To reliably use punctuation characters as start/end you must quote them due to shell behavior.

```
$ printable-ascii --start-at '"' --end-at "(" --decimal
CHARACTER   DECIMAL
"           34
#           35
$           36
%           37
&           38
'           39
(           40
```

```
$ printable-ascii --start-at " " --end-at "(" --decimal
CHARACTER   DECIMAL
            32
!           33
"           34
#           35
$           36
%           37
&           38
'           39
(           40
```

If you choose an end that's less than the start then you get no output.

```
$ printable-ascii --start-at 40 --end-at 35
```

## Random

The `--random NUMBER` option will output `NUMBER` of random printable ASCII characters.

If you combine this option with `--start-at` / `--end-at` then the random printable ASCII characters will be pulled from that range.

```
$ printable-ascii --random 8 --start-at 65 --end-at 90
P
Y
O
R
E
B
J
I
```

```
$ printable-ascii --random 1 --start-at 65 --end-at 66
A
```

```
$ printable-ascii --random 1 --start-at 65 --end-at 66
B
```

```
$ printable-ascii --start-at A --end-at F --json --random 10 | jq -c '.[]'
{"character":"F"}
{"character":"B"}
{"character":"B"}
{"character":"B"}
{"character":"E"}
{"character":"F"}
{"character":"E"}
{"character":"E"}
{"character":"A"}
{"character":"D"}
```

## Range

The `--range` command line option allows specifying a range of printable ASCII as "start-end"

```
$ printable-ascii --range A-F
A
B
C
D
E
F
```

The start/end of the range can be in base10 or ASCII characters or a mix.

```
$ printable-ascii --range A-70
A
B
C
D
E
F
```

Punctuation characters can be supplied for a range but must be quoted to ensure proper interpretation by both the script and your command line shell.

```
$ printable-ascii --range "#-("
#
$
%
&
'
(
```

The `--range` option supersedes the `--start-at` and `--end-at` options, although the start-at and end-at options are still valid.

```
$ printable-ascii --range A-E --start-at C
A
B
C
D
E
```

Multiple ranges can be provided

```
$ printable-ascii --range A-E --range v-z
A
B
C
D
E
v
w
x
y
z
```

Ranges can overlap and any overlapped characters will be listed twice

```
$ printable-ascii --range A-C --range A-F
A
B
C
A
B
C
D
E
F
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

