From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Feb 2012 07:43:31 +0000
Subject: [patch] ath9k: cleanup a min_t() cast
Message-Id: <20120201074330.GB22179@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
Cc: Jouni Malinen <jouni@qca.qualcomm.com>, Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>, Senthil Balasubramanian <senthilb@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

If the firmware was over 2G, it would cause memory corruption and the
system would die here.  Obviously we all know the firmware isn't going
to be that large but static checkers get upset.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wireless/ath/ath9k/hif_usb.c
index f317515..424aabb 100644
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -981,7 +981,7 @@ static int ath9k_hif_usb_download_fw(struct hif_device_usb *hif_dev)
 		return -ENOMEM;
 
 	while (len) {
-		transfer = min_t(int, len, 4096);
+		transfer = min_t(size_t, len, 4096);
 		memcpy(buf, data, transfer);
 
 		err = usb_control_msg(hif_dev->udev,
