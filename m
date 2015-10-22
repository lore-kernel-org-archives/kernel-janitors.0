From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2015 09:06:09 +0000
Subject: [patch] Bluetooth: hci_bcm: checking for ERR_PTR instead of NULL
Message-Id: <20151022090609.GA9202@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Gustavo Padovan <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

bt_skb_alloc() returns NULL on error, it never returns an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 645e66e..4937ecc 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -259,8 +259,8 @@ static int bcm_set_diag(struct hci_dev *hdev, bool enable)
 		return -ENETDOWN;
 
 	skb = bt_skb_alloc(3, GFP_KERNEL);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
+	if (!skb)
+		return -ENOMEM;
 
 	*skb_put(skb, 1) = BCM_LM_DIAG_PKT;
 	*skb_put(skb, 1) = 0xf0;
