From: "Horvath, Elmer" <Elmer.Horvath@windriver.com>
Date: Thu, 02 Nov 2006 21:23:09 +0000
Subject: Re: [KJ] [tipc-discussion] [patch]
Message-Id: <F6AE8F99CFBB884E9681D609D859BAD324D8CB@ala-mail02.corp.ad.wrs.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <F6AE8F99CFBB884E9681D609D859BAD324D63D@ala-mail02.corp.ad.wrs.com>
In-Reply-To: <F6AE8F99CFBB884E9681D609D859BAD324D63D@ala-mail02.corp.ad.wrs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi, 

Good observations.  My comments in <Elmer> </Elmer> way down below.

What is 'kernel-janitors@lists.osdl.org' ?

Elmer


-----Original Message-----
From: walter harms [mailto:wharms@bfs.de] 
Sent: Thursday, November 02, 2006 12:30 PM
To: Horvath, Elmer
Cc: kernel-janitors@lists.osdl.org
Subject: Re: [tipc-discussion] [KJ] [patch] net/tipc:sprintf/strcpy
conversion

Horvath, Elmer wrote:
> Hi,
> 
> Florian Westphal wrote:
>>> walter harms <wharms@bfs.de> wrote:
>>>> These line
>>>> +       strcpy(bcbearer->media.name, "tipc-multicast");
>>>> i gues that means tipc_bclink_name ?
>>> The idea was to change how things are done, not _what_ is being
done.
>>>
>>>> an even more secure version could be like this:
>>>>
>>>>
>
strncpy(bcbearer->media.name,sizeof(bcbearer->media.name),tipc_bclink_na
> me);
>>> Ugh, please, no. The size of src is known in all cases; there is
>>> absoluty no point in using str(n|l)cpy here.
>>>
>>>> (in case someone ever changes the size of cbearer->media.name or
> tipc_bclink_name and the >hope
>>>> that wchat_t will never reach the kernel)
>>>>
>>> In this case 'someone' should be really hurt, don't you think?
>>>
>> hi florian,
>> i am on the side of error, the code increase is marginal and the
speed
> penalty also, so why not ?
>> you make sure that an overflow may never happen, and the rest in name
> gets zeroed.
>> The problem is that when the error occurs it may be later than the
> actual changeset.
>> NTL it is an hint, and if you feel ok with it and the maintainer has
no
> objects i have no >problems either.
> 
>> re,
>> wh
> 
> This objection I would have here is that you have would have to use
> strlcpy or you must explicitly set the last byte to '\0'.  strncpy()
> will not guarnatee a null-terminated string.  Also, str(n|l)cpy always
> writes 'n' bytes whereas strcpy() will only write as many bytes as
> required stopping at the null.  This is inefficient.
> 
> It would be better to ensure that the sting being copied is correctly
> sized when first accepted if this is possible.  I didn't trace the
> usage, but it has likely already been checked for size.  No?
> 
> Elmer
> 
> 

hi Elmar,
i will use the definition of tipc_bclink_name. as you see there is no
limit to its length.
const char tipc_bclink_name[] = "multicast-link";

now in the future when this string is moved around into various files at
sometime someone changes this to:
const char tipc_bclink_name[] = "multicast-link and a superfluid
comment";
and breaking the max length unintentionally. this will be noticed only
when it breaks something that is used.
This is nothing new, a common mistake by careless programming.

The only thing i say: please use str(l)ncpy because it make sure nothing
is written beyond the end, (and it
clean the rest of the string fixing possible information leaks).

<Elmer> If you want to be 'secure', as you say, then strlcpy() is a
better choice than strncpy() to guarantee that you will have a
null-terminated string in the destination address (as far as I
understand the subtle differences).  strncpy() will result in a non-null
terminated octet-string if the source string is too long.  Any future
string operations may cause problems that are harder to trace.

Is strlcpy() available on all implementations?  I once compiled code on
an architecture that did not support it and had to use strncpy() with an
explicit assignment bloating code:
    dest_string[last_octet] = '\0';
</Elmer>

Florians point is valid also (Florian may complain if i am wrong)
he say basicly: this is kernel code, written and changed by people how
know what they are doing.
and i say:
do not let any error happen (iff the penalties for speed/size are minor
like here).

the last word is on the maintainer. I think the patch is ok but i have
learned it is better to be
on the "secure" side.

we should not continue here since i have the feeling that it leads to
nothing new. changing to strncpy()
is trivial the maintainer can easy do it.

re,
 wh



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
