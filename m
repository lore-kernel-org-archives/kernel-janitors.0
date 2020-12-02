From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Dec 2020 06:57:02 +0000
Subject: [PATCH net-next] octeontx2-af: debugfs: delete dead code
Message-Id: <X8c6vpapJDYI2eWI@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>
Cc: Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These debugfs never return NULL so all this code will never be run.

In the normal case, (and in this case particularly), the debugfs
functions are not supposed to be checked for errors so all this error
checking code can be safely deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../marvell/octeontx2/af/rvu_debugfs.c        | 255 ++++--------------
 1 file changed, 52 insertions(+), 203 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
index c383efc6b90c..d27543c1a166 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
@@ -1368,119 +1368,52 @@ RVU_DEBUG_SEQ_FOPS(nix_qsize, nix_qsize_display, nix_qsize_write);
 
 static void rvu_dbg_nix_init(struct rvu *rvu, int blkaddr)
 {
-	const struct device *dev = &rvu->pdev->dev;
 	struct nix_hw *nix_hw;
-	struct dentry *pfile;
 
 	if (!is_block_implemented(rvu->hw, blkaddr))
 		return;
 
 	if (blkaddr = BLKADDR_NIX0) {
 		rvu->rvu_dbg.nix = debugfs_create_dir("nix", rvu->rvu_dbg.root);
-		if (!rvu->rvu_dbg.nix) {
-			dev_err(rvu->dev, "create debugfs dir failed for nix\n");
-			return;
-		}
 		nix_hw = &rvu->hw->nix[0];
 	} else {
 		rvu->rvu_dbg.nix = debugfs_create_dir("nix1",
 						      rvu->rvu_dbg.root);
-		if (!rvu->rvu_dbg.nix) {
-			dev_err(rvu->dev,
-				"create debugfs dir failed for nix1\n");
-			return;
-		}
 		nix_hw = &rvu->hw->nix[1];
 	}
 
-	pfile = debugfs_create_file("sq_ctx", 0600, rvu->rvu_dbg.nix, nix_hw,
-				    &rvu_dbg_nix_sq_ctx_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("rq_ctx", 0600, rvu->rvu_dbg.nix, nix_hw,
-				    &rvu_dbg_nix_rq_ctx_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("cq_ctx", 0600, rvu->rvu_dbg.nix, nix_hw,
-				    &rvu_dbg_nix_cq_ctx_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("ndc_tx_cache", 0600, rvu->rvu_dbg.nix,
-				    nix_hw, &rvu_dbg_nix_ndc_tx_cache_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("ndc_rx_cache", 0600, rvu->rvu_dbg.nix,
-				    nix_hw, &rvu_dbg_nix_ndc_rx_cache_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("ndc_tx_hits_miss", 0600, rvu->rvu_dbg.nix,
-				    nix_hw,
-				    &rvu_dbg_nix_ndc_tx_hits_miss_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("ndc_rx_hits_miss", 0600, rvu->rvu_dbg.nix,
-				    nix_hw,
-				    &rvu_dbg_nix_ndc_rx_hits_miss_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("qsize", 0600, rvu->rvu_dbg.nix, rvu,
-				    &rvu_dbg_nix_qsize_fops);
-	if (!pfile)
-		goto create_failed;
-
-	return;
-create_failed:
-	dev_err(dev,
-		"Failed to create debugfs dir/file for NIX blk\n");
-	debugfs_remove_recursive(rvu->rvu_dbg.nix);
+	debugfs_create_file("sq_ctx", 0600, rvu->rvu_dbg.nix, nix_hw,
+			    &rvu_dbg_nix_sq_ctx_fops);
+	debugfs_create_file("rq_ctx", 0600, rvu->rvu_dbg.nix, nix_hw,
+			    &rvu_dbg_nix_rq_ctx_fops);
+	debugfs_create_file("cq_ctx", 0600, rvu->rvu_dbg.nix, nix_hw,
+			    &rvu_dbg_nix_cq_ctx_fops);
+	debugfs_create_file("ndc_tx_cache", 0600, rvu->rvu_dbg.nix, nix_hw,
+			    &rvu_dbg_nix_ndc_tx_cache_fops);
+	debugfs_create_file("ndc_rx_cache", 0600, rvu->rvu_dbg.nix, nix_hw,
+			    &rvu_dbg_nix_ndc_rx_cache_fops);
+	debugfs_create_file("ndc_tx_hits_miss", 0600, rvu->rvu_dbg.nix, nix_hw,
+			    &rvu_dbg_nix_ndc_tx_hits_miss_fops);
+	debugfs_create_file("ndc_rx_hits_miss", 0600, rvu->rvu_dbg.nix, nix_hw,
+			    &rvu_dbg_nix_ndc_rx_hits_miss_fops);
+	debugfs_create_file("qsize", 0600, rvu->rvu_dbg.nix, rvu,
+			    &rvu_dbg_nix_qsize_fops);
 }
 
 static void rvu_dbg_npa_init(struct rvu *rvu)
 {
-	const struct device *dev = &rvu->pdev->dev;
-	struct dentry *pfile;
-
 	rvu->rvu_dbg.npa = debugfs_create_dir("npa", rvu->rvu_dbg.root);
-	if (!rvu->rvu_dbg.npa)
-		return;
-
-	pfile = debugfs_create_file("qsize", 0600, rvu->rvu_dbg.npa, rvu,
-				    &rvu_dbg_npa_qsize_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("aura_ctx", 0600, rvu->rvu_dbg.npa, rvu,
-				    &rvu_dbg_npa_aura_ctx_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("pool_ctx", 0600, rvu->rvu_dbg.npa, rvu,
-				    &rvu_dbg_npa_pool_ctx_fops);
-	if (!pfile)
-		goto create_failed;
 
-	pfile = debugfs_create_file("ndc_cache", 0600, rvu->rvu_dbg.npa, rvu,
-				    &rvu_dbg_npa_ndc_cache_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("ndc_hits_miss", 0600, rvu->rvu_dbg.npa,
-				    rvu, &rvu_dbg_npa_ndc_hits_miss_fops);
-	if (!pfile)
-		goto create_failed;
-
-	return;
-
-create_failed:
-	dev_err(dev, "Failed to create debugfs dir/file for NPA\n");
-	debugfs_remove_recursive(rvu->rvu_dbg.npa);
+	debugfs_create_file("qsize", 0600, rvu->rvu_dbg.npa, rvu,
+			    &rvu_dbg_npa_qsize_fops);
+	debugfs_create_file("aura_ctx", 0600, rvu->rvu_dbg.npa, rvu,
+			    &rvu_dbg_npa_aura_ctx_fops);
+	debugfs_create_file("pool_ctx", 0600, rvu->rvu_dbg.npa, rvu,
+			    &rvu_dbg_npa_pool_ctx_fops);
+	debugfs_create_file("ndc_cache", 0600, rvu->rvu_dbg.npa, rvu,
+			    &rvu_dbg_npa_ndc_cache_fops);
+	debugfs_create_file("ndc_hits_miss", 0600, rvu->rvu_dbg.npa, rvu,
+			    &rvu_dbg_npa_ndc_hits_miss_fops);
 }
 
 #define PRINT_CGX_CUML_NIXRX_STATUS(idx, name)				\
@@ -1614,8 +1547,6 @@ RVU_DEBUG_SEQ_FOPS(cgx_stat, cgx_stat_display, NULL);
 
 static void rvu_dbg_cgx_init(struct rvu *rvu)
 {
-	const struct device *dev = &rvu->pdev->dev;
-	struct dentry *pfile;
 	int i, lmac_id;
 	char dname[20];
 	void *cgx;
@@ -1636,18 +1567,10 @@ static void rvu_dbg_cgx_init(struct rvu *rvu)
 			rvu->rvu_dbg.lmac  				debugfs_create_dir(dname, rvu->rvu_dbg.cgx);
 
-			pfile =	debugfs_create_file("stats", 0600,
-						    rvu->rvu_dbg.lmac, cgx,
-						    &rvu_dbg_cgx_stat_fops);
-			if (!pfile)
-				goto create_failed;
+			debugfs_create_file("stats", 0600, rvu->rvu_dbg.lmac,
+					    cgx, &rvu_dbg_cgx_stat_fops);
 		}
 	}
-	return;
-
-create_failed:
-	dev_err(dev, "Failed to create debugfs dir/file for CGX\n");
-	debugfs_remove_recursive(rvu->rvu_dbg.cgx_root);
 }
 
 /* NPC debugfs APIs */
@@ -1970,33 +1893,14 @@ RVU_DEBUG_SEQ_FOPS(npc_mcam_rules, npc_mcam_show_rules, NULL);
 
 static void rvu_dbg_npc_init(struct rvu *rvu)
 {
-	const struct device *dev = &rvu->pdev->dev;
-	struct dentry *pfile;
-
 	rvu->rvu_dbg.npc = debugfs_create_dir("npc", rvu->rvu_dbg.root);
-	if (!rvu->rvu_dbg.npc)
-		return;
 
-	pfile = debugfs_create_file("mcam_info", 0444, rvu->rvu_dbg.npc,
-				    rvu, &rvu_dbg_npc_mcam_info_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("mcam_rules", 0444, rvu->rvu_dbg.npc,
-				    rvu, &rvu_dbg_npc_mcam_rules_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("rx_miss_act_stats", 0444, rvu->rvu_dbg.npc,
-				    rvu, &rvu_dbg_npc_rx_miss_act_fops);
-	if (!pfile)
-		goto create_failed;
-
-	return;
-
-create_failed:
-	dev_err(dev, "Failed to create debugfs dir/file for NPC\n");
-	debugfs_remove_recursive(rvu->rvu_dbg.npc);
+	debugfs_create_file("mcam_info", 0444, rvu->rvu_dbg.npc, rvu,
+			    &rvu_dbg_npc_mcam_info_fops);
+	debugfs_create_file("mcam_rules", 0444, rvu->rvu_dbg.npc, rvu,
+			    &rvu_dbg_npc_mcam_rules_fops);
+	debugfs_create_file("rx_miss_act_stats", 0444, rvu->rvu_dbg.npc, rvu,
+			    &rvu_dbg_npc_rx_miss_act_fops);
 }
 
 /* CPT debugfs APIs */
@@ -2205,84 +2109,35 @@ RVU_DEBUG_SEQ_FOPS(cpt_pc, cpt_pc_display, NULL);
 
 static void rvu_dbg_cpt_init(struct rvu *rvu)
 {
-	const struct device *dev = &rvu->pdev->dev;
-	struct dentry *pfile;
-
 	if (!is_block_implemented(rvu->hw, BLKADDR_CPT0))
 		return;
 
 	rvu->rvu_dbg.cpt = debugfs_create_dir("cpt", rvu->rvu_dbg.root);
-	if (!rvu->rvu_dbg.cpt)
-		return;
 
-	pfile = debugfs_create_file("cpt_pc", 0600,
-				    rvu->rvu_dbg.cpt, rvu,
-				    &rvu_dbg_cpt_pc_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("cpt_ae_sts", 0600,
-				    rvu->rvu_dbg.cpt, rvu,
-				    &rvu_dbg_cpt_ae_sts_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("cpt_se_sts", 0600,
-				    rvu->rvu_dbg.cpt, rvu,
-				    &rvu_dbg_cpt_se_sts_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("cpt_ie_sts", 0600,
-				    rvu->rvu_dbg.cpt, rvu,
-				    &rvu_dbg_cpt_ie_sts_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("cpt_engines_info", 0600,
-				    rvu->rvu_dbg.cpt, rvu,
-				    &rvu_dbg_cpt_engines_info_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("cpt_lfs_info", 0600,
-				    rvu->rvu_dbg.cpt, rvu,
-				    &rvu_dbg_cpt_lfs_info_fops);
-	if (!pfile)
-		goto create_failed;
-
-	pfile = debugfs_create_file("cpt_err_info", 0600,
-				    rvu->rvu_dbg.cpt, rvu,
-				    &rvu_dbg_cpt_err_info_fops);
-	if (!pfile)
-		goto create_failed;
-
-	return;
-
-create_failed:
-	dev_err(dev, "Failed to create debugfs dir/file for CPT\n");
-	debugfs_remove_recursive(rvu->rvu_dbg.cpt);
+	debugfs_create_file("cpt_pc", 0600, rvu->rvu_dbg.cpt, rvu,
+			    &rvu_dbg_cpt_pc_fops);
+	debugfs_create_file("cpt_ae_sts", 0600, rvu->rvu_dbg.cpt, rvu,
+			    &rvu_dbg_cpt_ae_sts_fops);
+	debugfs_create_file("cpt_se_sts", 0600, rvu->rvu_dbg.cpt, rvu,
+			    &rvu_dbg_cpt_se_sts_fops);
+	debugfs_create_file("cpt_ie_sts", 0600, rvu->rvu_dbg.cpt, rvu,
+			    &rvu_dbg_cpt_ie_sts_fops);
+	debugfs_create_file("cpt_engines_info", 0600, rvu->rvu_dbg.cpt, rvu,
+			    &rvu_dbg_cpt_engines_info_fops);
+	debugfs_create_file("cpt_lfs_info", 0600, rvu->rvu_dbg.cpt, rvu,
+			    &rvu_dbg_cpt_lfs_info_fops);
+	debugfs_create_file("cpt_err_info", 0600, rvu->rvu_dbg.cpt, rvu,
+			    &rvu_dbg_cpt_err_info_fops);
 }
 
 void rvu_dbg_init(struct rvu *rvu)
 {
-	struct device *dev = &rvu->pdev->dev;
-	struct dentry *pfile;
-
 	rvu->rvu_dbg.root = debugfs_create_dir(DEBUGFS_DIR_NAME, NULL);
-	if (!rvu->rvu_dbg.root) {
-		dev_err(rvu->dev, "%s failed\n", __func__);
-		return;
-	}
-	pfile = debugfs_create_file("rsrc_alloc", 0444, rvu->rvu_dbg.root, rvu,
-				    &rvu_dbg_rsrc_status_fops);
-	if (!pfile)
-		goto create_failed;
 
-	pfile = debugfs_create_file("rvu_pf_cgx_map", 0444, rvu->rvu_dbg.root,
-				    rvu, &rvu_dbg_rvu_pf_cgx_map_fops);
-	if (!pfile)
-		goto create_failed;
+	debugfs_create_file("rsrc_alloc", 0444, rvu->rvu_dbg.root, rvu,
+			    &rvu_dbg_rsrc_status_fops);
+	debugfs_create_file("rvu_pf_cgx_map", 0444, rvu->rvu_dbg.root, rvu,
+			    &rvu_dbg_rvu_pf_cgx_map_fops);
 
 	rvu_dbg_npa_init(rvu);
 	rvu_dbg_nix_init(rvu, BLKADDR_NIX0);
@@ -2291,12 +2146,6 @@ void rvu_dbg_init(struct rvu *rvu)
 	rvu_dbg_cgx_init(rvu);
 	rvu_dbg_npc_init(rvu);
 	rvu_dbg_cpt_init(rvu);
-
-	return;
-
-create_failed:
-	dev_err(dev, "Failed to create debugfs dir\n");
-	debugfs_remove_recursive(rvu->rvu_dbg.root);
 }
 
 void rvu_dbg_exit(struct rvu *rvu)
-- 
2.29.2
