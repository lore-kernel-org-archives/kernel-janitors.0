From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 14:15:50 +0000
Subject: [bug report] cxgb4: Add support for dynamic allocation of resources for ULD
Message-Id: <20161014141550.GA10628@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Hariprasad Shenai,

The patch 94cdb8bb993a: "cxgb4: Add support for dynamic allocation of
resources for ULD" from Aug 17, 2016, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c:176 alloc_uld_rxqs()
	warn: loop skips 'i' = zero

drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
   153          for (i = 0; i < nq; i++, q++) {
   154                  if (msi_idx >= 0) {
   155                          bmap_idx = get_msix_idx_from_bmap(adap);
   156                          msi_idx = adap->msix_info_ulds[bmap_idx].idx;
   157                  }
   158                  err = t4_sge_alloc_rxq(adap, &q->rspq, false,
   159                                         adap->port[i / per_chan],
   160                                         msi_idx,
   161                                         q->fl.size ? &q->fl : NULL,
   162                                         uldrx_handler,
   163                                         lro ? uldrx_flush_handler : NULL,
   164                                         0);
   165                  if (err)
   166                          goto freeout;
   167                  if (msi_idx >= 0)
   168                          rxq_info->msix_tbl[i + offset] = bmap_idx;
   169                  memset(&q->stats, 0, sizeof(q->stats));
   170                  if (ids)
   171                          ids[i] = q->rspq.abs_id;
   172          }
   173          return 0;
   174  freeout:
   175          q = rxq_info->uldrxq + offset;
   176          for ( ; i; i--, q++) {
   177                  if (q->rspq.desc)
   178                          free_rspq_fl(adap, &q->rspq,
   179                                       q->fl.size ? &q->fl : NULL);
   180          }
   181  
   182          /* We need to free rxq also in case of ciq allocation failure */
   183          if (offset) {
   184                  q = rxq_info->uldrxq + offset;
   185                  for ( ; i; i--, q++) {


We exit the previous loop with i = 0 so we will never enter this loop.
This is the same loop as earlier as well...  I totally don't understand
what we are trying to do here.

   186                          if (q->rspq.desc)
   187                                  free_rspq_fl(adap, &q->rspq,
   188                                               q->fl.size ? &q->fl : NULL);
   189                  }
   190          }
   191          return err;
   192  }

regards,
dan carpenter
