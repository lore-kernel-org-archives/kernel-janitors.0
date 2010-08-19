From: Dan Carpenter <error27@gmail.com>
Date: Thu, 19 Aug 2010 10:02:15 +0000
Subject: [patch] qlge: pull NULL check ahead of dereference
Message-Id: <20100819100214.GB6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ron Mercer <ron.mercer@qlogic.com>
Cc: linux-driver@qlogic.com, "David S. Miller" <davem@davemloft.net>, Breno Leitao <leitao@linux.vnet.ibm.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There was a dereference before NULL check issue introduced in 1e213303d
"qlge: Add tx multiqueue support."  I've pulled the NULL check of
"net_rsp" forward a couple lines to restore the original semantics.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/qlge/qlge_main.c b/drivers/net/qlge/qlge_main.c
index 8d63f69..611fba4 100644
--- a/drivers/net/qlge/qlge_main.c
+++ b/drivers/net/qlge/qlge_main.c
@@ -2223,9 +2223,12 @@ static int ql_clean_outbound_rx_ring(struct rx_ring *rx_ring)
 		prod = ql_read_sh_reg(rx_ring->prod_idx_sh_reg);
 	}
 	ql_write_cq_idx(rx_ring);
+
+	if (!net_rsp)
+		return 0;
+
 	tx_ring = &qdev->tx_ring[net_rsp->txq_idx];
-	if (__netif_subqueue_stopped(qdev->ndev, tx_ring->wq_id) &&
-					net_rsp != NULL) {
+	if (__netif_subqueue_stopped(qdev->ndev, tx_ring->wq_id)) {
 		if (atomic_read(&tx_ring->queue_stopped) &&
 		    (atomic_read(&tx_ring->tx_count) > (tx_ring->wq_len / 4)))
 			/*
