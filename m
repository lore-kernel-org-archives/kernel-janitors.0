From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Jan 2019 17:43:49 +0000
Subject: [PATCH] usb: host: u132-hcd: fix a couple of indentation issues
Message-Id: <20190104174349.9318-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jia-Ju Bai <baijiaju1990@gmail.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two statements that are indented incorrectly and need
to be moved to a new line.  Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/u132-hcd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index 5b8a3d9530c4..934584f0a20a 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -2477,7 +2477,8 @@ static int u132_endp_urb_dequeue(struct u132 *u132, struct u132_endp *endp,
 				spin_unlock_irqrestore(&endp->queue_lock.slock,
 					irqs);
 				kfree(urbq);
-			} urb->error_count = 0;
+			}
+			urb->error_count = 0;
 			usb_hcd_giveback_urb(hcd, urb, status);
 			return 0;
 		} else if (list_empty(&endp->urb_more)) {
@@ -2982,7 +2983,8 @@ static int u132_remove(struct platform_device *pdev)
 			while (rings-- > 0) {
 				struct u132_ring *ring = &u132->ring[rings];
 				u132_ring_cancel_work(u132, ring);
-			} while (endps-- > 0) {
+			}
+			while (endps-- > 0) {
 				struct u132_endp *endp = u132->endp[endps];
 				if (endp)
 					u132_endp_cancel_work(u132, endp);
-- 
2.19.1
