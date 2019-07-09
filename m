From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 09 Jul 2019 01:35:30 +0000
Subject: [PATCH -next] Bluetooth: hci_qca: Use kfree_skb() instead of kfree()
Message-Id: <20190709013530.11865-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kfree_skb() instead of kfree() to free sk_buff.

Fixes: 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop baudrate change vendor event")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9a5c9c1f9484..cbae86e55aed 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -909,7 +909,7 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 		if (hdr->evt = HCI_EV_VENDOR)
 			complete(&qca->drop_ev_comp);
 
-		kfree(skb);
+		kfree_skb(skb);
 
 		return 0;
 	}
