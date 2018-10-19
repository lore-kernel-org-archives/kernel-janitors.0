From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 12:52:39 +0000
Subject: [PATCH net-next] octeontx2-af: Remove set but not used variables 'devnum, is_pf'
Message-Id: <1539954186-193695-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539243427-25309-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539243427-25309-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/marvell/octeontx2/af/rvu.c: In function 'rvu_detach_rsrcs':
drivers/net/ethernet/marvell/octeontx2/af/rvu.c:855:6: warning:
 variable 'devnum' set but not used [-Wunused-but-set-variable]
 
drivers/net/ethernet/marvell/octeontx2/af/rvu.c:853:7: warning:
 variable 'is_pf' set but not used [-Wunused-but-set-variable]

drivers/net/ethernet/marvell/octeontx2/af/rvu.c: In function 'rvu_mbox_handler_ATTACH_RESOURCES':
drivers/net/ethernet/marvell/octeontx2/af/rvu.c:1054:7: warning:
 variable 'is_pf' set but not used [-Wunused-but-set-variable]

drivers/net/ethernet/marvell/octeontx2/af/rvu.c:1053:6: warning:
 variable 'devnum' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit
746ea74241fa ("octeontx2-af: Add RVU block LF provisioning support")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
index c06cca9..60b3623 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
@@ -914,18 +914,9 @@ static int rvu_detach_rsrcs(struct rvu *rvu, struct rsrc_detach *detach,
 			    u16 pcifunc)
 {
 	struct rvu_hwinfo *hw = rvu->hw;
-	bool is_pf, detach_all = true;
+	bool detach_all = true;
 	struct rvu_block *block;
-	int devnum, blkid;
-
-	/* Check if this is for a RVU PF or VF */
-	if (pcifunc & RVU_PFVF_FUNC_MASK) {
-		is_pf = false;
-		devnum = rvu_get_hwvf(rvu, pcifunc);
-	} else {
-		is_pf = true;
-		devnum = rvu_get_pf(pcifunc);
-	}
+	int blkid;
 
 	spin_lock(&rvu->rsrc_lock);
 
@@ -1114,22 +1105,12 @@ static int rvu_mbox_handler_ATTACH_RESOURCES(struct rvu *rvu,
 					     struct msg_rsp *rsp)
 {
 	u16 pcifunc = attach->hdr.pcifunc;
-	int devnum, err;
-	bool is_pf;
+	int err;
 
 	/* If first request, detach all existing attached resources */
 	if (!attach->modify)
 		rvu_detach_rsrcs(rvu, NULL, pcifunc);
 
-	/* Check if this is for a RVU PF or VF */
-	if (pcifunc & RVU_PFVF_FUNC_MASK) {
-		is_pf = false;
-		devnum = rvu_get_hwvf(rvu, pcifunc);
-	} else {
-		is_pf = true;
-		devnum = rvu_get_pf(pcifunc);
-	}
-
 	spin_lock(&rvu->rsrc_lock);
 
 	/* Check if the request can be accommodated */
