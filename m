From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Nov 2017 09:01:00 +0000
Subject: [bug report] crypto: chelsio - Move DMA un/mapping to chcr from lld cxgb4 driver
Message-Id: <20171108090100.dkk6wps55mmw2e3r@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Harsh Jain,

The patch 2f47d5804311: "crypto: chelsio - Move DMA un/mapping to
chcr from lld cxgb4 driver" from Oct 8, 2017, leads to the following
static checker warning:

	drivers/crypto/chelsio/chcr_algo.c:1138 chcr_handle_cipher_resp()
	warn: inconsistent indenting

drivers/crypto/chelsio/chcr_algo.c
  1126          if (unlikely(cxgb4_is_crypto_q_full(u_ctx->lldi.ports[0],
  1127                                              c_ctx(tfm)->tx_qidx))) {
  1128                  if (!(req->base.flags & CRYPTO_TFM_REQ_MAY_BACKLOG)) {
  1129                          err = -EBUSY;
  1130                          goto unmap;
  1131                  }
  1132  
  1133          }
  1134          if (!reqctx->imm) {
                                  ^
indent block starts here.

  1135                  bytes = chcr_sg_ent_in_wr(reqctx->srcsg, reqctx->dstsg, 1,
  1136                                            SPACE_LEFT(ablkctx->enckey_len),
  1137                                            reqctx->src_ofst, reqctx->dst_ofst);
  1138          if ((bytes + reqctx->processed) >= req->nbytes)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
not indented far enough.  Or should the close curly brace be moved?

  1139                  bytes  = req->nbytes - reqctx->processed;
  1140          else
  1141                  bytes = ROUND_16(bytes);
  1142          } else {
  1143                  /*CTR mode counter overfloa*/
  1144                  bytes  = req->nbytes - reqctx->processed;
  1145          }
  1146          dma_sync_single_for_cpu(&ULD_CTX(c_ctx(tfm))->lldi.pdev->dev,
  1147                                  reqctx->iv_dma, IV, DMA_BIDIRECTIONAL);
  1148          err = chcr_update_cipher_iv(req, fw6_pld, reqctx->iv);
  1149          dma_sync_single_for_device(&ULD_CTX(c_ctx(tfm))->lldi.pdev->dev,
  1150                                     reqctx->iv_dma, IV, DMA_BIDIRECTIONAL);
  1151          if (err)
  1152                  goto unmap;
  1153  

See also:

drivers/crypto/chelsio/chcr_algo.c:689 chcr_sg_ent_in_wr() warn: inconsistent indenting
drivers/crypto/chelsio/chcr_algo.c:1242 process_cipher() warn: inconsistent indenting
drivers/crypto/chelsio/chcr_algo.c:2401 chcr_add_hash_src_ent() warn: inconsistent indenting
drivers/crypto/chelsio/chcr_algo.c:2401 chcr_add_hash_src_ent() warn: inconsistent indenting

regards,
dan carpenter
