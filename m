From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 31 Oct 2019 17:38:58 +0000
Subject: Re: [PATCH] iocost: don't nest spin_lock_irq in ioc_weight_write()
Message-Id: <5507a74c-35e6-177c-d9b1-91ebc3120ea2@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031105341.GA26612@mwanda>
In-Reply-To: <20191031105341.GA26612@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Tejun Heo <tj@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/31/19 4:53 AM, Dan Carpenter wrote:
> This code causes a static analysis warning:
> 
>      block/blk-iocost.c:2113 ioc_weight_write() error: double lock 'irq'
> 
> We disable IRQs in blkg_conf_prep() and re-enable them in
> blkg_conf_finish().  IRQ disable/enable should not be nested because
> that means the IRQs will be enabled at the first unlock instead of the
> second one.

Applied for 5.3, thanks.

-- 
Jens Axboe
