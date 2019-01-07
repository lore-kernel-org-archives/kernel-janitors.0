From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Jan 2019 23:48:09 +0000
Subject: [PATCH] net: cxgb4: fix various indentation issues
Message-Id: <20190107234809.14373-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjun Vynipadath <arjun@chelsio.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some lines that have indentation issues, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c | 8 ++++----
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c | 2 +-
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c
index 9f9d6cae39d5..58a039c3224a 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.c
@@ -378,10 +378,10 @@ static void cxgb4_init_ptp_timer(struct adapter *adapter)
 	int err;
 
 	memset(&c, 0, sizeof(c));
-		c.op_to_portid = cpu_to_be32(FW_CMD_OP_V(FW_PTP_CMD) |
-					     FW_CMD_REQUEST_F |
-					     FW_CMD_WRITE_F |
-					     FW_PTP_CMD_PORTID_V(0));
+	c.op_to_portid = cpu_to_be32(FW_CMD_OP_V(FW_PTP_CMD) |
+				     FW_CMD_REQUEST_F |
+				     FW_CMD_WRITE_F |
+				     FW_PTP_CMD_PORTID_V(0));
 	c.retval_len16 = cpu_to_be32(FW_CMD_LEN16_V(sizeof(c) / 16));
 	c.u.scmd.sc = FW_PTP_SC_INIT_TIMER;
 
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
index 9a6065a3fa46..c041f44324db 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
@@ -78,7 +78,7 @@ static void free_msix_idx_in_bmap(struct adapter *adap, unsigned int msix_idx)
 	unsigned long flags;
 
 	spin_lock_irqsave(&bmap->lock, flags);
-	 __clear_bit(msix_idx, bmap->msix_bmap);
+	__clear_bit(msix_idx, bmap->msix_bmap);
 	spin_unlock_irqrestore(&bmap->lock, flags);
 }
 
diff --git a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
index e8c34292a0ec..2b03f6187a24 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
@@ -3794,7 +3794,7 @@ int t4_load_phy_fw(struct adapter *adap,
 	/* If we have version number support, then check to see if the adapter
 	 * already has up-to-date PHY firmware loaded.
 	 */
-	 if (phy_fw_version) {
+	if (phy_fw_version) {
 		new_phy_fw_vers = phy_fw_version(phy_fw_data, phy_fw_size);
 		ret = t4_phy_fw_ver(adap, &cur_phy_fw_ver);
 		if (ret < 0)
-- 
2.19.1
