From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 28 Feb 2020 05:02:44 +0000
Subject: [PATCH] Bluetooth: hci_h4: Fix a typo in a comment
Message-Id: <20200228050244.25304-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'transmittion' should be 'transmission'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/hci_h4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index 0b84a05a730b..4b3b14a34794 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -83,7 +83,7 @@ static int h4_close(struct hci_uart *hu)
 	return 0;
 }
 
-/* Enqueue frame for transmittion (padding, crc, etc) */
+/* Enqueue frame for transmission (padding, crc, etc) */
 static int h4_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 {
 	struct h4_struct *h4 = hu->priv;
-- 
2.20.1
