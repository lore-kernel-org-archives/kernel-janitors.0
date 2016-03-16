From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Mar 2016 19:50:12 +0000
Subject: re: net: add a hardware buffer management helper API
Message-Id: <20160316195012.GB20386@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Gregory CLEMENT,

The patch 8cb2d8bf57e6: "net: add a hardware buffer management helper
API" from Mar 14, 2016, leads to the following static checker warning:

	net/core/hwbm.c:46 hwbm_pool_refill()
	warn: possible memory leak of 'buf'

net/core/hwbm.c
    26  /* Refill processing for HW buffer management */
    27  int hwbm_pool_refill(struct hwbm_pool *bm_pool, gfp_t gfp)
    28  {
    29          int frag_size = bm_pool->frag_size;
    30          void *buf;
    31  
    32          if (likely(frag_size <= PAGE_SIZE))
    33                  buf = netdev_alloc_frag(frag_size);
    34          else
    35                  buf = kmalloc(frag_size, gfp);
    36  
    37          if (!buf)
    38                  return -ENOMEM;
    39  
    40          if (bm_pool->construct)

If we don't have a ->construct() then we leak memory.  This test should
probably be moved to the start of the function or deleted.

    41                  if (bm_pool->construct(bm_pool, buf)) {
    42                          hwbm_buf_free(bm_pool, buf);
    43                          return -ENOMEM;
    44                  }
    45  
    46          return 0;
    47  }
    48  EXPORT_SYMBOL_GPL(hwbm_pool_refill);

regards,
dan carpenter
