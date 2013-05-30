From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2013 08:01:41 +0000
Subject: [patch] NFC: mei_phy: use kfree_skb() instead of kfree()
Message-Id: <20130530080141.GC8148@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>, "moderated list:NFC SUBSYSTEM" <linux-nfc@ml01.01.org>, kernel-janitors@vger.kernel.org

This was allocated with alloc_skb() so it needs to be freed with
kfree_skb().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/nfc/mei_phy.c b/drivers/nfc/mei_phy.c
index 1201bdbf..5fbaca4 100644
--- a/drivers/nfc/mei_phy.c
+++ b/drivers/nfc/mei_phy.c
@@ -127,7 +127,7 @@ void nfc_mei_event_cb(struct mei_cl_device *device, u32 events, void *context)
 
 		reply_size = mei_cl_recv(device, skb->data, MEI_NFC_MAX_READ);
 		if (reply_size < MEI_NFC_HEADER_SIZE) {
-			kfree(skb);
+			kfree_skb(skb);
 			return;
 		}
 
