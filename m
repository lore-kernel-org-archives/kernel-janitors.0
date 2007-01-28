From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 28 Jan 2007 17:41:41 +0000
Subject: Re: [KJ] clear_page() and copy_page()
Message-Id: <45BCE055.7000508@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701280332020.29915@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701280332020.29915@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> On Sun, 28 Jan 2007, Richard Knutsson wrote:
>
>   
>> Robert P. J. Day wrote:
>>     
>>>   there are numerous instances of calls to memset() of the form
>>>
>>>   memset(<addr>, 0, PAGE_SIZE);
>>>
>>> to clear a single page, as you can see sprinkled throughout the output
>>> here (obviously, not every line of output represents one of those
>>> cases, the grep pattern is overly general):
>>>
>>>       
>> [snip]
>>     
>>> same questions here -- any issues with standardizing on calls to
>>> copy_page()?
>>>   rday
>>>
>>> p.s.  obviously, rewriting to use those simpler macros would imply
>>> that *every* architecture would need to define those macros, and i
>>> don't think that's the case at the moment.
>>>
>>>       
>> include]$ grep -L clear_page asm-*/page.h
>> asm-generic/page.h
>> asm-powerpc/page.h
>> include]$ grep -L copy_page asm-*/page.h
>> asm-generic/page.h
>> asm-powerpc/page.h
>>
>> so it seems it only needs to be defined on PowerPC. But what confuses me is:
>> ...
>> asm-x86_64/page.h:48:void clear_page(void *);
>> asm-x86_64/page.h:51:#define clear_user_page(page, vaddr, pg)
>> clear_page(page)
>> ...
>>
>> Is x86_64 setting all its memory to zero before giving it to the caller, or
>> what?
>>     
>
> i can check with the appropriate people.  i guess the major issue is
> whether the semantics of clear_page() are *meant* to be identical to a
> single page-sized call to memset().  technically, of course, they
>   
The only reason against it, would be if it is meant the address has to 
be a multiple of the PAGE_SIZE, but I find that unlikely.
> don't *have* to be -- clear_page() could always be defined to do
> something extra, but it doesn't seem like that's happening here, so a
> simple substitution would appear to be a valid cleanup, yes?
>   
I would think so. Just a bit concerned that PowerPC does not have it 
defined. I would rather see it defined in asm-generic and then if the 
arch has a better solution, it just undef the generic one. But that is 
just my opinion :)

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
