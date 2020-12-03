From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:41:35 +0000
Subject: [PATCH 2/2] usb: mtu3: mtu3_debug: remove an unused struct member
Message-Id: <X8ikv1QA3Do50D+R@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org

The "nregs" member is not used.  The code uses the "regset.nregs"
struct member instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/mtu3/mtu3_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debug.h b/drivers/usb/mtu3/mtu3_debug.h
index 3084c46017c3..9a36134b322d 100644
--- a/drivers/usb/mtu3/mtu3_debug.h
+++ b/drivers/usb/mtu3/mtu3_debug.h
@@ -19,7 +19,6 @@ struct ssusb_mtk;
 struct mtu3_regset {
 	char name[MTU3_DEBUGFS_NAME_LEN];
 	struct debugfs_regset32 regset;
-	size_t nregs;
 };
 
 struct mtu3_file_map {
-- 
2.29.2
