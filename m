From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jan 2018 10:21:40 +0000
Subject: [PATCH] crypto: chelsio - Delete stray tabs in create_authenc_wr()
Message-Id: <20180122102140.GA23912@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harsh Jain <harsh@chelsio.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

We removed some if statements but left these statements indented too
far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index a9c894bf9c01..34a02d690548 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -2112,11 +2112,11 @@ static struct sk_buff *create_authenc_wr(struct aead_request *req,
 	error = chcr_aead_common_init(req, op_type);
 	if (error)
 		return ERR_PTR(error);
-		dnents = sg_nents_xlen(req->dst, assoclen, CHCR_DST_SG_SIZE, 0);
-		dnents += sg_nents_xlen(req->dst, req->cryptlen +
-			(op_type ? -authsize : authsize), CHCR_DST_SG_SIZE,
-			req->assoclen);
-		dnents += MIN_AUTH_SG; // For IV
+	dnents = sg_nents_xlen(req->dst, assoclen, CHCR_DST_SG_SIZE, 0);
+	dnents += sg_nents_xlen(req->dst, req->cryptlen +
+		(op_type ? -authsize : authsize), CHCR_DST_SG_SIZE,
+		req->assoclen);
+	dnents += MIN_AUTH_SG; // For IV
 
 	dst_size = get_space_for_phys_dsgl(dnents);
 	kctx_len = (ntohl(KEY_CONTEXT_CTX_LEN_V(aeadctx->key_ctx_hdr)) << 4)
