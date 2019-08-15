From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2019 08:34:17 +0000
Subject: [PATCH] Bluetooth: hci_qca: Use kfree_skb() instead of kfree()
Message-Id: <20190815083416.GF27238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

sk_buff structs need to be freed with kfree_skb().

Fixes: 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop baudrate change vendor event")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index a054210ae866..7720e1748262 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -893,7 +893,7 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 		if (hdr->evt = HCI_EV_VENDOR)
 			complete(&qca->drop_ev_comp);
 
-		kfree(skb);
+		kfree_skb(skb);
 
 		return 0;
 	}
-- 
2.20.1
