From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 11:38:28 +0000
Subject: [PATCH][next] net: aquantia: fix spelling mistake: tx_queus -> tx_queues
Message-Id: <20191025113828.19710-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Egor Pomozov <epomozov@marvell.com>, Igor Russkikh <igor.russkikh@aquantia.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a netdev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
index 3ec08415e53e..232df785488c 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
@@ -533,7 +533,7 @@ void aq_ptp_tx_hwtstamp(struct aq_nic_s *aq_nic, u64 timestamp)
 	struct skb_shared_hwtstamps hwtstamp;
 
 	if (!skb) {
-		netdev_err(aq_nic->ndev, "have timestamp but tx_queus empty\n");
+		netdev_err(aq_nic->ndev, "have timestamp but tx_queues empty\n");
 		return;
 	}
 
-- 
2.20.1
