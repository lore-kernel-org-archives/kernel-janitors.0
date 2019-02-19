From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 19 Feb 2019 09:01:25 +0000
Subject: Re: [PATCH -next] floppy: remove set but not used variable 'q'
Message-Id: <nycvar.YFH.7.76.1902191001070.11598@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218084232.193878-1-yuehaibing@huawei.com>
In-Reply-To: <20190218084232.193878-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 18 Feb 2019, YueHaibing wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/block/floppy.c: In function 'request_done':
> drivers/block/floppy.c:2233:24: warning:
>  variable 'q' set but not used [-Wunused-but-set-variable]
> 
> It's never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Jiri Kosina <jkosina@suse.cz>

Jens, could you please take this through your tree?

Thanks.

-- 
Jiri Kosina
SUSE Labs
