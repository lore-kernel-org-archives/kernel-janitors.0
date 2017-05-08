From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 08 May 2017 14:09:57 +0000
Subject: Re: [PATCH] blk-mq: make __blk_mq_stop_hw_queues static
Message-Id: <11c54006-03bf-4532-970f-2d5fecf734a6@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170508104440.10945-1-colin.king@canonical.com>
In-Reply-To: <20170508104440.10945-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/08/2017 04:44 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Making __blk_mq_stop_hw_queues static fixes sparse warning:
> 
>   block/blk-mq.c:6: warning: symbol '__blk_mq_stop_hw_queues' was not
>   declared. Should it be static?

Thanks, added.

-- 
Jens Axboe

