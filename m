From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 20:33:14 +0000
Subject: [PATCH] staging: wilc1000: Delete an error message for a failed memory allocation in Handle_Key()
Message-Id: <d61db605-523e-5f48-37ca-0748b41705cc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, linux-wireless@vger.kernel.org, Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 22:26:07 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/wilc1000/host_interface.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index c3a8af081880..17a31bbd3665 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -1688,7 +1688,6 @@ static int Handle_Key(struct wilc_vif *vif,
 		} else if (pstrHostIFkeyAttr->action & ADDKEY) {
 			pu8keybuf = kmalloc(PTK_KEY_MSG_LEN, GFP_KERNEL);
 			if (!pu8keybuf) {
-				netdev_err(vif->ndev, "No buffer send PTK\n");
 				ret = -ENOMEM;
 				goto _WPAPtk_end_case_;
 			}
-- 
2.13.0

