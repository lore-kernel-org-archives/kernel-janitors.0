From: Domen Puncer <domen@coderock.org>
Date: Mon, 31 Jul 2006 05:38:16 +0000
Subject: Re: [KJ] [PATCH] drivers/block/acsi.c: Add KERN_* to printk
Message-Id: <20060731053816.GE4969@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060731002238.GA10973@chello.nl>
In-Reply-To: <20060731002238.GA10973@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 31/07/06 02:22 +0200, Richard wrote:
...
>  #ifdef DEBUG
> -		printk("ACSI: skipping 0xff status byte\n" );
> +		printk( KERN_DEBUG "ACSI: skipping 0xff status byte\n" );
>  #endif

This looks like a perfect example of where pr_debug can be used.

>  #ifdef DEBUG_DETECT
> -		printk("target %d lun %d: timeout\n", aip->target, aip->lun);
> +		printk( KERN_DEBUG "target %d lun %d: timeout\n", aip->target, aip->lun);
>  #endif

Unfortunately this one doesn't fit so much with pr_debug :-(


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
