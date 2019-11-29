From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Nov 2019 17:36:35 +0000
Subject: [PATCH] Bluetooth: btusb: fix memory leak on fw
Message-Id: <20191129173635.87479-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error return path when the call to btusb_mtk_hci_wmt_sync
fails does not free fw.  Fix this by returning via the error_release_fw
label that performs the free'ing.

Addresses-Coverity: ("Resource leak")
Fixes: a1c49c434e15 ("Bluetooth: btusb: Add protocol support for MediaTek MT7668U USB devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bluetooth/btusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 9b587e662b48..d9cd0677d41c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2867,7 +2867,7 @@ static int btusb_mtk_setup_firmware(struct hci_dev *hdev, const char *fwname)
 	err = btusb_mtk_hci_wmt_sync(hdev, &wmt_params);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to send wmt rst (%d)", err);
-		return err;
+		goto err_release_fw;
 	}
 
 	/* Wait a few moments for firmware activation done */
-- 
2.24.0
