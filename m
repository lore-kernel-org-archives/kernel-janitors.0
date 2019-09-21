From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Sep 2019 06:01:45 +0000
Subject: [PATCH] wil6210: use after free in wil_netif_rx_any()
Message-Id: <20190921060145.GD18726@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maya Erez <merez@codeaurora.org>, Dedy Lansky <dlansky@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, kernel-janitors@vger.kernel.org

The debug code dereferences "skb" to print "skb->len" so we have to
print the message before we free "skb".

Fixes: f99fe49ff372 ("wil6210: add wil_netif_rx() helper function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/wil6210/txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/txrx.c b/drivers/net/wireless/ath/wil6210/txrx.c
index cb13652491ad..598c1fba9dac 100644
--- a/drivers/net/wireless/ath/wil6210/txrx.c
+++ b/drivers/net/wireless/ath/wil6210/txrx.c
@@ -1012,11 +1012,11 @@ void wil_netif_rx_any(struct sk_buff *skb, struct net_device *ndev)
 	skb_orphan(skb);
 
 	if (security && (wil->txrx_ops.rx_crypto_check(wil, skb) != 0)) {
+		wil_dbg_txrx(wil, "Rx drop %d bytes\n", skb->len);
 		dev_kfree_skb(skb);
 		ndev->stats.rx_dropped++;
 		stats->rx_replay++;
 		stats->rx_dropped++;
-		wil_dbg_txrx(wil, "Rx drop %d bytes\n", skb->len);
 		return;
 	}
 
-- 
2.20.1
