From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Sep 2014 13:33:20 +0000
Subject: re: blk-mq: cleanup after blk_mq_init_rq_map failures
Message-Id: <20140912133319.GA6704@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Robert Elliott,

The patch 5676e7b6db02: "blk-mq: cleanup after blk_mq_init_rq_map
failures" from Sep 2, 2014, leads to the following static checker
warning:

	block/blk-mq.c:2041 blk_mq_alloc_tag_set()
	warn: calling kfree() when 'set->tags' is always NULL.

block/blk-mq.c
  2027          set->tags = kmalloc_node(set->nr_hw_queues *
  2028                                   sizeof(struct blk_mq_tags *),
  2029                                   GFP_KERNEL, set->numa_node);
  2030          if (!set->tags)
  2031                  return -ENOMEM;
  2032  
  2033          if (blk_mq_alloc_rq_maps(set))
  2034                  goto enomem;
  2035  
  2036          mutex_init(&set->tag_list_lock);
  2037          INIT_LIST_HEAD(&set->tag_list);
  2038  
  2039          return 0;
  2040  enomem:
  2041          kfree(set->tags);
  2042          set->tags = NULL;
  2043          return -ENOMEM;
  2044  }

The problem with this code is that __blk_mq_alloc_rq_maps() sets
"set->tags" to NULL.  It's a layering violation and actually it will
probably Oops before we hit the goto.  Let's take a look:

block/blk-mq.c
  1948  static int __blk_mq_alloc_rq_maps(struct blk_mq_tag_set *set)
  1949  {
  1950          int i;
  1951  
  1952          for (i = 0; i < set->nr_hw_queues; i++) {
  1953                  set->tags[i] = blk_mq_init_rq_map(set, i);
  1954                  if (!set->tags[i])
  1955                          goto out_unwind;
  1956          }
  1957  
  1958          return 0;
  1959  
  1960  out_unwind:
  1961          while (--i >= 0)
  1962                  blk_mq_free_rq_map(set, set->tags[i], i);
  1963  
  1964          set->tags = NULL;
                ^^^^^^^^^^^^^^^^
Set to NULL here.

  1965          return -ENOMEM;
  1966  }
  1967  
  1968  /*
  1969   * Allocate the request maps associated with this tag_set. Note that this
  1970   * may reduce the depth asked for, if memory is tight. set->queue_depth
  1971   * will be updated to reflect the allocated depth.
  1972   */
  1973  static int blk_mq_alloc_rq_maps(struct blk_mq_tag_set *set)
  1974  {
  1975          unsigned int depth;
  1976          int err;
  1977  
  1978          depth = set->queue_depth;
  1979          do {
  1980                  err = __blk_mq_alloc_rq_maps(set);
  1981                  if (!err)
  1982                          break;
  1983  
  1984                  set->queue_depth >>= 1;
  1985                  if (set->queue_depth < set->reserved_tags + BLK_MQ_TAG_MIN) {
  1986                          err = -ENOMEM;
  1987                          break;
  1988                  }
  1989          } while (set->queue_depth);
                  ^^^^^^^^^^^^^^^^^^^^^^^^
If we loop through this loop then the second call to
__blk_mq_alloc_rq_maps() will probably Oops.

  1990  

regards,
dan carpenter
