From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 25 Jul 2020 06:37:01 +0000
Subject: Re: [PATCH -next] mtd: fix missing unlock on error in mtdchar_compat_ioctl()
Message-Id: <20200725063701.GA1058480@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200725063416.172037-1-weiyongjun1@huawei.com>
In-Reply-To: <20200725063416.172037-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>

On Sat, Jul 25, 2020 at 06:34:16AM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function mtdchar_compat_ioctl()
> in the error handling case.
> 
> Fixes: 210bec567936 ("mtd: properly check all write ioctls for permissions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/mtdchar.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 52c120f9fb0d..b40f46a43fc6 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -1064,8 +1064,10 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
>  		struct mtd_oob_buf32 buf;
>  		struct mtd_oob_buf32 __user *buf_user = argp;
>  
> -		if (!(file->f_mode & FMODE_WRITE))
> -			return -EPERM;
> +		if (!(file->f_mode & FMODE_WRITE)) {
> +			ret = -EPERM;
> +			break;
> +		}
>  
>  		if (copy_from_user(&buf, argp, sizeof(buf)))
>  			ret = -EFAULT;
> 
> 
> 

I think Richard already resolved this in his tree, but I could be wrong.

And nice detection by your bot, that's good to see.

thanks,

greg k-h
