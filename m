From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Oct 2018 08:32:21 +0000
Subject: [PATCH net-next] octeontx2-af: Copy the right amount of memory
Message-Id: <20181024083221.humvwh2pefovptcd@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>
Cc: Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a copy and paste bug where we copied the sizeof() from the chunk
before.  We're copying more data than intended but the destination is a
union so it doesn't cause memory corruption.

Fixes: ffb0abd7e9cb ("octeontx2-af: NIX AQ instruction enqueue support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index 8890c95831ca..a4eac3b9ee72 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -573,7 +573,7 @@ static int rvu_nix_aq_enq_inst(struct rvu *rvu, struct nix_aq_enq_req *req,
 				       sizeof(struct nix_cq_ctx_s));
 			else if (req->ctype = NIX_AQ_CTYPE_RSS)
 				memcpy(&rsp->rss, ctx,
-				       sizeof(struct nix_cq_ctx_s));
+				       sizeof(struct nix_rsse_s));
 			else if (req->ctype = NIX_AQ_CTYPE_MCE)
 				memcpy(&rsp->mce, ctx,
 				       sizeof(struct nix_rx_mce_s));
-- 
2.11.0
