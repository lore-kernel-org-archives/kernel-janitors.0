From: Douglas Gilbert <dgilbert@interlog.com>
Date: Sun, 20 Sep 2020 19:35:18 +0000
Subject: Re: [PATCH] lib/scatterlist: Fix memory leak in sgl_alloc_order()
Message-Id: <1608a0b7-6960-afce-aa39-6785036b01e0@interlog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e69e9865-a599-5bd9-95b1-7d57c7e2e90c@web.de>
In-Reply-To: <e69e9865-a599-5bd9-95b1-7d57c7e2e90c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, Jens Axboe <axboe@kernel.dk>

On 2020-09-20 1:09 p.m., Markus Elfring wrote:
>> Noticed that when sgl_alloc_order() failed with order > 0 that
>> free memory on my machine shrank. That function shouldn't call
>> sgl_free() on its error path since that is only correct when
>> order=0 .
> 
> * Would an imperative wording become helpful for the change description?

No passive tense there. Or do you mean usage like: "Go to hell" or
"Fix memory leak in ..."? I studied French and Latin at school; at a
guess, my mother tongue got its grammar from the former. My mother
taught English grammar and the term "imperative wording" rings no
bells in my grammatical education. Google agrees with me.
Please define: "imperative wording".
> * How do you think about to add the tag “Fixes” to the commit message?r

In the workflow I'm used to, others (closer to LT) make that decision.
Why waste my time?

> * Will an other patch subject be more appropriate?

Twas testing a 6 GB allocation with said function on my 8 GB laptop.
It failed and free told me 5 GB had disappeared (and
'cat /sys/kernel/debug/kmemleak' told me _nothing_). Umm, it is
potentially a HUGE f@#$ing memory LEAK! Best to call a spade a spade.

Doug Gilbert
