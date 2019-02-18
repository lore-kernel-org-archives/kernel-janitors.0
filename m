From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 18 Feb 2019 21:40:32 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <730810ab-5bea-4a8d-54b9-37e1fe2d1498@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902181122502228026@zte.com.cn>
In-Reply-To: <201902181122502228026@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

>> Which data element should not get reassigned here (before a corresponding
>> null pointer check)?
>>
>
> Thank you for your comments.
> We did some experiments:
> +id = of_find_device_by_node@p1(x)
> +... when != e = id
> ...
> Or:
> ...
> + ... when != id = e
>
> The number of issuses found by these two methods is the same.

Would you like to clarify the circumstances a bit more under which
you would notice corresponding differences?


> When != e = id achieves this behavior.

I try another explanation approach for a potentially safer source code search.


1. If you would look at the following SmPL code lines again,
   I imagine that you can determine also an useful constraint for this place.

…
+ id = of_find_device_by_node@p1(x)
+ ... when != ?????? = ??????
+ if (!id || ...) { ... return ...; }
…


2. Petr Strnad expressed the need for another constraint in the commit
   “scripts: Coccinelle script for pci_free_consistent()” (from 2013-05-08).
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/free/pci_free_consistent.cocci?id=f7b167113753e95ae61383e234f8d10142782ace#n12

   I find that there are additional software development challenges
   to consider around another desirable assignment exclusion from the place
   of the return value storage and the data processing possibilities
   behind the corresponding null pointer check.
   The previous approach worked with the metavariables types (or kinds)
   “expression” and “local idexpression id” to some degree so far.
   But it is expected that an undesirable missed reference release
   can be safely pointed out only if the received platform device pointer
   is used only within a found function implementation.

   I would interpret this data flow requirement in the way
   that the pointer should not be forwarded to a data structure
   with a scope from outside (global?) the found function implementation.
   How would you like to express such an aspect by the current (or future)
   means of the semantic patch language?

Regards,
Markus
