From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Jan 2019 15:48:34 +0000
Subject: [PATCH] ieee802154: mcr20a: fix indentation, remove tabs
Message-Id: <20190114154834.18693-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xue Liu <liuxuenetmail@gmail.com>, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, "David S . Miller" <davem@davemloft.net>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The are a couple of statments that are one level too deep, fix this by
removing tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ieee802154/mcr20a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ieee802154/mcr20a.c b/drivers/net/ieee802154/mcr20a.c
index 44de81e5f140..c589f5ae75bb 100644
--- a/drivers/net/ieee802154/mcr20a.c
+++ b/drivers/net/ieee802154/mcr20a.c
@@ -905,9 +905,9 @@ mcr20a_irq_clean_complete(void *context)
 		}
 		break;
 	case (DAR_IRQSTS1_RXIRQ | DAR_IRQSTS1_SEQIRQ):
-			/* rx is starting */
-			dev_dbg(printdev(lp), "RX is starting\n");
-			mcr20a_handle_rx(lp);
+		/* rx is starting */
+		dev_dbg(printdev(lp), "RX is starting\n");
+		mcr20a_handle_rx(lp);
 		break;
 	case (DAR_IRQSTS1_RXIRQ | DAR_IRQSTS1_TXIRQ | DAR_IRQSTS1_SEQIRQ):
 		if (lp->is_tx) {
-- 
2.19.1
