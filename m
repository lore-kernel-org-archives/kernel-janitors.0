From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 10 Jul 2019 06:12:22 +0000
Subject: [PATCH -next] Bluetooth: btusb: Fix error return code in btusb_mtk_setup_firmware()
Message-Id: <20190710061222.141247-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean
 Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

Fix to return error code -EINVAL from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: a1c49c434e15 ("Bluetooth: btusb: Add protocol support for MediaTek MT7668U USB devices")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bluetooth/btusb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 3876fee6ad13..5cf0734eb31b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2762,8 +2762,10 @@ static int btusb_mtk_setup_firmware(struct hci_dev *hdev, const char *fwname)
 	fw_size = fw->size;
 
 	/* The size of patch header is 30 bytes, should be skip */
-	if (fw_size < 30)
+	if (fw_size < 30) {
+		err = -EINVAL;
 		goto err_release_fw;
+	}
 
 	fw_size -= 30;
 	fw_ptr += 30;
