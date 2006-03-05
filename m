From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 05 Mar 2006 17:58:12 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in  lib/
Message-Id: <20060305175812.GA21701@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33850095713300354=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141548097.6426.9.camel@alice>
In-Reply-To: <1141548097.6426.9.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============33850095713300354==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 05, 2006 at 09:41:37AM +0100, Eric Sesterhenn wrote:
> this patch converts lib/ to kzalloc usage.
> Compile tested with allyesconfig.

> --- linux-2.6.16-rc5-mm1/lib/genalloc.c.orig
> +++ linux-2.6.16-rc5-mm1/lib/genalloc.c
> @@ -47,20 +47,17 @@ struct gen_pool *gen_pool_create(int nr_
>  	if (!max_chunk_shift)
>  		max_chunk_shift = PAGE_SHIFT;
>
> -	poolp = kmalloc(sizeof(struct gen_pool), GFP_KERNEL);
> +	poolp = kzalloc(sizeof(struct gen_pool), GFP_KERNEL);
>  	if (!poolp)
>  		return NULL;
> -	memset(poolp, 0, sizeof(struct gen_pool));
> -	poolp->h = kmalloc(sizeof(struct gen_pool_link) *
> -			   (max_chunk_shift - ALLOC_MIN_SHIFT + 1),
> -			   GFP_KERNEL);
> +	poolp->h = kcalloc((max_chunk_shift - ALLOC_MIN_SHIFT + ),

This will screw ia64.

> +				sizeof(struct gen_pool_link),
> +				GFP_KERNEL);
>  	if (!poolp->h) {
>  		printk(KERN_WARNING "gen_pool_alloc() failed to allocate\n");
>  		kfree(poolp);
>  		return NULL;
>  	}
> -	memset(poolp->h, 0, sizeof(struct gen_pool_link) *
> -	       (max_chunk_shift - ALLOC_MIN_SHIFT + 1));


--===============33850095713300354==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33850095713300354==--
