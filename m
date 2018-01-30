From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Jan 2018 18:25:37 +0000
Subject: [PATCH] wireless: zd1211rw: remove redundant assignment of pointer 'q'
Message-Id: <20180130182537.5580-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Drake <dsd@gentoo.org>, Ulrich Kunitz <kune@deine-taler.de>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer q is initialized and then almost immediately afterwards being
re-assigned the same value. Remove the second redundant assignment.

Cleans up clang warning:
drivers/net/wireless/zydas/zd1211rw/zd_mac.c:503:23: warning: Value
stored to 'q' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/zydas/zd1211rw/zd_mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/zydas/zd1211rw/zd_mac.c b/drivers/net/wireless/zydas/zd1211rw/zd_mac.c
index b785742bfd9e..b01b44a5d16e 100644
--- a/drivers/net/wireless/zydas/zd1211rw/zd_mac.c
+++ b/drivers/net/wireless/zydas/zd1211rw/zd_mac.c
@@ -509,7 +509,6 @@ void zd_mac_tx_failed(struct urb *urb)
 	int found = 0;
 	int i, position = 0;
 
-	q = &mac->ack_wait_queue;
 	spin_lock_irqsave(&q->lock, flags);
 
 	skb_queue_walk(q, skb) {
-- 
2.15.1

