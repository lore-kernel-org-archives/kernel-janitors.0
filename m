From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 10:26:29 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F0ED5.5060800@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> On Wed, 23 Apr 2008, Roel Kluin wrote:
> 
>> Forgot to add these on top of my script,
>>
>> int="[0-9]"
>> hEx="[A-Fa-f0-9]"
>> an_="[A-Za-z0-9_]"
>> D="$int*\.\?$int\+x\?$hEx*[uUlL]\{0,3\}[fF]\?"
>> V="$an_\+$an_*"
>> w="\($V\|${V}\[$s$an_*${s}\]\|$V\.\|$V->\)\+"
>> s="[[:space:]]*";
>> S="[[:space:]]\+"
>> cendl="$s\(\/[\*\/].*\)\?$"
> 
> With this I get an error from sed.
> 
> julia

Not due to this, but I had an error in my script. here's the updated
script below. it's working now, I'll post the results shortly.

Thanks, and especially for the -quiet flag,

Roel

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
sed -n "s/^[^.]*\.[hc]:${s}typedef${S}unsigned$S\($V$S\)*\(\($V\)$s$arr\|$attr$S\($V\)$s$arr\|\($V\)$s$arr$S$attr\)$s;$cendl/\3\5\7/p" | sort | uniq); do

# create the spatch
  cat > ../spatches/negative_unsigned.cocci << EOF
@@
constant C;
$ut i;
@@
(
* i < 0
|
* i <= 0
|
* i = -C
|
* i < -C
|
* i <= -C
)
EOF

  # find
  for f in $(git-grep -l "$ut" | grep "[^.]*\.[ch]" | xargs grep -l "$query"); do
    spatch -quiet -sp_file ../spatches/negative_unsigned $f;
  done
done > ../spatch.log
