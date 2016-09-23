From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Date: Fri, 23 Sep 2016 11:17:05 +0000
Subject: Re: GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <cdce8840-4c98-230a-f17b-308534f82947@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
 <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
 <05418fb1-ad66-aba3-bd8c-f6b684a83279@users.sourceforge.net>
 <f0172ebe-9036-0e11-42c8-1e1230b01e5c@vodafone.de>
 <f41a2f39-1d7d-9f40-92e5-66728ed126eb@users.sourceforge.net>
In-Reply-To: <f41a2f39-1d7d-9f40-92e5-66728ed126eb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Am 23.09.2016 um 13:07 schrieb SF Markus Elfring:
>> It's just the names like "out" or "restart" perfectly explain why the labels exists.
> I have got an other impression.
>
>
>> So they fulfill this requirement from the coding style as far as I can see.
> Short identifiers might look more convenient in some cases because
> they are quicker to type.
>
>
>> So why do you want to change them?
> 1. I suggest to select identifiers also for jump labels which are more meaningful
>     and eventually unique for some function implementations.

I completely disagree. A longer identifier is not necessarily more 
meaningful than a shorter one.

The difference between calling a label "retry" and "lock_retry" is 
negligible, doesn't improve readability as far as I can see and is 
actually incorrect because the main meaning of the label is that we 
don't take the lock but rather that we restart the allocation operation.

Calling the label "unlock" instead of "out" is arguable a little better, 
but nothing I would call a major improvement either.

So that is a clear NAK to all those patches.

> 2. How do you think about to add a single space character before any label?

Bad as well. Why would anybody want to do this?

Christian.

>
> Regards,
> Markus


