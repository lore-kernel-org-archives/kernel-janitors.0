From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Mar 2019 07:25:11 +0000
Subject: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190330072511.GA5502@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Tomas Bortoli <tomasbortoli@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a potential out of bounds if "ev->length" is too high or if the
number of reports are too many.

Fixes: c215e9397b00 ("Bluetooth: Process extended ADV report event")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  I suck at pointer math, and I don't know why the protocol
requires a "+ 1".  Please review carefully.

 net/bluetooth/hci_event.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 609fd6871c5a..ee945b3d12e1 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5417,6 +5417,7 @@ static void hci_le_ext_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	u8 num_reports = skb->data[0];
 	void *ptr = &skb->data[1];
+	void *end = &skb->data[skb->len];
 
 	hci_dev_lock(hdev);
 
@@ -5425,6 +5426,8 @@ static void hci_le_ext_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
 		u8 legacy_evt_type;
 		u16 evt_type;
 
+		if (ptr + sizeof(*ev) + ev->length + 1 > end)
+			break;
 		evt_type = __le16_to_cpu(ev->evt_type);
 		legacy_evt_type = ext_evt_type_to_legacy(evt_type);
 		if (legacy_evt_type != LE_ADV_INVALID) {
-- 
2.17.1
