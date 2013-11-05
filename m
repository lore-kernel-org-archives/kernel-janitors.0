From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Nov 2013 20:21:34 +0000
Subject: re: null_blk: multi queue aware block test driver
Message-Id: <20131105202134.GE3949@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jens Axboe,

This is a semi-automatic email about new static checker warnings.

The patch f2298c0403b0: "null_blk: multi queue aware block test 
driver" from Oct 25, 2013, leads to the following Smatch complaint:

drivers/block/null_blk.c:524 null_add_dev()
	 warn: variable dereferenced before check 'nullb->q' (see line 523)

drivers/block/null_blk.c
   522			nullb->q = blk_init_queue_node(null_request_fn, &nullb->lock, home_node);
   523			blk_queue_prep_rq(nullb->q, null_rq_prep_fn);
                                          ^^^^^^^^
Dereference.

   524			if (nullb->q)
                            ^^^^^^^^
Null check.

   525				blk_queue_softirq_done(nullb->q, null_softirq_done_fn);
   526		}

regards,
dan carpenter
