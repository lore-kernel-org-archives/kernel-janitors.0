From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Fri, 18 Mar 2016 16:34:14 +0000
Subject: Re: net: add a hardware buffer management helper API
Message-Id: <87io0joid5.fsf@free-electrons.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160316195012.GB20386@mwanda>
In-Reply-To: <20160316195012.GB20386@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,
 
 On mer., mars 16 2016, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Hello Gregory CLEMENT,
>
> The patch 8cb2d8bf57e6: "net: add a hardware buffer management helper
> API" from Mar 14, 2016, leads to the following static checker warning:
>
> 	net/core/hwbm.c:46 hwbm_pool_refill()
> 	warn: possible memory leak of 'buf'
>
> net/core/hwbm.c
>     26  /* Refill processing for HW buffer management */
>     27  int hwbm_pool_refill(struct hwbm_pool *bm_pool, gfp_t gfp)
>     28  {
>     29          int frag_size = bm_pool->frag_size;
>     30          void *buf;
>     31  
>     32          if (likely(frag_size <= PAGE_SIZE))
>     33                  buf = netdev_alloc_frag(frag_size);
>     34          else
>     35                  buf = kmalloc(frag_size, gfp);
>     36  
>     37          if (!buf)
>     38                  return -ENOMEM;
>     39  
>     40          if (bm_pool->construct)
>
> If we don't have a ->construct() then we leak memory.  This test should
> probably be moved to the start of the function or deleted.

I will prepare a patch to fix it.

Thanks,

Gregory

>
>     41                  if (bm_pool->construct(bm_pool, buf)) {
>     42                          hwbm_buf_free(bm_pool, buf);
>     43                          return -ENOMEM;
>     44                  }
>     45  
>     46          return 0;
>     47  }
>     48  EXPORT_SYMBOL_GPL(hwbm_pool_refill);
>
> regards,
> dan carpenter

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
