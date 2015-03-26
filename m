From: Richard Weinberger <richard@nod.at>
Date: Thu, 26 Mar 2015 09:29:35 +0000
Subject: Re: [PATCH 4/5] UBI: fix check for "too many bytes"
Message-Id: <5513D17F.2080309@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
 <1425119009-28634-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-5-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

Am 28.02.2015 um 11:23 schrieb Brian Norris:
> The comparison from the previous line seems to have been erroneously
> (partially) copied-and-pasted onto the next. The second line should be
> checking req.bytes, not req.lnum.
> 
> Coverity CID #139400
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/ubi/cdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index d647e504f9b1..7691a2a015cb 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -455,7 +455,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
>  		/* Validate the request */
>  		err = -EINVAL;
>  		if (req.lnum < 0 || req.lnum >= vol->reserved_pebs ||
> -		    req.bytes < 0 || req.lnum >= vol->usable_leb_size)
> +		    req.bytes < 0 || req.bytes >= vol->usable_leb_size)
>  			break;

Testing uncovered an issue with that.
The comparison should be "req.bytes > vol->usable_leb_size" as
we're allowed to write with usable_leb_size.
There is no need to re-send, I'll fix the patch myself.

Thanks,
//richard
