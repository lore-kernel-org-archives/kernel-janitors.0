From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Dec 2017 11:56:39 +0000
Subject: [PATCH] staging: ccree: cleanup a small white space issue
Message-Id: <20171208115639.6gagcps2nazzkxaq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The call to set_flow_mode() was supposed to be on the next line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ccree/ssi_aead.c b/drivers/staging/ccree/ssi_aead.c
index 5548c7b24fc9..24e56d69039e 100644
--- a/drivers/staging/ccree/ssi_aead.c
+++ b/drivers/staging/ccree/ssi_aead.c
@@ -747,8 +747,8 @@ static void cc_set_assoc_desc(struct aead_request *areq, unsigned int flow_mode,
 		dev_dbg(dev, "ASSOC buffer type DLLI\n");
 		hw_desc_init(&desc[idx]);
 		set_din_type(&desc[idx], DMA_DLLI, sg_dma_address(areq->src),
-			     areq->assoclen, NS_BIT); set_flow_mode(&desc[idx],
-			     flow_mode);
+			     areq->assoclen, NS_BIT);
+		set_flow_mode(&desc[idx], flow_mode);
 		if (ctx->auth_mode = DRV_HASH_XCBC_MAC &&
 		    areq_ctx->cryptlen > 0)
 			set_din_not_last_indication(&desc[idx]);
