From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 29 Nov 2018 15:17:10 +0000
Subject: Re: [PATCH 1/2] ataflop: fix error handling in atari_floppy_init()
Message-Id: <6c57a937-86c6-70c6-59fa-3e08b1f1de58@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129105519.mklhnmx34yjucb22@kili.mountain>
In-Reply-To: <20181129105519.mklhnmx34yjucb22@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Omar Sandoval <osandov@fb.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/29/18 3:55 AM, Dan Carpenter wrote:
> Smatch complains that there is an off by one if the allocation fails in:
> 
> 	DMABuffer = atari_stram_alloc(BUFFER_SIZE+512, "ataflop");
> 
> In that situation, "i" would be point to one element beyond the end of
> the unit[] array.
> 
> There is a second bug because the error handling calls
> blk_mq_free_tag_set(&unit[i].tag_set); regardless of whether
> "disk->queue" is NULL or non-NULL.  So if blk_mq_init_sq_queue() fails,
> then that means unit[i].tag_set->tags is NULL and it leads to an Oops.
> 
> It's easiest to call put_disk() before the goto to clean up the partial
> iteration.  Then the earlier unit[] elements are fully allocated so we
> can remove the checks whether "disk->queue" is NULL and the code is
> simpler.

Applied, thanks.

> I hope the Atari floppy disk users are appropriately grateful for all
> the love and effort we put into their software...

I'm sure that one person has you on the xmas shipping list.

-- 
Jens Axboe
