From: Johannes Weiner <hannes@cmpxchg.org>
Date: Thu, 30 Jul 2009 15:36:58 +0000
Subject: Re: [PATCH 3/5] mm: Add kmalloc NULL tests
Message-Id: <20090730153658.GA22986@cmpxchg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907301608350.8734@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907301608350.8734@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Julia,

On Thu, Jul 30, 2009 at 04:10:22PM +0200, Julia Lawall wrote:

> diff --git a/mm/slab.c b/mm/slab.c
> index 7b5d4de..972e427 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -1502,6 +1502,7 @@ void __init kmem_cache_init(void)
>  
>  		ptr = kmalloc(sizeof(struct arraycache_init), GFP_NOWAIT);
>  
> +		BUG_ON(!ptr);
>  		BUG_ON(cpu_cache_get(&cache_cache) != &initarray_cache.cache);
>  		memcpy(ptr, cpu_cache_get(&cache_cache),
>  		       sizeof(struct arraycache_init));

This does not change the end result when the allocation fails: you get
a stacktrace and a kernel panic.  Leaving it as is saves a line of
code.

> @@ -1514,6 +1515,7 @@ void __init kmem_cache_init(void)
>  
>  		ptr = kmalloc(sizeof(struct arraycache_init), GFP_NOWAIT);
>  
> +		BUG_ON(!ptr);
>  		BUG_ON(cpu_cache_get(malloc_sizes[INDEX_AC].cs_cachep)
>  		       != &initarray_generic.cache);
>  		memcpy(ptr, cpu_cache_get(malloc_sizes[INDEX_AC].cs_cachep),

	Hannes
