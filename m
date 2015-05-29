From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2015 15:02:39 +0000
Subject: re: cxgb4/cxgb4vf: Add code to calculate T5 BAR2 Offsets for SGE Queue Registers
Message-Id: <20150529150239.GC10313@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Hariprasad Shenai,

The patch e85c9a7abfa4: "cxgb4/cxgb4vf: Add code to calculate T5 BAR2
Offsets for SGE Queue Registers" from Dec 3, 2014, leads to the
following static checker warning:

	drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:5358 t4_bar2_sge_qregs()
	warn: should '(qid >> qpp_shift) << page_shift' be a 64 bit type?

drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
  5326  int t4_bar2_sge_qregs(struct adapter *adapter,
  5327                        unsigned int qid,
  5328                        enum t4_bar2_qtype qtype,
  5329                        u64 *pbar2_qoffset,
  5330                        unsigned int *pbar2_qid)
  5331  {
  5332          unsigned int page_shift, page_size, qpp_shift, qpp_mask;
  5333          u64 bar2_page_offset, bar2_qoffset;
  5334          unsigned int bar2_qid, bar2_qid_offset, bar2_qinferred;
  5335  
  5336          /* T4 doesn't support BAR2 SGE Queue registers.
  5337           */
  5338          if (is_t4(adapter->params.chip))
  5339                  return -EINVAL;
  5340  
  5341          /* Get our SGE Page Size parameters.
  5342           */
  5343          page_shift = adapter->params.sge.hps + 10;
  5344          page_size = 1 << page_shift;
  5345  
  5346          /* Get the right Queues per Page parameters for our Queue.
  5347           */
  5348          qpp_shift = (qtype = T4_BAR2_QTYPE_EGRESS
  5349                       ? adapter->params.sge.eq_qpp
  5350                       : adapter->params.sge.iq_qpp);
  5351          qpp_mask = (1 << qpp_shift) - 1;
  5352  
  5353          /*  Calculate the basics of the BAR2 SGE Queue register area:
  5354           *  o The BAR2 page the Queue registers will be in.
  5355           *  o The BAR2 Queue ID.
  5356           *  o The BAR2 Queue ID Offset into the BAR2 page.
  5357           */
  5358          bar2_page_offset = ((qid >> qpp_shift) << page_shift);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The static checker is complaining that it can not use the high 32 bytes
unless we add a cast.  This is using custom page sizes here so I'm not
sure exactly what's going on or if declaring this as u64 was necessary.

  5359          bar2_qid = qid & qpp_mask;
  5360          bar2_qid_offset = bar2_qid * SGE_UDB_SIZE;

regards,
dan carpenter
