From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Nov 2013 20:22:12 +0000
Subject: re: null_blk: multi queue aware block test driver
Message-Id: <20131105202212.GF3949@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131105202134.GE3949@elgon.mountain>
In-Reply-To: <20131105202134.GE3949@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jens Axboe,

The patch f2298c0403b0: "null_blk: multi queue aware block test 
driver" from Oct 25, 2013, leads to the following
static checker warning: "drivers/block/null_blk.c:531 null_add_dev()
	 error: 'nullb->q' dereferencing possible ERR_PTR()"

drivers/block/null_blk.c
   513  
   514                          null_mq_reg.nr_hw_queues = submit_queues;
   515                  }
   516  
   517                  nullb->q = blk_mq_init_queue(&null_mq_reg, nullb);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
blk_mq_init_queue() returns an ERR_PTR on error.

   518          } else if (queue_mode = NULL_Q_BIO) {
   519                  nullb->q = blk_alloc_queue_node(GFP_KERNEL, home_node);
   520                  blk_queue_make_request(nullb->q, null_queue_bio);
   521          } else {
   522                  nullb->q = blk_init_queue_node(null_request_fn, &nullb->lock, home_node);
   523                  blk_queue_prep_rq(nullb->q, null_rq_prep_fn);
   524                  if (nullb->q)
   525                          blk_queue_softirq_done(nullb->q, null_softirq_done_fn);
   526          }
   527  
   528          if (!nullb->q)
   529                  goto queue_fail;
   530  
   531          nullb->q->queuedata = nullb;
                ^^^^^^^^^^^^^^^^^^^
Dereference.

   532          queue_flag_set_unlocked(QUEUE_FLAG_NONROT, nullb->q);

regards,
dan carpenter

