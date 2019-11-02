From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 02 Nov 2019 10:11:19 +0000
Subject: [bug report] caif_virtio: Introduce caif over virtio
Message-Id: <20191102101119.GA23109@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Erwan Yvin,

This is a semi-automatic email about new static checker warnings.

The patch 0d2e1a2926b1: "caif_virtio: Introduce caif over virtio" 
from Mar 20, 2013, leads to the following Smatch complaint:

    drivers/net/caif/caif_virtio.c:190 cfv_release_used_buf()
    warn: variable dereferenced before check 'cfv->genpool' (see line 180)

drivers/net/caif/caif_virtio.c
   179	
   180			free_buf_info(cfv, buf_info);
                                      ^^^
Dereference inside the function.

   181	
   182			/* watermark_tx indicates if we previously stopped the tx
   183			 * queues. If we have enough free stots in the virtio ring,
   184			 * re-establish memory reserved and open up tx queues.
   185			 */
   186			if (cfv->vq_tx->num_free <= cfv->watermark_tx)
   187				continue;
   188	
   189			/* Re-establish memory reserve */
   190			if (cfv->reserved_mem = 0 && cfv->genpool)
                                                      ^^^^^^^^^^^^
Checked too late.

   191				cfv->reserved_mem    192					gen_pool_alloc(cfv->genpool,

regards,
dan carpenter
