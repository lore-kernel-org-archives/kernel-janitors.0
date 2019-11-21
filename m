From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Nov 2019 09:21:46 +0000
Subject: [PATCH net-next] octeontx2-af: Fix uninitialized variable in debugfs
Message-Id: <20191121092146.hnvdwnzpirskw3wr@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>
Cc: Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If rvu_get_blkaddr() fails, then this rvu_cgx_nix_cuml_stats() returns
zero and we write some uninitialized data into the debugfs output.

On the error paths, the use of the uninitialized "*stat" is harmless,
but it will lead to a Smatch warning (static analysis) and a UBSan
warning (runtime analysis) so we should prevent that as well.

Fixes: f967488d095e ("octeontx2-af: Add per CGX port level NIX Rx/Tx counters")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
index 0bbb2eb1446e..11e5921c55b9 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
@@ -608,6 +608,8 @@ int rvu_cgx_nix_cuml_stats(struct rvu *rvu, void *cgxd, int lmac_id,
 	u16 pcifunc;
 	int pf, lf;
 
+	*stat = 0;
+
 	if (!cgxd || !rvu)
 		return -EINVAL;
 
@@ -624,7 +626,6 @@ int rvu_cgx_nix_cuml_stats(struct rvu *rvu, void *cgxd, int lmac_id,
 		return 0;
 	block = &rvu->hw->block[blkaddr];
 
-	*stat = 0;
 	for (lf = 0; lf < block->lf.max; lf++) {
 		/* Check if a lf is attached to this PF or one of its VFs */
 		if (!((block->fn_map[lf] & ~RVU_PFVF_FUNC_MASK) = (pcifunc &
-- 
2.11.0
