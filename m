From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 21 Jan 2007 12:29:53 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <45B35CC1.8040702@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> On Sun, 21 Jan 2007, Richard Knutsson wrote:
>
>   
>> Robert P. J. Day wrote:
>>     
>
>   
>>> ah, quite right, i missed that.  but that, of course, just raises
>>> another question -- why have two different sets of tokens
>>> representing boolean values?  should programmers use the upper or
>>> lower case form? and why did the person who wrote BusLogic.c do it
>>> differently from everyone else?  so many pedantic, anal-retentive
>>> questions.
>>>
>>>       
>> Simple, some people defines 'FALSE'/'TRUE' and some 'false'/'true' ;)
>>     
>
> actually, while lots of files define 'FALSE' and 'TRUE', very few
> files define values for the tokens 'false' and 'true' since, as alexey
> pointed out, those are defined in include/linux/stddef.h:
>
> enum {
>         false   = 0,
>         true    = 1
> };
>
>   
No file should define 'false' and 'true' since I removed them to make it 
build with the above. Please point me to those if you find any.
>> Then, to be able to compile, the
>> "6e21828743247270d09a86756a0c11702500dbfb" (git show) redefined
>> BusLogic.h's
>>
>> -typedef enum { false, true } __attribute__ ((packed)) boolean;
>>
>> to
>>
>> +typedef bool boolean;
>>     
>
> but that second typedef doesn't define any values for the tokens
> 'true' and 'false', so that still has to be done by *someone*.
>   
That was a quick-fix to get rid of the defining of 'false'/'true'. So 
now a find 'n' replace of 'boolean' should be painless (can submit a 
patch later today...)
>>> but back to the question at hand -- is there any fundamental
>>> problem with trying to define a standard by defining TRUE and
>>> FALSE macros in types.h?  certainly, that would also require some
>>> simultaneous fixes to the source tree, where those new macros
>>> would clash with existing code, like in
>>> drivers/net/wireless/strip.c, where one would have to remove the
>>> conflicting:
>>>
>>>   enum { FALSE = 0, TRUE = 1 };
>>>
>>> but i'm guessing things like that would be rare.
>>>
>>>       
>> Please, try to convert it to 'false'/'true' instead. It is meant to
>> be the generic boolean-values, same as bool being the type.
>>
>> Believe it is approved since I saw a patch, adding a function using bool and
>> 'false'/'true', signed-off-by Torvalds and Morton (not sure it was a third
>> name).
>>     
>
> i just read that thread, and it consisted of lots of smart people
> arguing over how many angels could fit on the head of a pin, then
> finally losing interesting and wandering away, having accomplished
> absolutely nothing.
>   
Guess you referring to Andrew Morton's "[patch 1/1] consolidate TRUE and 
FALSE".
> i just submitted the following patch to LKML:
>
> ===========================
> diff --git a/drivers/net/wireless/strip.c
> b/drivers/net/wireless/strip.c
> index ce3a8ba..5e64ec1 100644
> --- a/drivers/net/wireless/strip.c
> +++ b/drivers/net/wireless/strip.c
> @@ -177,8 +177,6 @@ typedef struct {
>         MetricomNode node[NODE_TABLE_SIZE];
>  } MetricomNodeTable;
>
> -enum { FALSE = 0, TRUE = 1 };
> -
>  /*
>   * Holds the radio's firmware version.
>   */
>   
Have you done a "allyes"-build? Surprised there is not more to do...
> diff --git a/include/linux/types.h b/include/linux/types.h
> index 0351bf2..d988636 100644
> --- a/include/linux/types.h
> +++ b/include/linux/types.h
> @@ -34,6 +34,8 @@ typedef __kernel_mqd_t                mqd_t;
>
>  #ifdef __KERNEL__
>  typedef _Bool                  bool;
> +#define TRUE                   1
> +#define FALSE                  0
>   
First of, I believe this should be in stddef.h (as 'false'/'true'/NULL).
Second, why add a second definition of false and true? I have yet to 
hear someone wanting upper-cast instead of lower (0/1 yes, but not 
upper-cast).
Actually some would like it to be 'null' instead of NULL :)
>  typedef __kernel_uid32_t       uid_t;
>  typedef __kernel_gid32_t       gid_t;
> ===============================
>
>   note that it adds definitions for TRUE and FALSE to types.h (and
> removes a single conflicting construct), so that all of those
> ridiculous macro definitions can be removed from the numerous source
> files.  note also that it doesn't take a position on what tokens to
> use in the future, it just allows for *removal* of lots of unnecessary
> crap.  so applying that patch doesn't require finalizing a decision on
> what should be done in the future, although i'm sure that's the
> argument i'm going to hear.  wait for it -- you know it's coming.
>   
Just, what is the rush to remove that "crap"? It's been there for quite 
some time and will be taken care of when converted to a generic boolean.

Richard Knutsson
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
