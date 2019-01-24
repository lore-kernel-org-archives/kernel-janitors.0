From: Colin King <colin.king@canonical.com>
Date: Thu, 24 Jan 2019 17:22:54 +0000
Subject: [PATCH] Bluetooth: make hw_err static, reduces object code size
Message-Id: <20190124172254.13186-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array hw_err on the stack but instead make
it static. Makes the object code smaller by 45 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
 100880	  21090	   1088	 123058	  1e0b2	linux/net/bluetooth/hci_core.o

After:
   text	   data	    bss	    dec	    hex	filename
 100739	  21186	   1088	 123013	  1e085	linux/net/bluetooth/hci_core.o

(gcc version 8.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/bluetooth/hci_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 7352fe85674b..40cd6b48473a 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3401,7 +3401,7 @@ EXPORT_SYMBOL(hci_resume_dev);
 /* Reset HCI device */
 int hci_reset_dev(struct hci_dev *hdev)
 {
-	const u8 hw_err[] = { HCI_EV_HARDWARE_ERROR, 0x01, 0x00 };
+	static const u8 hw_err[] = { HCI_EV_HARDWARE_ERROR, 0x01, 0x00 };
 	struct sk_buff *skb;
 
 	skb = bt_skb_alloc(3, GFP_ATOMIC);
-- 
2.19.1
