From: Bart Van Assche <bvanassche@acm.org>
Date: Mon, 01 Jul 2019 19:47:56 +0000
Subject: Re: [PATCH] blk-mq: Use seq_puts() in __blk_mq_debugfs_rq_show()
Message-Id: <e2a06dfd-4a03-2f56-59e6-abce261653d6@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <81847ca5-fac5-710c-29d5-f70b58f6437d@web.de>
In-Reply-To: <81847ca5-fac5-710c-29d5-f70b58f6437d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 7/1/19 12:27 PM, Markus Elfring wrote:
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function “seq_puts”.

"should"? Why should this be done? Or in other words, what is wrong with 
the current code other than that it is slightly verbose and slightly 
slower than seq_puts()? Do you think this matters for debugfs code?

Thanks,

Bart.
