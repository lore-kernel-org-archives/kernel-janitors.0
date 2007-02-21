From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 21 Feb 2007 15:32:13 +0000
Subject: Re: [KJ] [PATCH] is_power_of_2 in kernel/kfifo
Message-Id: <45DC65FD.4030109@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1172063918.6127.83.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1172063918.6127.83.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vignesh Babu BM wrote:
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2
>
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
> --- 
> diff --git a/kernel/kfifo.c b/kernel/kfifo.c
> index 5d1d907..eeb5e7e 100644
> --- a/kernel/kfifo.c
> +++ b/kernel/kfifo.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/kfifo.h>
> +#include <linux/log2.h>
>  
>  /**
>   * kfifo_init - allocates a new FIFO using a preallocated buffer
> @@ -41,7 +42,7 @@ struct kfifo *kfifo_init(unsigned char *buffer, unsigned int size,
>  	struct kfifo *fifo;
>  
>  	/* size must be a power of 2 */
> -	BUG_ON(size & (size - 1));
> +	BUG_ON(!is_power_of_2(size));
>  
>  	fifo = kmalloc(sizeof(struct kfifo), gfp_mask);
>  	if (!fifo)
>   
Could you also remove the comment? (since it is now obvious by the code)

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
