From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jan 2018 15:07:12 +0000
Subject: [PATCH] USB: wusbcore: remove redundant re-assignment to pointer 'dev'
Message-Id: <20180126150712.6380-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dev is initialized and then re-assigned with the same value
a little later, hence the second assignment is redundant and can be
removed.

Cleans up clang warning:
drivers/usb/wusbcore/wa-nep.c:88:17: warning: Value stored to 'dev'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/wusbcore/wa-nep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/wusbcore/wa-nep.c b/drivers/usb/wusbcore/wa-nep.c
index 9fdcb6b84abf..5f0656db5482 100644
--- a/drivers/usb/wusbcore/wa-nep.c
+++ b/drivers/usb/wusbcore/wa-nep.c
@@ -93,7 +93,6 @@ static void wa_notif_dispatch(struct work_struct *ws)
 		goto out;				/* screw it */
 #endif
 	atomic_dec(&wa->notifs_queued);		/* Throttling ctl */
-	dev = &wa->usb_iface->dev;
 	size = nw->size;
 	itr = nw->data;
 
-- 
2.15.1

