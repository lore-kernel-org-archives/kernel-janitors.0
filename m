From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 09 Feb 2020 21:09:50 +0000
Subject: Re: [PATCH] staging: exfat: Replace printk with pr_info
Message-Id: <20200209210950.GA54745@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200209204810.9899-1-jieun.kim4758@gmail.com>
In-Reply-To: <20200209204810.9899-1-jieun.kim4758@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JieunKim <jieun.kim4758@gmail.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, valdis.kletnieks@vt.edu, linux-kernel@vger.kernel.org

On Mon, Feb 10, 2020 at 05:48:10AM +0900, JieunKim wrote:
> pr_info is preferred to use than printk.
> pr_info calls printk with KERN_INFO macros by itself.
> ---
>  drivers/staging/exfat/exfat_super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
> index b81d2a87b82e..3806036c0ef6 100644
> --- a/drivers/staging/exfat/exfat_super.c
> +++ b/drivers/staging/exfat/exfat_super.c
> @@ -364,7 +364,7 @@ static int ffsMountVol(struct super_block *sb)
>  	exfat_bdev_open(sb);
>  
>  	if (p_bd->sector_size < sb->s_blocksize) {
> -		printk(KERN_INFO "EXFAT: mount failed - sector size %d less than blocksize %ld\n",
> +		pr_info("EXFAT: mount failed - sector size %d less than blocksize %ld\n",
>  		       p_bd->sector_size,  sb->s_blocksize);
>  		ret = -EINVAL;
>  		goto out;
> -- 
> 2.17.1

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
