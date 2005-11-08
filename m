From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 08 Nov 2005 10:50:13 +0000
Subject: Re: [KJ] [PATCH 6/8] Cleanup slabinfo_write()
Message-Id: <20051108105013.GA7678@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2242956507652778=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF7F7.1060907@us.ibm.com>
In-Reply-To: <436FF7F7.1060907@us.ibm.com>
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: kernel-janitors@lists.osdl.org, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

--===============2242956507652778==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2005 at 04:57:27PM -0800, Matthew Dobson wrote:
> * Set 'res' at declaration instead of later in the function.

I hate to initialize a varible two miles away from the place where it's
used.

> --- linux-2.6.14+slab_cleanup.orig/mm/slab.c
> +++ linux-2.6.14+slab_cleanup/mm/slab.c
> @@ -3533,7 +3533,7 @@ ssize_t slabinfo_write(struct file *file
>  		       size_t count, loff_t *ppos)
>  {

> -	int limit, batchcount, shared, res;
> +	int limit, batchcount, shared, res = -EINVAL;

>  	/* Find the cache in the chain of caches. */
>  	down(&cache_chain_sem);
> -	res = -EINVAL;
>  	list_for_each(p,&cache_chain) {
>  		kmem_cache_t *cachep = list_entry(p, kmem_cache_t, next);
> +		if (strcmp(cachep->name, kbuf))
> +			continue;
>
> -		if (!strcmp(cachep->name, kbuf)) {
> -			if (limit < 1 || batchcount < 1 ||
> -			    batchcount > limit || shared < 0) {
> -				res = 0;
> -			} else {
> -				res = do_tune_cpucache(cachep, limit,
> -							batchcount, shared);
> -			}
> -			break;
> -		}
> +		res = do_tune_cpucache(cachep, limit, batchcount, shared);
> +		if (res >= 0)
> +			res = count;
> +		break;
>  	}
>  	up(&cache_chain_sem);
> -	if (res >= 0)
> -		res = count;
>  	return res;
>  }


--===============2242956507652778==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2242956507652778==--
