From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 04 Dec 2019 05:43:55 +0000
Subject: [PATCH] rt2x00usb: Fix a warning message in 'rt2x00usb_watchdog_tx_dma()'
Message-Id: <20191204054355.11729-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sgruszka@redhat.com, helmut.schaa@googlemail.com, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'forced' is duplicated in the message, axe one of them.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index bc2dfef0de22..92e9e023c349 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -522,7 +522,7 @@ EXPORT_SYMBOL_GPL(rt2x00usb_flush_queue);
 
 static void rt2x00usb_watchdog_tx_dma(struct data_queue *queue)
 {
-	rt2x00_warn(queue->rt2x00dev, "TX queue %d DMA timed out, invoke forced forced reset\n",
+	rt2x00_warn(queue->rt2x00dev, "TX queue %d DMA timed out, invoke forced reset\n",
 		    queue->qid);
 
 	rt2x00queue_stop_queue(queue);
-- 
2.20.1
