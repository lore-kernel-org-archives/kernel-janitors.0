From: Richard Weinberger <richard@nod.at>
Date: Sat, 03 Oct 2015 18:36:24 +0000
Subject: Re: [PATCH 23/39] UBI: drop null test before destroy functions
Message-Id: <56102028.70501@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
 <1442146532-9100-24-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-24-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

Am 13.09.2015 um 14:15 schrieb Julia Lawall:
> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/mtd/ubi/attach.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index 68eea5b..c1aaf03 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -1209,9 +1209,7 @@ static void destroy_ai(struct ubi_attach_info *ai)
>  		}
>  	}
>  
> -	if (ai->aeb_slab_cache)
> -		kmem_cache_destroy(ai->aeb_slab_cache);
> -
> +	kmem_cache_destroy(ai->aeb_slab_cache);
>  	kfree(ai);
>  }

Applied!

Thanks,
//richard
