From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Wed, 15 Aug 2007 10:10:25 +0000
Subject: Re: [kj] is_power_of_2 in drivers/s390/block/dasd_int.h
Message-Id: <20070815101025.GB16551@osiris.boeblingen.de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187009639.7273.6.camel@merlin.linuxcoe.com>
In-Reply-To: <1187009639.7273.6.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 13, 2007 at 06:23:59PM +0530, vignesh babu wrote:
> Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)
> 
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
> ---
> diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
> index aeda526..d427dae 100644
> --- a/drivers/s390/block/dasd_int.h
> +++ b/drivers/s390/block/dasd_int.h
> @@ -53,6 +53,7 @@
>  #include <linux/genhd.h>
>  #include <linux/hdreg.h>
>  #include <linux/interrupt.h>
> +#include <linux/log2.h>
>  #include <asm/ccwdev.h>
>  #include <linux/workqueue.h>
>  #include <asm/debug.h>
> @@ -456,7 +457,7 @@ dasd_free_chunk(struct list_head *chunk_list, void *mem)
>  static inline int
>  dasd_check_blocksize(int bsize)
>  {
> -	if (bsize < 512 || bsize > 4096 || (bsize & (bsize - 1)) != 0)
> +	if (bsize < 512 || bsize > 4096 || !is_power_of_2(bsize))
>  		return -EMEDIUMTYPE;
>  	return 0;
>  }

Added to our patch queue. Thanks.
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
