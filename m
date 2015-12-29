From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 11:37:16 +0000
Subject: [PATCH] [media] msi2500: Delete an unnecessary check in msi2500_set_usb_adc()
Message-Id: <5682706C.5010504@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 12:32:41 +0100

This issue was detected by using the Coccinelle software.

Return the value from a call of the msi2500_ctrl_msg() function
without using an extra check for the variable "ret" at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/msi2500/msi2500.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index c104315..2d33033 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -839,8 +839,6 @@ static int msi2500_set_usb_adc(struct msi2500_dev *dev)
 		goto err;
 
 	ret = msi2500_ctrl_msg(dev, CMD_WREG, reg3);
-	if (ret)
-		goto err;
 err:
 	return ret;
 }
-- 
2.6.3

