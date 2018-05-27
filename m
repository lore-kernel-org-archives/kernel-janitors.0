From: Colin King <colin.king@canonical.com>
Date: Sun, 27 May 2018 21:17:02 +0000
Subject: [PATCH] ath10k: fix memory leak of tpc_stats
Message-Id: <20180527211702.23778-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently tpc_stats is allocated and is leaked on the return
path if num_tx_chain is greater than WMI_TPC_TX_N_CHAIN. Avoid
this leak by performing the check on num_tx_chain before the
allocation of tpc_stats.

Detected by CoverityScan, CID#1469422 ("Resource Leak")
Fixes: 4b190675ad06 ("ath10k: fix kernel panic while reading tpc_stats")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 46fb96ee5852..694f46fa9e14 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4470,10 +4470,6 @@ void ath10k_wmi_event_pdev_tpc_config(struct ath10k *ar, struct sk_buff *skb)
 
 	ev = (struct wmi_pdev_tpc_config_event *)skb->data;
 
-	tpc_stats = kzalloc(sizeof(*tpc_stats), GFP_ATOMIC);
-	if (!tpc_stats)
-		return;
-
 	num_tx_chain = __le32_to_cpu(ev->num_tx_chain);
 
 	if (num_tx_chain > WMI_TPC_TX_N_CHAIN) {
@@ -4482,6 +4478,10 @@ void ath10k_wmi_event_pdev_tpc_config(struct ath10k *ar, struct sk_buff *skb)
 		return;
 	}
 
+	tpc_stats = kzalloc(sizeof(*tpc_stats), GFP_ATOMIC);
+	if (!tpc_stats)
+		return;
+
 	ath10k_wmi_tpc_config_get_rate_code(rate_code, pream_table,
 					    num_tx_chain);
 
-- 
2.17.0

