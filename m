From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 24 Jan 2005 16:11:19 +0000
Subject: Re: [KJ] [PATCH] unified spinlock initialization
Message-Id: <41F51E27.7020007@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Christophe Lucas wrote:
> In: drivers/misc/ibmasm/module.c
> 
> Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
> 
> 
> ------------------------------------------------------------------------
> 
> diff -urbNB linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c linux-2.6.10/drivers/misc/ibmasm/module.c
> --- linux-2.6.10-vanilla/drivers/misc/ibmasm/module.c	2005-01-24 17:08:09.000000000 +0100
> +++ linux-2.6.10/drivers/misc/ibmasm/module.c	2005-01-24 17:18:31.000000000 +0100
> @@ -107,7 +107,7 @@
>  		goto error_remote_queue;
>  	}
>  
> -	sp->lock = SPIN_LOCK_UNLOCKED;
> +	spin_lock_init( &sp->lock );

Please lose those spaces... that's not kernel coding style.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
