From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:39:12 +0000
Subject: [PATCH] cnic: remove redundant pointer req and variable func
Message-Id: <20180704073912.15598-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer req and variable func are being assigned but are never used
hence they are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'req' set but not used [-Wunused-but-set-variable]
warning: variable 'func' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/cnic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index 4fd829b5e65d..2369b2f0d95a 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -2562,7 +2562,6 @@ static void cnic_bnx2x_delete_wait(struct cnic_dev *dev, u32 start_cid)
 
 static int cnic_bnx2x_fcoe_fw_destroy(struct cnic_dev *dev, struct kwqe *kwqe)
 {
-	struct fcoe_kwqe_destroy *req;
 	union l5cm_specific_data l5_data;
 	struct cnic_local *cp = dev->cnic_priv;
 	struct bnx2x *bp = netdev_priv(dev->netdev);
@@ -2571,7 +2570,6 @@ static int cnic_bnx2x_fcoe_fw_destroy(struct cnic_dev *dev, struct kwqe *kwqe)
 
 	cnic_bnx2x_delete_wait(dev, MAX_ISCSI_TBL_SZ);
 
-	req = (struct fcoe_kwqe_destroy *) kwqe;
 	cid = BNX2X_HW_CID(bp, cp->fcoe_init_cid);
 
 	memset(&l5_data, 0, sizeof(l5_data));
@@ -5091,13 +5089,12 @@ static int cnic_start_bnx2x_hw(struct cnic_dev *dev)
 	struct cnic_local *cp = dev->cnic_priv;
 	struct bnx2x *bp = netdev_priv(dev->netdev);
 	struct cnic_eth_dev *ethdev = cp->ethdev;
-	int func, ret;
+	int ret;
 	u32 pfid;
 
 	dev->stats_addr = ethdev->addr_drv_info_to_mcp;
 	cp->func = bp->pf_num;
 
-	func = CNIC_FUNC(cp);
 	pfid = bp->pfid;
 
 	ret = cnic_init_id_tbl(&cp->cid_tbl, MAX_ISCSI_TBL_SZ,
-- 
2.17.1

