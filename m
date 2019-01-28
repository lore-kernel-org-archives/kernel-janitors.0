From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Jan 2019 13:19:42 +0000
Subject: Re: [PATCH] floppy: check_events callback should not return a negative number
Message-Id: <20190128131942.GH1795@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190128090646.44747-1-yuyufen@huawei.com>
In-Reply-To: <20190128090646.44747-1-yuyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yufen Yu <yuyufen@huawei.com>
Cc: axboe@kernel.dk, osandov@fb.com, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 28, 2019 at 05:06:46PM +0800, Yufen Yu wrote:
> Since .check_events interface return an unsigned int value,
> floppy_check_events() should not return a negative error number.
> Otherwise, disk_check_events() may process wiht an unexpected path.
> 
> fixes: a0c80efe5956 ("floppy: fix lock_fdc() signal handling")
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

The patch is correct, but I wish the commit message had said what the
run time impact of the patch is.  Or sometimes it's hard to say what the
run time impact is, but it could have at least said why returning zero
is correct.  Say something like:

  floppy_check_events() is supposed to return bit flags to say which
  events occured.  We should return zero to say that no event flags are
  set.  Only BIT(0) and BIT(1) are used in the caller.  This code
  returns -4u  here so both BIT(0) and BIT(1) are clear.  So this patch
  shouldn't affect runtime, but it obviously is still worth fixing.

regards,
dan carpenter
