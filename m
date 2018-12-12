From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Dec 2018 14:46:35 +0000
Subject: [bug report] octeontx2-af: Skip NIXLF check for bcast MCE entry
Message-Id: <20181212144635.GA19477@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sunil Goutham,

The patch c5e4e4d1060b: "octeontx2-af: Skip NIXLF check for bcast MCE
entry" from Dec 2, 2018, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:536 rvu_nix_aq_enq_inst()
	warn: assigning signed to unsigned: 'inst.lf = nixlf' '(-19),0-2147483646'

drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
   474  
   475          pfvf = rvu_get_pfvf(rvu, pcifunc);
   476          nixlf = rvu_get_lf(rvu, block, pcifunc, 0);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
rvu_get_lf() return -ENODEV on error.

   477  
   478          /* Skip NIXLF check for broadcast MCE entry init */
   479          if (!(!rsp && req->ctype = NIX_AQ_CTYPE_MCE)) {
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This condition would be more clear if we removed a double negative.

		if (rsp || req->ctype != NIX_AQ_CTYPE_MCE)

   480                  if (!pfvf->nixlf || nixlf < 0)

In the original code we checked if nixlf was negative outside the if
statement, but the patch moved it inside the if statement.

   481                          return NIX_AF_ERR_AF_LF_INVALID;
   482          }
   483  
   484          switch (req->ctype) {
   485          case NIX_AQ_CTYPE_RQ:
   486                  /* Check if index exceeds max no of queues */
   487                  if (!pfvf->rq_ctx || req->qidx >= pfvf->rq_ctx->qsize)
   488                          rc = NIX_AF_ERR_AQ_ENQUEUE;
   489                  break;
   490          case NIX_AQ_CTYPE_SQ:
   491                  if (!pfvf->sq_ctx || req->qidx >= pfvf->sq_ctx->qsize)
   492                          rc = NIX_AF_ERR_AQ_ENQUEUE;
   493                  break;
   494          case NIX_AQ_CTYPE_CQ:
   495                  if (!pfvf->cq_ctx || req->qidx >= pfvf->cq_ctx->qsize)
   496                          rc = NIX_AF_ERR_AQ_ENQUEUE;
   497                  break;
   498          case NIX_AQ_CTYPE_RSS:
   499                  /* Check if RSS is enabled and qidx is within range */
   500                  cfg = rvu_read64(rvu, blkaddr, NIX_AF_LFX_RSS_CFG(nixlf));
   501                  if (!(cfg & BIT_ULL(4)) || !pfvf->rss_ctx ||
   502                      (req->qidx >= (256UL << (cfg & 0xF))))
   503                          rc = NIX_AF_ERR_AQ_ENQUEUE;
   504                  break;
   505          case NIX_AQ_CTYPE_MCE:
   506                  cfg = rvu_read64(rvu, blkaddr, NIX_AF_RX_MCAST_CFG);
   507                  /* Check if index exceeds MCE list length */
   508                  if (!hw->nix0->mcast.mce_ctx ||
   509                      (req->qidx >= (256UL << (cfg & 0xF))))
   510                          rc = NIX_AF_ERR_AQ_ENQUEUE;
   511  
   512                  /* Adding multicast lists for requests from PF/VFs is not
   513                   * yet supported, so ignore this.
   514                   */
   515                  if (rsp)
   516                          rc = NIX_AF_ERR_AQ_ENQUEUE;

So we assume that we hit this case with a NULL rsp.

   517                  break;
   518          default:
   519                  rc = NIX_AF_ERR_AQ_ENQUEUE;
   520          }
   521  
   522          if (rc)
   523                  return rc;
   524  
   525          /* Check if SQ pointed SMQ belongs to this PF/VF or not */
   526          if (req->ctype = NIX_AQ_CTYPE_SQ &&
   527              ((req->op = NIX_AQ_INSTOP_INIT && req->sq.ena) ||
   528               (req->op = NIX_AQ_INSTOP_WRITE &&
   529                req->sq_mask.ena && req->sq_mask.smq && req->sq.ena))) {
   530                  if (!is_valid_txschq(rvu, blkaddr, NIX_TXSCH_LVL_SMQ,
   531                                       pcifunc, req->sq.smq))
   532                          return NIX_AF_ERR_AQ_ENQUEUE;
   533          }
   534  
   535          memset(&inst, 0, sizeof(struct nix_aq_inst_s));
   536          inst.lf = nixlf;
                ^^^^^^^^^^^^^^^^

Here we set inst.lf = -19 but inst.lf is 7 bits and unsigned.

   537          inst.cindex = req->qidx;

Then later we pass "&inst" to nix_aq_enqueue_wait(rvu, block, &inst);
and I get lost what happens after that...

regards,
dan carpenter
