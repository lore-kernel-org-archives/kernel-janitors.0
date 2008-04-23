From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 14:02:37 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F417D.3060603@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Roel Kluin wrote:
> Julia Lawall wrote:
>> On Wed, 23 Apr 2008, Roel Kluin wrote:

There was an error in my script so here's an updated version.

---
int="[0-9]"
hEx="[A-Fa-f0-9]"
an_="[A-Za-z0-9_]"
D="$int*\.\?$int\+x\?$hEx*[uUlL]\{0,3\}[fF]\?"
V="$an_\+$an_*"
w="\($V\|${V}\[$s$an_*${s}\]\|$V\.\|$V->\)\+"
s="[[:space:]]*";
S="[[:space:]]\+"
cendl="$s\(\/[\*\/].*\)\?$"
Q="[^[:alnum:]_]"

# define what to search for
left_operator="\([;,|^?:(]\|[\!+*/%&|~^-]=\|>>=\|<<=\|\[\|&&\|$an_$s&\)"
right_operator="\([;,&|^?:)]\|[\!+*/%&|~^<>-]=\|>>=\|<<=\|>[^>]\|<[^<]\|\]\)"
variable="$s\(\(++\|--\)$w\|$w\(++\|--\)\|$w\)$s"
comparison="\(\(>=\|<\)${s}0\|\([><\!=]=\|[<>]\)$s-$s$D\)$s"
query="$left_operator$variable$comparison$right_operator"

arr="\(\[[^\]]*\]$s\)*"
attr="__attribute__$s(([^;]*))"
# for each unsigned typedefs
for ut in "unsigned" "unsigned long" $(
git-grep "^${s}typedef${S}unsigned$S\($V$S\)*\($V$s$arr\|$attr$S$V$s$arr\|$V$s$arr$S$attr\)$s;$cendl" | 
sed -n "s/^[^.]*\.[hc]:${s}typedef${S}unsigned$S\($V$S\)*\(\($V\)$s$arr\|$attr$S\($V\)$s$arr\|\($V\)$s$arr$S$attr\)$s;$cendl/\3\5\7/p" |
sort | uniq); do

# create the spatch
  cat > ../spatches/negative_unsigned.cocci << EOF
@@
constant C;
$ut i;
@@
(
* i < 0
|
* i >= 0
|
* i = -C
|
* i < -C
|
* i >= -C
)
EOF

  # find
  for f in $(git-grep -l "\(^\|$Q\)$ut\($Q\|$\)" | grep "[^.]*\.[ch]" | xargs grep -l "$query"); do
    spatch -quiet -sp_file ../spatches/negative_unsigned $f;
  done
done > ../spatch.log

# to display the results nicely
sed -n "s/^\(.\)\(-- \([^[:space:]]*\)$s\|@ -\([0-9]*\),\|\).*$/\1 \3\4/p" ../spatch.log|
while read a b; do
  if [ "$a" = "-" ]; then
    if [ -f "$b" ]; then
      f="$b"
    elif [ -z "$b" ]; then
      echo "vi $f +$i";
      i=$(($i+1));
    fi
  elif [ "$a" = "@" ]; then
    i=$b;
  else
    i=$(($i+1));
  fi
done | sort
