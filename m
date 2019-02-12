From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Feb 2019 16:08:07 +0000
Subject: [PATCH] qlge: fix some indentation issues
Message-Id: <20190212160807.12807-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some statements that are indented incorrectly. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c | 4 ++--
 drivers/net/ethernet/qlogic/qlge/qlge_main.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c b/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c
index 5edbd532127d..a6886cc5654c 100644
--- a/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c
+++ b/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c
@@ -249,8 +249,8 @@ static void ql_update_stats(struct ql_adapter *qdev)
 
 	spin_lock(&qdev->stats_lock);
 	if (ql_sem_spinlock(qdev, qdev->xg_sem_mask)) {
-			netif_err(qdev, drv, qdev->ndev,
-				  "Couldn't get xgmac sem.\n");
+		netif_err(qdev, drv, qdev->ndev,
+			  "Couldn't get xgmac sem.\n");
 		goto quit;
 	}
 	/*
diff --git a/drivers/net/ethernet/qlogic/qlge/qlge_main.c b/drivers/net/ethernet/qlogic/qlge/qlge_main.c
index 059ba9429e51..096515c27263 100644
--- a/drivers/net/ethernet/qlogic/qlge/qlge_main.c
+++ b/drivers/net/ethernet/qlogic/qlge/qlge_main.c
@@ -1159,10 +1159,10 @@ static void ql_update_lbq(struct ql_adapter *qdev, struct rx_ring *rx_ring)
 
 			map = lbq_desc->p.pg_chunk.map +
 				lbq_desc->p.pg_chunk.offset;
-				dma_unmap_addr_set(lbq_desc, mapaddr, map);
+			dma_unmap_addr_set(lbq_desc, mapaddr, map);
 			dma_unmap_len_set(lbq_desc, maplen,
 					rx_ring->lbq_buf_size);
-				*lbq_desc->addr = cpu_to_le64(map);
+			*lbq_desc->addr = cpu_to_le64(map);
 
 			pci_dma_sync_single_for_device(qdev->pdev, map,
 						rx_ring->lbq_buf_size,
-- 
2.20.1
