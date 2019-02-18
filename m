From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 18 Feb 2019 08:19:30 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <ab463e94-287a-6188-6795-06eeb832e861@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902181122502228026@zte.com.cn>
 <alpine.DEB.2.21.1902180740550.3111@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902180740550.3111@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Wen Yang <wen.yang99@zte.com.cn>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

>>> Which data element should not get reassigned here (before a corresponding
>>> null pointer check)?
>>>
>>
>> Thank you for your comments.
>> We did some experiments:
>> +id = of_find_device_by_node@p1(x)
>> +... when != e = id
>> ...
>> Or:
>> ...
>> + ... when != id = e
>>
>> The number of issuses found by these two methods is the same.

This can be because these SmPL specifications share some source code search functionality.


>> When != e = id achieves this behavior.
>
> They are the same because neither issue arises.

You might not notice a difference from a specific source file selection so far.


> I would have a hard time saying which one is more reasonable to test,

I suggest to reconsider the interpretation of this software situation once more.


> since both are extremely unlikely.

I disagree to this view because two ellipses were intentionally specified
in published SmPL scripts.
So some software developers found these “special use cases” important enough.


>> In addition, we feel that we should probably accept this patch first,

I disagree to this imagination because I would prefer to integrate a source code variant
without a bug (which was copied from a version on 2013-05-08 by Petr Strnad).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/free/pci_free_consistent.cocci?id=f7b167113753e95ae61383e234f8d10142782ace#n12

I hope that nicer run time behaviour can become also relevant here.


>> use it to find more memory leaks, and solve the actual problems in the kernel code.

Your are not hindered to achieve specific software improvements with evolving
development approaches while the clarification and the final integration
of useful scripts for the semantic patch language can take a bit longer.


>> As for the patch itself, we can continue to pursue perfect in the process
>> of using it to solve practical problems.

I am curious on how your attention will evolve further for the corresponding
software correctness.

1. How much will you care for the order of identifiers within the application
   of SmPL assignment exclusions?

2. Would you like to take additional data type restrictions into account?

Regards,
Markus
