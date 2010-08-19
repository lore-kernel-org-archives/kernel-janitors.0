From: Dan Carpenter <error27@gmail.com>
Date: Thu, 19 Aug 2010 18:52:44 +0000
Subject: [patch v2] qlge: pull NULL check ahead of dereference
Message-Id: <20100819185244.GD6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100819100214.GB6674@bicker> <20100819121942.GA14895@linux-ox1b.qlogic.org> <20100819125933.GB14895@linux-ox1b.qlogic.org>
In-Reply-To: <20100819125933.GB14895@linux-ox1b.qlogic.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Driver <Linux-Driver@qlogic.com>, "David S. Miller" <davem@davemloft.net>, Breno Leitao <leitao@linux.vnet.ibm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, kernel-

There was a dereference before NULL check issue introduced in 1e213303d
"qlge: Add tx multiqueue support."  I've pulled the NULL check of
"net_rsp" forward a couple lines to avoid that.

Also Ron Mercer says that the early exit should be above the index
write.  ql_write_cq_idx(rx_ring);

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Moved the early exit ahead of the ql_write_cq_idx()

diff --git a/drivers/net/qlge/qlge_main.c b/drivers/net/qlge/qlge_main.c
index 8d63f69..c9f9754 100644
--- a/drivers/net/qlge/qlge_main.c
+++ b/drivers/net/qlge/qlge_main.c
@@ -2222,10 +2222,11 @@ static int ql_clean_outbound_rx_ring(struct rx_ring *rx_ring)
 		ql_update_cq(rx_ring);
 		prod = ql_read_sh_reg(rx_ring->prod_idx_sh_reg);
 	}
+	if (!net_rsp)
+		return 0;
 	ql_write_cq_idx(rx_ring);
 	tx_ring = &qdev->tx_ring[net_rsp->txq_idx];
-	if (__netif_subqueue_stopped(qdev->ndev, tx_ring->wq_id) &&
-					net_rsp != NULL) {
+	if (__netif_subqueue_stopped(qdev->ndev, tx_ring->wq_id)) {
 		if (atomic_read(&tx_ring->queue_stopped) &&
 		    (atomic_read(&tx_ring->tx_count) > (tx_ring->wq_len / 4)))
 			/*
