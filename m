From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Tue, 17 Feb 2004 09:55:25 +0000
Subject: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check kmem_cache
Message-Id: <20040217095525.GD29263@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Tue, Feb 17, 2004 at 10:32:20AM +0100, Walter Harms escreveu:
> hi list,
> this patch is the same as before and fixes the
> problem acme found.
> must_free is only set if kmem_cache_create is realy used
> and only then freed.
> 
> background:
> fib_hash_init() can be called many times. if fn_hash_kmem
> is already set and kmalloc fails the wrong fn_hash_kmem is freed. I think this can only happen if
> CONFIG_IP_MULTIPLE_TABLES is set.
> 
> regards,
> walter
> 
> 
> --- linux-2.6.1/net/ipv4/fib_hash.c.org 2004-02-17 09:19:21.000000000 +0100
> +++ linux-2.6.1/net/ipv4/fib_hash.c     2004-02-17 10:20:08.000000000 +0100
> @@ -870,16 +870,23 @@
>  #endif
>  {
>         struct fib_table *tb;
> -
> -       if (fn_hash_kmem = NULL)
> +       int must_free=0;
> +       if (fn_hash_kmem = NULL) {
>                 fn_hash_kmem = kmem_cache_create("ip_fib_hash",
>                                                  sizeof(struct fib_node),
>                                                  0, SLAB_HWCACHE_ALIGN,
>                                                  NULL, NULL);
> +               if (!fn_hash_kmem)
> +               return NULL;
> +               must_free=1;

Funny code 8) Please let me know when must_free=1; will ever be reached...

In this case we can say "!Never Say Never" 8)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
