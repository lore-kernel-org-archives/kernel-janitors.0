From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Jan 2019 23:39:24 +0000
Subject: [PATCH] net: cxgb3: fix various indentation issues
Message-Id: <20190107233924.14076-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjun Vynipadath <arjun@chelsio.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are handful of lines that have indentation issues, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb3/sge.c   | 12 +++++++-----
 drivers/net/ethernet/chelsio/cxgb3/t3_hw.c |  6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
index 20b6e1b3f5e3..6a80b44f2e71 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -2381,7 +2381,7 @@ static int process_responses(struct adapter *adap, struct sge_qset *qs,
 					lro_add_page(adap, qs, fl,
 						     G_RSPD_LEN(len),
 						     flags & F_RSPD_EOP);
-					 goto next_fl;
+					goto next_fl;
 				}
 
 				skb = get_packet_pg(adap, fl, q,
@@ -3214,11 +3214,13 @@ void t3_start_sge_timers(struct adapter *adap)
 	for (i = 0; i < SGE_QSETS; ++i) {
 		struct sge_qset *q = &adap->sge.qs[i];
 
-	if (q->tx_reclaim_timer.function)
-		mod_timer(&q->tx_reclaim_timer, jiffies + TX_RECLAIM_PERIOD);
+		if (q->tx_reclaim_timer.function)
+			mod_timer(&q->tx_reclaim_timer,
+				  jiffies + TX_RECLAIM_PERIOD);
 
-	if (q->rx_reclaim_timer.function)
-		mod_timer(&q->rx_reclaim_timer, jiffies + RX_RECLAIM_PERIOD);
+		if (q->rx_reclaim_timer.function)
+			mod_timer(&q->rx_reclaim_timer,
+				  jiffies + RX_RECLAIM_PERIOD);
 	}
 }
 
diff --git a/drivers/net/ethernet/chelsio/cxgb3/t3_hw.c b/drivers/net/ethernet/chelsio/cxgb3/t3_hw.c
index 080918af773c..0a9f2c596624 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/t3_hw.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/t3_hw.c
@@ -1082,7 +1082,7 @@ int t3_check_fw_version(struct adapter *adapter)
 		CH_WARN(adapter, "found newer FW version(%u.%u), "
 		        "driver compiled for version %u.%u\n", major, minor,
 			FW_VERSION_MAJOR, FW_VERSION_MINOR);
-			return 0;
+		return 0;
 	}
 	return -EINVAL;
 }
@@ -3619,7 +3619,7 @@ int t3_reset_adapter(struct adapter *adapter)
 
 static int init_parity(struct adapter *adap)
 {
-		int i, err, addr;
+	int i, err, addr;
 
 	if (t3_read_reg(adap, A_SG_CONTEXT_CMD) & F_CONTEXT_CMD_BUSY)
 		return -EBUSY;
@@ -3806,6 +3806,6 @@ int t3_replay_prep_adapter(struct adapter *adapter)
 		p->phy.ops->power_down(&p->phy, 1);
 	}
 
-return 0;
+	return 0;
 }
 
-- 
2.19.1
