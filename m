From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 09:07:48 +0000
Subject: [PATCH] libertas_tf: prevent underflow in process_cmdrequest()
Message-Id: <20180814090747.a7gcph2wa6abyimi@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Luis Carlos Cobo <luisca@cozybit.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

If recvlength is less than MESSAGE_HEADER_LEN (4) we would end up
corrupting memory.

Fixes: c305a19a0d0a ("libertas_tf: usb specific functions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis.  I'm not positive that this is a real
bug, but it's harmless to check.

diff --git a/drivers/net/wireless/marvell/libertas_tf/if_usb.c b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
index e92fc5001171..789337ea676a 100644
--- a/drivers/net/wireless/marvell/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
@@ -605,9 +605,10 @@ static inline void process_cmdrequest(int recvlength, uint8_t *recvbuff,
 {
 	unsigned long flags;
 
-	if (recvlength > LBS_CMD_BUFFER_SIZE) {
+	if (recvlength < MESSAGE_HEADER_LEN ||
+	    recvlength > LBS_CMD_BUFFER_SIZE) {
 		lbtf_deb_usbd(&cardp->udev->dev,
-			     "The receive buffer is too large\n");
+			     "The receive buffer is invalid: %d\n", recvlength);
 		kfree_skb(skb);
 		return;
 	}
