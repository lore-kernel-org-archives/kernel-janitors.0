From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Mar 2018 13:42:39 +0000
Subject: [PATCH] net/usb/kalmia: use ARRAY_SIZE for various array sizing calculations
Message-Id: <20180302134239.31599-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Johannes Berg <johannes.berg@intel.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use the ARRAY_SIZE macro on a couple of arrays to determine
size of the arrays. Also fix up alignment to clean up a checkpatch
warning. Improvement suggested by Coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/usb/kalmia.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/kalmia.c b/drivers/net/usb/kalmia.c
index ce0b0b4e3a57..2243da0aa991 100644
--- a/drivers/net/usb/kalmia.c
+++ b/drivers/net/usb/kalmia.c
@@ -114,14 +114,14 @@ kalmia_init_and_get_ethernet_addr(struct usbnet *dev, u8 *ethernet_addr)
 		return -ENOMEM;
 
 	memcpy(usb_buf, init_msg_1, 12);
-	status = kalmia_send_init_packet(dev, usb_buf, sizeof(init_msg_1)
-		/ sizeof(init_msg_1[0]), usb_buf, 24);
+	status = kalmia_send_init_packet(dev, usb_buf, ARRAY_SIZE(init_msg_1),
+					 usb_buf, 24);
 	if (status != 0)
 		return status;
 
 	memcpy(usb_buf, init_msg_2, 12);
-	status = kalmia_send_init_packet(dev, usb_buf, sizeof(init_msg_2)
-		/ sizeof(init_msg_2[0]), usb_buf, 28);
+	status = kalmia_send_init_packet(dev, usb_buf, ARRAY_SIZE(init_msg_2),
+					 usb_buf, 28);
 	if (status != 0)
 		return status;
 
-- 
2.15.1

