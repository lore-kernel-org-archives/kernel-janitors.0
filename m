From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 14 Sep 2018 01:59:48 +0000
Subject: Re: [PATCH -next] blk-iolatency: remove set but not used variables 'changed' and 'blkiolat'
Message-Id: <5b7bf9ea-335d-ba84-c469-cbe921ef8bc0@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536888911-54172-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536888911-54172-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/13/18 7:35 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> block/blk-iolatency.c: In function 'scale_change':
> block/blk-iolatency.c:301:7: warning:
>  variable 'changed' set but not used [-Wunused-but-set-variable]
> 
> block/blk-iolatency.c: In function 'iolatency_set_limit':
> block/blk-iolatency.c:765:24: warning:
>  variable 'blkiolat' set but not used [-Wunused-but-set-variable]

Applied, thanks.

-- 
Jens Axboe
