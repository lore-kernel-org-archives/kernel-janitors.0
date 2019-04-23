From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Apr 2019 14:50:22 +0000
Subject: [PATCH] Bluetooth: hci_h5: fix spelling mistake "sliped" -> "slipped"
Message-Id: <20190423145022.9821-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a BT_DBG debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bluetooth/hci_h5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index 069d1c8fde73..3f02ae560120 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -536,7 +536,7 @@ static void h5_unslip_one_byte(struct h5 *h5, unsigned char c)
 	skb_put_data(h5->rx_skb, byte, 1);
 	h5->rx_pending--;
 
-	BT_DBG("unsliped 0x%02hhx, rx_pending %zu", *byte, h5->rx_pending);
+	BT_DBG("unslipped 0x%02hhx, rx_pending %zu", *byte, h5->rx_pending);
 }
 
 static void h5_reset_rx(struct h5 *h5)
-- 
2.20.1
