From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 28 Feb 2019 21:06:17 +0000
Subject: Re: [PATCH -next] floppy: remove set but not used variable 'q'
Message-Id: <4a230eac-bea4-c771-5126-03f711f3e8a6@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218084232.193878-1-yuehaibing@huawei.com>
In-Reply-To: <20190218084232.193878-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Jiri Kosina <jikos@kernel.org>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2/18/19 1:42 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/block/floppy.c: In function 'request_done':
> drivers/block/floppy.c:2233:24: warning:
>  variable 'q' set but not used [-Wunused-but-set-variable]
> 
> It's never used and can be removed.

Applied, thanks.

-- 
Jens Axboe
