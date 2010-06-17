From: Dan Carpenter <error27@gmail.com>
Date: Thu, 17 Jun 2010 12:08:47 +0000
Subject: [patch] Staging: wlan-ng: silence a sparse warning
Message-Id: <20100617120847.GJ5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This doesn't change the behavior.  It just silences a sparse warning.

drivers/staging/wlan-ng/hfa384x_usb.c:2810:62: warning: dubious: !x | !y

The point of the bitwise OR is so that a logical OR could short circuit
the second call to test_and_set_bit().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index a41db5d..563017a 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -2805,11 +2805,13 @@ void hfa384x_tx_timeout(wlandevice_t *wlandev)
 
 	spin_lock_irqsave(&hw->ctlxq.lock, flags);
 
-	if (!hw->wlandev->hwremoved &&
-	    /* Note the bitwise OR, not the logical OR. */
-	    (!test_and_set_bit(WORK_TX_HALT, &hw->usb_flags) |
-	     !test_and_set_bit(WORK_RX_HALT, &hw->usb_flags))) {
-		schedule_work(&hw->usb_work);
+	if (!hw->wlandev->hwremoved) {
+		int sched;
+
+		sched = !test_and_set_bit(WORK_TX_HALT, &hw->usb_flags);
+		sched |= !test_and_set_bit(WORK_RX_HALT, &hw->usb_flags);
+		if (sched)
+			schedule_work(&hw->usb_work);
 	}
 
 	spin_unlock_irqrestore(&hw->ctlxq.lock, flags);
