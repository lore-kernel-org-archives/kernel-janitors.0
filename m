From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Feb 2015 18:58:25 +0000
Subject: Re: [PATCH] [RFC] drivers/staging/fbtft: fix sparse warnings
Message-Id: <20150221185824.GE5206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424468049-24525-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1424468049-24525-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-mentors@vger.kernel.org, kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, noralf@tronnes.org

On Fri, Feb 20, 2015 at 11:34:09PM +0200, Andrey Utkin wrote:
> See below how sparse output changed with these changes.
> In few words:
> - fixed printf specifiers for size_t;
> - trying to fix address space specifiers issues, not sure what's correct approach, ASKING FOR COMMENTS AND HELP;

Send two separate patches.  You can't "fix" sparse warnings.  You can
only "fix" bugs.  The rest is add annotation, doing cleanups or possibly
silencing warnings.

> - didn't touch "was not declared. Should it be static?" yet.
> 
> -drivers/staging/fbtft/fbtft-core.c: In function ‘fbtft_register_framebuffer’:

[ millions of lines of warnings snipped.  ]

>  drivers/staging/fbtft/fbtft_device.c:32:19: warning: symbol 'spi_device' was not declared. Should it be static?
>  drivers/staging/fbtft/fbtft_device.c:33:24: warning: symbol 'p_device' was not declared. Should it be static?

This changelog is a bit rubbish because it's just copy and pasted
warnings for things that didn't change.

> 
> This is for Eudyptulla challenge. If you want me to help with any other staging driver, I am open.

Don't put this in the changelog.

> diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
> index 9cc7d25..9114239 100644
> --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
> +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
> @@ -273,7 +273,7 @@ construct_line_bitmap(struct fbtft_par *par, u8 *dest, signed short *src,
>  
>  static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
>  {
> -	u16 *vmem16 = (u16 *)par->info->screen_base;
> +	u16 __iomem *vmem16 = (u16 __iomem *)par->info->screen_base;

I haven't looked.  What is the type for ->screen_base and why can't it
be declared as __iomem type?

>  	u8 *buf = par->txbuf.buf;
>  	int x, y;
>  	int ret = 0;
> @@ -287,7 +287,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
>  	/* converting to grayscale16 */
>  	for (x = 0; x < par->info->var.xres; ++x)
>  		for (y = 0; y < par->info->var.yres; ++y) {
> -			u16 pixel = vmem16[y *  par->info->var.xres + x];
> +			u16 pixel = ioread16(vmem16 + y *  par->info->var.xres + x);

You're saying this is a bug in the original code.  Are you positive?
The changelog should have explained your thinking here.  Same for all
the iomem changes.

regards,
dan carpenter

