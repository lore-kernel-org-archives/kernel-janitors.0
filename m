From: yuyufen <yuyufen@huawei.com>
Date: Tue, 12 Feb 2019 10:50:59 +0000
Subject: Re: [PATCH v2] floppy: check_events callback should not return a negative number
Message-Id: <15d715cf-0a6a-158e-a264-96baa890697c@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129083404.47318-1-yuyufen@huawei.com>
In-Reply-To: <20190129083404.47318-1-yuyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@kernel.dk, dan.carpenter@oracle.com
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

ping?


On 2019/1/29 16:34, Yufen Yu wrote:
> floppy_check_events() is supposed to return bit flags to say which
> events occured. We should return zero to say that no event flags are
> set.  Only BIT(0) and BIT(1) are used in the caller. And .check_events
> interface also expect to return an unsigned int value.
>
> However, after commit a0c80efe5956, it may return -EINTR (-4u).
> Here, both BIT(0) and BIT(1) are cleared. So this patch shouldn't
> affect runtime, but it obviously is still worth fixing.
>
> Fixes: a0c80efe5956 ("floppy: fix lock_fdc() signal handling")
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
>   drivers/block/floppy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
> index 6f2856c6d0f2..55481b40df9a 100644
> --- a/drivers/block/floppy.c
> +++ b/drivers/block/floppy.c
> @@ -4075,7 +4075,7 @@ static unsigned int floppy_check_events(struct gendisk *disk,
>   
>   	if (time_after(jiffies, UDRS->last_checked + UDP->checkfreq)) {
>   		if (lock_fdc(drive))
> -			return -EINTR;
> +			return 0;
>   		poll_drive(false, 0);
>   		process_fd_request();
>   	}
