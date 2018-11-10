From: Jens Axboe <axboe@kernel.dk>
Date: Sat, 10 Nov 2018 03:08:24 +0000
Subject: Re: [PATCH -next] block: remove set but not used variable 'et'
Message-Id: <daa59ba1-5786-d181-bd4f-17aefd639ed9@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541817674-19370-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541817674-19370-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/9/18 7:41 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> block/blk-ioc.c: In function 'put_io_context_active':
> block/blk-ioc.c:174:24: warning:
>  variable 'et' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after commit
> a1ce35fa4985 ("block: remove dead elevator code")

Thanks, applied.

-- 
Jens Axboe
