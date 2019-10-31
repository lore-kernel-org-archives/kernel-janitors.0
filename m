From: Tejun Heo <tj@kernel.org>
Date: Thu, 31 Oct 2019 16:50:19 +0000
Subject: Re: [PATCH] iocost: don't nest spin_lock_irq in ioc_weight_write()
Message-Id: <20191031165019.GL3622521@devbig004.ftw2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031105341.GA26612@mwanda>
In-Reply-To: <20191031105341.GA26612@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 31, 2019 at 01:53:41PM +0300, Dan Carpenter wrote:
> This code causes a static analysis warning:
> 
>     block/blk-iocost.c:2113 ioc_weight_write() error: double lock 'irq'
> 
> We disable IRQs in blkg_conf_prep() and re-enable them in
> blkg_conf_finish().  IRQ disable/enable should not be nested because
> that means the IRQs will be enabled at the first unlock instead of the
> second one.
> 
> Fixes: 7caa47151ab2 ("blkcg: implement blk-iocost")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
