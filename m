From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 28 Jan 2019 09:16:19 +0000
Subject: Re: [PATCH] floppy: check_events callback should not return a negative number
Message-Id: <a1de9b80-4fdf-4996-7362-e77a1386b0d9@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190128090646.44747-1-yuyufen@huawei.com>
In-Reply-To: <20190128090646.44747-1-yuyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yufen Yu <yuyufen@huawei.com>, axboe@kernel.dk, osandov@fb.com
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2019/1/28 17:06, Yufen Yu wrote:
> Since .check_events interface return an unsigned int value,
> floppy_check_events() should not return a negative error number.
> Otherwise, disk_check_events() may process wiht an unexpected path.

A typo, wiht --> with

> 
> fixes: a0c80efe5956 ("floppy: fix lock_fdc() signal handling")

fixes should be Fixes

> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
>  drivers/block/floppy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
> index 6f2856c6d0f2..55481b40df9a 100644
> --- a/drivers/block/floppy.c
> +++ b/drivers/block/floppy.c
> @@ -4075,7 +4075,7 @@ static unsigned int floppy_check_events(struct gendisk *disk,
>  
>  	if (time_after(jiffies, UDRS->last_checked + UDP->checkfreq)) {
>  		if (lock_fdc(drive))
> -			return -EINTR;
> +			return 0;
>  		poll_drive(false, 0);
>  		process_fd_request();
>  	}
> 
