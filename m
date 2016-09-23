From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Date: Fri, 23 Sep 2016 13:06:25 +0000
Subject: Re: GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <21112c34-13cd-af03-2672-58f46bb2fb96@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
 <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
 <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
 <f0172ebe-9036-0e11-42c8-1e1230b01e5c@vodafone.de>
 <f41a2f39-1d7d-9f40-92e5-66728ed126eb@users.sourceforge.net>
 <cdce8840-4c98-230a-f17b-308534f82947@vodafone.de>
 <160f8c46-3601-aca9-cccc-054531cf16a8@users.sourceforge.net>
In-Reply-To: <160f8c46-3601-aca9-cccc-054531cf16a8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>

Am 23.09.2016 um 13:49 schrieb SF Markus Elfring:
>> Calling the label "unlock" instead of "out" is arguable a little better,
> Thanks that you can follow a renaming for this direction in principle.
>
>
>> but nothing I would call a major improvement either.
> This was not my intention for such an use case.
>
> I am proposing some small software updates according to such a design pattern.
>
>
>> So that is a clear NAK to all those patches.
> Do you reject also update steps like the following then?
>
> * drm/ttm: Use kmalloc_array() in two (or four?) functions"
>
> * drm/ttm: Less function calls in ttm_dma_pool_init() after error detection

The reason behind the advise to use kmalloc_array() is to avoid overruns 
when one of the parameters come from an IOCTL and so are controllable by 
user space.

Those overruns where the source of numerous security problems, but in 
this case the parameters don't come from an IOCTL and aren't user space 
controllable.

So this change actually doesn't make to much sense either, but I'm 
leaning towards accepting them for coding style consistency.

Regards,
Christian.

> * Would you like to improve the usage of the variables "n" and "t"
>    in the function "ttm_dma_pool_init" any further as Joe Perches suggested it?
>
>
>>> 2. How do you think about to add a single space character before any label?
>> Bad as well. Why would anybody want to do this?
> Do you find another software evolution interesting according to a recent commit?
>
> "docs: Remove space-before-label guidance from CodingStyle"
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/Documentation/CodingStyle?idyc70c304b0b443429b2a0019518532c5162817a
>
>
> Regards,
> Markus


