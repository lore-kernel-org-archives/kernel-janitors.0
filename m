From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jul 2019 20:00:21 +0000
Subject: Re: blk-mq: Use seq_puts() in __blk_mq_debugfs_rq_show()
Message-Id: <5a8b6e93-72fb-1900-3338-662db7b8975d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <81847ca5-fac5-710c-29d5-f70b58f6437d@web.de>
 <e2a06dfd-4a03-2f56-59e6-abce261653d6@acm.org>
In-Reply-To: <e2a06dfd-4a03-2f56-59e6-abce261653d6@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bart Van Assche <bvanassche@acm.org>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> A string which did not contain a data format specification should be put
>> into a sequence. Thus use the corresponding function “seq_puts”.
>
> Why should this be done?

Do you prefer an other wording for the desired data output?


> Or in other words, what is wrong with the current code
> other than that it is slightly verbose and slightly slower than seq_puts()?

I suggest to improve such implementation details also at this place.

Regards,
Markus
