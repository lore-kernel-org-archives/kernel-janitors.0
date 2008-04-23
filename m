From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 09:26:48 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F00D8.1070707@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> Thanks for the interesting comparison.
> 
>> Spatch did find some that my script didn't, and mine had a few false
>> positives.
>> However, your spatch script did not catch some that my script covered. Below
>> are the results of my script (after a few modifications) and below that yours
>> for comparison. for instance not caught were:
>> * unsigned (or any unsigned typedef) i;
> 
> Actually, if I had written just "unsigned", it would have picked up on 
> "unsigned" or "unsigned int".  Spatch has something called an isomorphism, 
> which replaces certain terms by a set of equivelant ones.  But someone has 
> to describe what the equivalent ones should be, and for unsigned it was 
> described as "unsigned => unsigned int", probably because I thought going 
> the other way around might be unsafe.  Anyway, this problem is corrected 
> in the semantic match for finding functions that return negative values 
> but have unsigned as a return type.

If the function returns a negative int, but it is stored in an unsigned and
subsequently tested, We have a problem as well.
A test could either mean that the author was very pedantic, or that he/she
forgot about the signedness.

> With respect to typedefs, we do take them into account, but we only expand 
> a (probably useful) subset of the include files to save time.  Also 
> without processing the makefile, it is not always possible to know which 
> include file an include refers to.  Of course we could run the 
> preprocessor on the source code, but since our main goal is 
> transformation, we would like to stay as close as possible to the 
> structure of the source program.  Of course this is less of an issue for 
> this kind of searching, but we haven't explored this option.
> 
> I haven't had a chance to look through all of your examples yet.  Were 
> there any cases where you found a local typedef? I also wrote a rule for 
> some of the standard things like u32, etc, but they didn't turn up much, 
> and not much that looked significant.

Yes there were some, for instance in the -mm patch:
ext4-mballoc-fix-hot-spins-after-err_freebuddy-and-err_freemeta.patch

>> and besides your evaluated the tests:
>>
>> * i < [any negative value]
>> * i >= [0 or any negative value]
>> * i = [any negative value]
>> * i != [any negative value]
>> * [0 or any negative value] <= i
>> * [0 or any negative value] > i
> 
> We do 0 > i via the isomoprhisms.  But I have never seen such code.

not really a problem, but in arch/mips/mm/sc-mips.c:84, with tmp unsigned:
if (0 <= tmp && tmp <= 7)
	c->scache.sets = 64 << tmp;
else
	return 0;

> As you mention, we could consider more kinds of comparison to 0 by writing 
> more patterns, eg;
> 
> (
>  i < 0
> |
>  i <= 0
> |
>  i = -C
> |
>  i < -C
> |
>  i <= -C
> )
> 
> where C was previously declared to be any constant.
> 
>> You could create a spatch script for all cases, but I think it'd be better to
>> write a script to create spatch scripts dependent on matches in source.
> 
> I'm not sure what you mean here.  Many of those cases are probably quite 
> uncommon.  It would probably take more work to find an instance of
> i <= [any negative number] than it would to just write the extra case in 
> the pattern language.  But perhaps I am misinterpreting your suggestion.

I meant something like the bash script below. it isn't working, however. I
suspect I did something wrong in the spatch patch or invocation.

# define what to search for
left_operator="\([;,|^?:(]\|[\!+*/%&|~^-]=\|>>=\|<<=\|\[\|&&\|$an_$s&\)\(++\|--\)\?"
right_operator="\([;,&|^?:)]\|[\!+*/%&|~^<>-]=\|>>=\|<<=\|>[^>]\|<[^<]\|\]\)\(++\|--\)\?"
variable="$s\(\(++\|--\)$w\|$w\(++\|--\)\|$w\)$s"
comparison="\(\(>=\|<\)${s}0\|\([><\!=]=\|[<>]\)$s-$s$D\)$s"
query="$left_operator$variable$comparison$right_operator"

arr="\(\[[^\]]*\]$s\)*"
attr="__attribute__$s(([^;]*))"
# for each unsigned typedefs
for ut in "unsigned" "unsigned long" $(
git-grep -l "^${s}typedef${S}unsigned$S\($V$S\)*\($V$s$arr\|$attr$S$V$s$arr\|$V$s$arr$S$attr\)$s;$cendl" | 
sed -n "s/^${s}typedef${S}unsigned$S\($V$S\)*\(\($V\)$s$arr\|$attr$S\($V\)$s$arr\|\($V\)$s$arr$S$attr\)$s;$cendl/ \3\5\7/p" |
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
  for f in $(git-grep -l "$ut" | grep "[^.]*\.[ch]" | xargs grep -l "$ut"); do
    spatch -sp_file ../spatches/negative_unsigned $f;
  done
done

Any suggestions?

> I have a PhD student who is working on inferring semantic patches from a 
> few manually done changes, but then he has some diff files to start with.  
> It seems more difficult to infer searches from source code, because it is 
> not clear what to focus on.
> 
>> I may
>> write this when I have time, Is there some reference on spatch syntax? And is
>> spatch open source? if so, how can I obtain its source code?
> 
> Currently only the binary is available.
> http://www.emn.fr/x-info/coccinelle/

I think this community would more easily embrace it if it was open source.

> julia

thanks,

Roel
