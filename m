From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 12:40:38 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_staging/wlan-ng/hfa384x=3a_Delete_an_unnecess?= =?UTF-8?Q?ary_check_before_the
Message-Id: <81d89576-512e-2374-2708-0d22400a37a3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Branden Bonaby <brandonbonaby94@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Himadri Pandya <himadri18.07@gmail.com>, Nishka Dasgupta <nishkadg.linux@gmail.com>, Tim Collier <osdevtc@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Aug 2019 14:30:30 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/wlan-ng/hfa384x_usb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index 28d372a0663a..54f631c4155a 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -3070,9 +3070,7 @@ static void hfa384x_usbin_callback(struct urb *urb)
 	}			/* switch */

 exit:
-
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 }

 /*----------------------------------------------------------------
--
2.23.0
