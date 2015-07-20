From: Jens Axboe <axboe@fb.com>
Date: Mon, 20 Jul 2015 14:58:42 +0000
Subject: Re: block: make /sys/block/<dev>/queue/discard_max_bytes writeable
Message-Id: <55AD0CA2.30400@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/20/2015 08:59 AM, Dan Carpenter wrote:
> Hello Jens Axboe,
>
> The patch d45a0f150e9d: "block: make
> /sys/block/<dev>/queue/discard_max_bytes writeable" from Jul 16,
> 2015, leads to the following static checker warning:
>
> 	block/blk-sysfs.c:152 queue_discard_max_hw_show()
> 	warn: should 'q->limits.max_hw_discard_sectors << 9' be a 64 bit type?
>
> block/blk-sysfs.c
>     148  static ssize_t queue_discard_max_hw_show(struct request_queue *q, char *page)
>     149  {
>     150          unsigned long long val;
>     151
>     152          val = q->limits.max_hw_discard_sectors << 9;
>                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> It definitely looks like this can wrap.

Yeah it can, that should be cast to unsigned long long for the shift. 
I'll make that change.

-- 
Jens Axboe

