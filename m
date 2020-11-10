From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Nov 2020 12:39:15 +0000
Subject: [PATCH][next] Bluetooth: btrtl: fix incorrect skb allocation failure check
Message-Id: <20201110123915.3356601-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-bluetooth@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for a failed bt_skb_alloc allocation is incorrectly
checking using IS_ERR and this can lead to a null pointer dereference. Fix
this by checking for a null pointer return using the !skb idiom.

Addresses-Coverity: ("Dereference null return")
Fixes: 1996d9cad6ad ("Bluetooth: btrtl: Ask 8821C to drop old firmware")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bluetooth/btrtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 0ac0f8874ef7..12099c40f8d6 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -572,7 +572,7 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 		cmd[1] = opcode >> 8;
 
 		skb = bt_skb_alloc(sizeof(cmd), GFP_KERNEL);
-		if (IS_ERR(skb))
+		if (!skb)
 			goto out_free;
 
 		skb_put_data(skb, cmd, sizeof(cmd));
-- 
2.28.0
