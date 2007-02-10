From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sat, 10 Feb 2007 19:12:48 +0000
Subject: Re: [KJ] is there a short form for "memset(blah, 0, len)"?
Message-Id: <45CE1930.3050500@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> On Sat, 10 Feb 2007, Bernd Petrovitsch wrote:
>
>   
>> On Sat, 2007-02-10 at 11:14 -0500, Robert P. J. Day wrote:
>>     
>>>   i doubt anything will ever come of this but, given the number of
>>> calls to "memset(addr, 0, len)", did anyone ever consider defining a
>>> macro short form, say:
>>>
>>>   clearmem(addr, len)
>>>   zeromem(addr, len)
>>>       
>> *BSD had "bzero()".
>>
>>     
>>> or something like that?  just curious.
>>>       
>> Did you ever read the man page of "bzero()"?
>>     
>
> sure, but that's a *userspace* routine.  AFAIK, there is no such
> routine in the linux kernel.  is there a reason there isn't?  wouldn't
> it be kind of useful?
>   
> grep -Enr "define +.*memset *\(.*0" *
arch/alpha/boot/misc.c:25:#define memzero(s,n)  memset ((s),0,(n))
arch/cris/arch-v10/boot/compressed/misc.c:38:#define memzero(s, n)     memset ((s), 0, (n))
arch/cris/arch-v32/boot/compressed/misc.c:40:#define memzero(s, n)     memset ((s), 0, (n))
arch/i386/boot/compressed/misc.c:110:#define memzero(s, n)     memset ((s), 0, (n))
arch/m32r/boot/compressed/misc.c:26:#define memzero(s, n)     memset ((s), 0, (n))
arch/sh/boot/compressed/misc.c:30:#define memzero(s, n)     memset ((s), 0, (n))
arch/sh64/boot/compressed/misc.c:28:#define memzero(s, n)     memset ((s), 0, (n))
...

So it seems memzero() is a candidate, don't you think?

Richard Knutsson


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
