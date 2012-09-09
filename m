From: Jens Axboe <axboe@kernel.dk>
Date: Sun, 09 Sep 2012 12:22:26 +0000
Subject: Re: [block:for-next 7/35] fs/bio.c:363 bio_alloc_bioset() error: we previously assumed 'bs' could be
Message-Id: <504C8A02.9070409@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120909121511.GA19841@localhost>
In-Reply-To: <20120909121511.GA19841@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012-09-09 14:15, Fengguang Wu wrote:
> Hi Kent,
> 
> FYI, there are new smatch warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
> head:   5611a9dbd54b993fe24f322a0c310a6605824c0f
> commit: 3f86a82aeb03e6100f7ab39f4702e033a5e38166 [7/35] block: Consolidate bio_alloc_bioset(), bio_kmalloc()

The logic in there does look both confusing and broken.

For !bs, we should not enter the bvec_alloc_bs() part. We already have
the vec, plus bvec_alloc_bs() would crap out for !bs. That would exclude
us from hitting err_free as well.

Style issue on nr_iovecs check, too.

-- 
Jens Axboe

